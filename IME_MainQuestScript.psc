; ═══════════════════════════════════════════════════════════════════════════════
; IME_MainQuestScript
; Attached to: IME_MainQuest (always-running management quest)
;
; Responsibilities:
;   - Owns all active slot state and job pool arrays
;   - Drives the 24-hour board refresh timer
;   - Handles bid resolution, fulfillment, failure, and reputation
;   - Exposes functions called by terminal and dropoff scripts
;
; Architecture note:
;   Job data lives in static pre-generated arrays populated by IME_DataInit.
;   PopulateSingleSlot() picks a random JobTemplate from the appropriate tier
;   pool and applies only the urgency modifier at runtime. All other values
;   (quantity, deadline, price) come pre-baked from the job template.
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_MainQuestScript Extends Quest

; ── STRUCTS ───────────────────────────────────────────────────────────────────

; Static job definition — populated once by IME_DataInit, never modified
Struct JobTemplate
    String  resourceName
    String  companyName
    Int     companyIndex    ; index into IME_CompanyNames
    Int     quantity        ; pre-balanced order quantity
    Int     baseValue       ; per-unit credit value
    Int     deadlineHours   ; base hours before urgency modifier
    String  rarity          ; Common / Uncommon / Rare / Exotic / Unique
EndStruct

; Active board slot — populated each refresh cycle
Struct ActiveOrder
    Int     resourceTier        ; 1-5 (for rep calculation)
    String  resourceName        ; display string
    Int     resourceBaseValue   ; per-unit value (for price display)
    String  rarity              ; for display
    Int     quantity
    Int     fairPrice           ; qty * baseValue * urgencyPriceMult
    Int     awardedPrice        ; actual payout based on bid type
    Int     companyIndex        ; index into IME_CompanyNames
    String  companyName         ; display string
    Int     settlementIndex     ; always 0 (New Atlantis) in v1
    Float   postedGameTime      ; when slot was populated
    Float   awardedGameTime     ; when bid was won
    Float   deadlineGameTime    ; absolute game time deadline
    Float   deadlineHours       ; total hours from post to deadline (for display)
    Int     urgencyTier         ; 0=Normal 1=Tight 2=Rush
    Float   urgencyPriceMult    ; stored for consistent display
    Int     bidType             ; 0=Lowball 1=Fair 2=High  (-1=not yet bid)
    Bool    isAwarded           ; true once player wins the bid
    Bool    isActive            ; true if slot is populated
EndStruct

; ── EXTERNAL SCRIPT REFERENCES — wire in CK ──────────────────────────────────

IME_DataInit Property DataInit Auto

; ── CONSTANTS — tune these without touching logic ─────────────────────────────

; Reputation bounds
Int Property IME_Rep_Max        = 500   AutoReadOnly
Int Property IME_Rep_Min        = -100  AutoReadOnly

; Flat rep award per tier on completion
Int Property IME_RepComplete_T1 = 2     AutoReadOnly
Int Property IME_RepComplete_T2 = 5     AutoReadOnly
Int Property IME_RepComplete_T3 = 10    AutoReadOnly
Int Property IME_RepComplete_T4 = 20    AutoReadOnly
Int Property IME_RepComplete_T5 = 35    AutoReadOnly

; Flat rep penalty per tier on failure (applied as negative)
Int Property IME_RepFail_T1     = -1    AutoReadOnly
Int Property IME_RepFail_T2     = -3    AutoReadOnly
Int Property IME_RepFail_T3     = -8    AutoReadOnly
Int Property IME_RepFail_T4     = -20   AutoReadOnly
Int Property IME_RepFail_T5     = -40   AutoReadOnly

; Early completion bonus: max bonus = flat * this fraction
Float Property IME_EarlyBonusFraction = 0.5 AutoReadOnly

; Bid rep modifiers
Int Property IME_BidRepMod_Lowball = 1  AutoReadOnly
Int Property IME_BidRepMod_Fair    = 0  AutoReadOnly
Int Property IME_BidRepMod_High    = -1 AutoReadOnly

; Bid price multipliers
Float Property IME_BidMult_Lowball = 0.75 AutoReadOnly
Float Property IME_BidMult_Fair    = 1.0  AutoReadOnly
Float Property IME_BidMult_High    = 1.30 AutoReadOnly

; Win probability base chances by bid type
Float Property IME_WinBase_Lowball = 0.70 AutoReadOnly
Float Property IME_WinBase_Fair    = 0.45 AutoReadOnly
Float Property IME_WinBase_High    = 0.20 AutoReadOnly

; Reputation gates — minimum rep before tier is accessible
Int Property IME_RepGate_T1     = -100  AutoReadOnly
Int Property IME_RepGate_T2     = 0     AutoReadOnly
Int Property IME_RepGate_T3     = 50    AutoReadOnly
Int Property IME_RepGate_T4     = 150   AutoReadOnly
Int Property IME_RepGate_T5     = 300   AutoReadOnly

; Tier gate multipliers — hard lock at low rep
Float Property IME_TierGate_T1  = 1.00  AutoReadOnly
Float Property IME_TierGate_T2  = 0.80  AutoReadOnly
Float Property IME_TierGate_T3  = 0.50  AutoReadOnly
Float Property IME_TierGate_T4  = 0.25  AutoReadOnly
Float Property IME_TierGate_T5  = 0.10  AutoReadOnly

; Urgency tier weights (out of 100): Normal 60%, Tight 30%, Rush 10%
Int Property IME_UrgencyWeight_Normal = 60 AutoReadOnly
Int Property IME_UrgencyWeight_Tight  = 30 AutoReadOnly

; Urgency deadline multipliers (fraction of pre-baked deadline hours)
Float Property IME_UrgencyDeadlineMult_Normal = 1.00 AutoReadOnly
Float Property IME_UrgencyDeadlineMult_Tight  = 0.65 AutoReadOnly
Float Property IME_UrgencyDeadlineMult_Rush   = 0.40 AutoReadOnly

; Urgency price multipliers
Float Property IME_UrgencyPriceMult_Normal    = 1.00 AutoReadOnly
Float Property IME_UrgencyPriceMult_Tight     = 1.25 AutoReadOnly
Float Property IME_UrgencyPriceMult_Rush      = 1.50 AutoReadOnly

; Slot distribution per refresh cycle
Int Property IME_SlotDist_T1_Min    = 3  AutoReadOnly
Int Property IME_SlotDist_T1_Max    = 4  AutoReadOnly
Int Property IME_SlotDist_T2_Min    = 2  AutoReadOnly
Int Property IME_SlotDist_T2_Max    = 3  AutoReadOnly
Int Property IME_SlotDist_T3_Min    = 1  AutoReadOnly
Int Property IME_SlotDist_T3_Max    = 2  AutoReadOnly
Int Property IME_SlotDist_T4        = 1  AutoReadOnly
Int Property IME_SlotDist_T5_Chance = 30 AutoReadOnly  ; % chance of a T5 slot

; Board refresh interval in in-game hours
Float Property IME_RefreshIntervalHours = 24.0 AutoReadOnly

; Max concurrent awarded contracts
Int Property IME_MaxAwardedContracts = 4 AutoReadOnly

; Maximum total board slots: T1_Max(4) + T2_Max(3) + T3_Max(2) + T4(1) + T5(1) = 11
Int Property IME_MaxSlots = 11 AutoReadOnly

; Debug logging toggle — set False before release
Bool Property IME_DebugLogging = True Auto

; ── GLOBAL VARIABLES — wire in CK ────────────────────────────────────────────

GlobalVariable Property IME_Reputation      Auto
GlobalVariable Property IME_LastRefreshTime Auto

; ── QUEST REFERENCES — wire in CK ────────────────────────────────────────────

Quest[] Property IME_ContractQuests Auto

; ── JOB POOL ARRAYS — populated by IME_DataInit.InitAll() ────────────────────

JobTemplate[] IME_JobPool_T1
JobTemplate[] IME_JobPool_T2
JobTemplate[] IME_JobPool_T3
JobTemplate[] IME_JobPool_T4
JobTemplate[] IME_JobPool_T5

Int IME_Tier1_JobCount = 0
Int IME_Tier2_JobCount = 0
Int IME_Tier3_JobCount = 0
Int IME_Tier4_JobCount = 0
Int IME_Tier5_JobCount = 0

; ── COMPANY DATA — populated by IME_DataInit.InitCompanyData() ───────────────

Int      IME_CompanyCount = 0
String[] IME_CompanyNames
Int[]    IME_CompanySettlement

; ── ACTIVE BOARD STATE ───────────────────────────────────────────────────────

ActiveOrder[] IME_Slots

; ── SETTLEMENT NAMES ─────────────────────────────────────────────────────────

String[] IME_SettlementNames

; ── BID RESULT SCRATCH — read by exchange terminal after BidOnSlot() ─────────

Bool Property IME_LastBidResult    = False Auto
Int  Property IME_LastBidSlotIndex = -1    Auto

; ═══════════════════════════════════════════════════════════════════════════════
; LIFECYCLE
; ═══════════════════════════════════════════════════════════════════════════════

Event OnInit()
    IMELog("OnInit started")

    ; DataInit populates all job pools and company data
    DataInit.InitAll()
    IMELog("DataInit complete — T1:" + IME_Tier1_JobCount + \
           " T2:" + IME_Tier2_JobCount + " T3:" + IME_Tier3_JobCount + \
           " T4:" + IME_Tier4_JobCount + " T5:" + IME_Tier5_JobCount)

    InitSettlementNames()
    InitSlots()

    IME_Reputation.SetValueInt(0)
    IME_LastRefreshTime.SetValueFloat(0.0)

    PopulateSlots()
    RegisterForUpdateGameTime(IME_RefreshIntervalHours)

    IMELog("OnInit complete")
EndEvent

Event OnUpdateGameTime()
    CheckDeadlines()
    Float lastRefresh = IME_LastRefreshTime.GetValue() as Float
    Float currentTime = Utility.GetCurrentGameTime()
    If (currentTime - lastRefresh) >= (IME_RefreshIntervalHours / 24.0)
        PopulateSlots()
    EndIf
    RegisterForUpdateGameTime(IME_RefreshIntervalHours)
EndEvent

; ═══════════════════════════════════════════════════════════════════════════════
; SLOT MANAGEMENT
; ═══════════════════════════════════════════════════════════════════════════════

Function InitSlots()
    IME_Slots = new ActiveOrder[11]
    Int i = 0
    While i < 11
        IME_Slots[i] = new ActiveOrder
        IME_Slots[i].isActive  = False
        IME_Slots[i].isAwarded = False
        i += 1
    EndWhile
EndFunction

Function PopulateSlots()
    ; Clear all open (non-awarded) slots
    Int i = 0
    While i < IME_MaxSlots
        If IME_Slots[i].isActive && !IME_Slots[i].isAwarded
            IME_Slots[i].isActive = False
        EndIf
        i += 1
    EndWhile

    Int t1Count = Utility.RandomInt(IME_SlotDist_T1_Min, IME_SlotDist_T1_Max)
    Int t2Count = Utility.RandomInt(IME_SlotDist_T2_Min, IME_SlotDist_T2_Max)
    Int t3Count = Utility.RandomInt(IME_SlotDist_T3_Min, IME_SlotDist_T3_Max)
    Int t4Count = IME_SlotDist_T4
    Int t5Count = 0
    If Utility.RandomInt(1, 100) <= IME_SlotDist_T5_Chance
        t5Count = 1
    EndIf

    IMELog("PopulateSlots — T1:" + t1Count + " T2:" + t2Count + \
           " T3:" + t3Count + " T4:" + t4Count + " T5:" + t5Count)

    Int slotIdx = 0
    slotIdx = FillTierSlots(1, t1Count, slotIdx)
    slotIdx = FillTierSlots(2, t2Count, slotIdx)
    slotIdx = FillTierSlots(3, t3Count, slotIdx)
    slotIdx = FillTierSlots(4, t4Count, slotIdx)
    slotIdx = FillTierSlots(5, t5Count, slotIdx)

    IME_LastRefreshTime.SetValueFloat(Utility.GetCurrentGameTime())
EndFunction

Int Function FillTierSlots(Int aiTier, Int aiCount, Int aiStartSlot)
    Int filled  = 0
    Int slotIdx = aiStartSlot
    While filled < aiCount && slotIdx < IME_MaxSlots
        If !IME_Slots[slotIdx].isAwarded
            PopulateSingleSlot(aiTier, slotIdx)
            filled += 1
        EndIf
        slotIdx += 1
    EndWhile
    Return slotIdx
EndFunction

Function PopulateSingleSlot(Int aiTier, Int aiSlotIndex)
    ; Pick a random job from the tier pool
    Int poolCount = GetTierJobCount(aiTier)
    Int jobIdx    = Utility.RandomInt(0, poolCount - 1)
    JobTemplate job = GetJobFromPool(aiTier, jobIdx)

    ; Roll urgency modifier
    Int urgency               = RollUrgencyTier()
    Float urgencyPriceMult    = GetUrgencyPriceMult(urgency)
    Float urgencyDeadlineMult = GetUrgencyDeadlineMult(urgency)

    ; Fair price: pre-baked qty * value scaled by urgency
    Int fairPrice = (job.quantity * job.baseValue * urgencyPriceMult) as Int

    ; Deadline: pre-baked hours scaled by urgency
    Float finalHours = job.deadlineHours * urgencyDeadlineMult
    Float deadlineGT = Utility.GetCurrentGameTime() + (finalHours / 24.0)

    IME_Slots[aiSlotIndex].resourceTier      = aiTier
    IME_Slots[aiSlotIndex].resourceName      = job.resourceName
    IME_Slots[aiSlotIndex].resourceBaseValue = job.baseValue
    IME_Slots[aiSlotIndex].rarity            = job.rarity
    IME_Slots[aiSlotIndex].quantity          = job.quantity
    IME_Slots[aiSlotIndex].fairPrice         = fairPrice
    IME_Slots[aiSlotIndex].awardedPrice      = 0
    IME_Slots[aiSlotIndex].companyIndex      = job.companyIndex
    IME_Slots[aiSlotIndex].companyName       = job.companyName
    IME_Slots[aiSlotIndex].settlementIndex   = 0
    IME_Slots[aiSlotIndex].postedGameTime    = Utility.GetCurrentGameTime()
    IME_Slots[aiSlotIndex].awardedGameTime   = 0.0
    IME_Slots[aiSlotIndex].deadlineGameTime  = deadlineGT
    IME_Slots[aiSlotIndex].deadlineHours     = finalHours
    IME_Slots[aiSlotIndex].urgencyTier       = urgency
    IME_Slots[aiSlotIndex].urgencyPriceMult  = urgencyPriceMult
    IME_Slots[aiSlotIndex].bidType           = -1
    IME_Slots[aiSlotIndex].isAwarded         = False
    IME_Slots[aiSlotIndex].isActive          = True

    IMELog("Slot[" + aiSlotIndex + "] T" + aiTier + " — " + job.resourceName + \
           " x" + job.quantity + " → " + job.companyName + \
           " | fair=" + fairPrice + " urgency=" + urgency + \
           " hours=" + (finalHours as Int))
EndFunction

Function ClearSlot(Int aiSlotIndex)
    IME_Slots[aiSlotIndex].isActive  = False
    IME_Slots[aiSlotIndex].isAwarded = False
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; BIDDING
; ═══════════════════════════════════════════════════════════════════════════════

Bool Function BidOnSlot(Int aiSlotIndex, Int aiBidType)
    If aiSlotIndex < 0 || aiSlotIndex >= IME_MaxSlots
        Return False
    EndIf
    If !IME_Slots[aiSlotIndex].isActive || IME_Slots[aiSlotIndex].isAwarded
        Return False
    EndIf
    If GetAwardedContractCount() >= IME_MaxAwardedContracts
        IMELog("BidOnSlot[" + aiSlotIndex + "] rejected — at max contracts")
        IME_LastBidResult    = False
        IME_LastBidSlotIndex = aiSlotIndex
        Return False
    EndIf

    Int tier        = IME_Slots[aiSlotIndex].resourceTier
    Float winChance = CalculateWinChance(tier, aiBidType)
    Float roll      = Utility.RandomFloat(0.0, 1.0)
    Bool won        = roll <= winChance

    IMELog("BidOnSlot[" + aiSlotIndex + "] T" + tier + \
           " bidType=" + aiBidType + \
           " rep=" + (IME_Reputation.GetValue() as Int) + \
           " winChance=" + winChance + " roll=" + roll + " won=" + won)

    IME_LastBidResult    = won
    IME_LastBidSlotIndex = aiSlotIndex

    If won
        Float bidMult    = GetBidPriceMult(aiBidType)
        Int awardedPrice = (IME_Slots[aiSlotIndex].fairPrice * bidMult) as Int

        IME_Slots[aiSlotIndex].isAwarded       = True
        IME_Slots[aiSlotIndex].bidType         = aiBidType
        IME_Slots[aiSlotIndex].awardedPrice    = awardedPrice
        IME_Slots[aiSlotIndex].awardedGameTime = Utility.GetCurrentGameTime()

        Int contractIdx = GetFreeContractQuestIndex()
        If contractIdx >= 0
            ActivateContractQuest(contractIdx, aiSlotIndex)
        EndIf
    EndIf

    Return won
EndFunction

Float Function CalculateWinChance(Int aiTier, Int aiBidType)
    Float baseChance
    If aiBidType == 0
        baseChance = IME_WinBase_Lowball
    ElseIf aiBidType == 1
        baseChance = IME_WinBase_Fair
    Else
        baseChance = IME_WinBase_High
    EndIf

    ; Rep multiplier: 0 rep = 1.0x, max rep = 2.0x, min rep ~= 0.8x
    Int rep       = IME_Reputation.GetValue() as Int
    Float repMult = 1.0 + (rep as Float / (IME_Rep_Max as Float))
    If repMult < 0.1
        repMult = 0.1
    EndIf

    Float tierGate    = GetTierGate(aiTier)
    Float finalChance = baseChance * repMult * tierGate

    If finalChance > 0.95
        finalChance = 0.95
    ElseIf finalChance < 0.02
        finalChance = 0.02
    EndIf

    Return finalChance
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; FULFILLMENT AND FAILURE
; ═══════════════════════════════════════════════════════════════════════════════

; Called by the dropoff terminal after it has verified and removed items.
Bool Function FulfillContract(Int aiSlotIndex, ObjectReference akPlayerRef)
    If aiSlotIndex < 0 || aiSlotIndex >= IME_MaxSlots
        Return False
    EndIf
    If !IME_Slots[aiSlotIndex].isAwarded
        Return False
    EndIf

    If Utility.GetCurrentGameTime() > IME_Slots[aiSlotIndex].deadlineGameTime
        IMELog("FulfillContract[" + aiSlotIndex + "] deadline passed — failing")
        FailContract(aiSlotIndex)
        Return False
    EndIf

    Int payout = IME_Slots[aiSlotIndex].awardedPrice
    Game.GetPlayer().AddItem(Gold001, payout)

    IMELog("FulfillContract[" + aiSlotIndex + "] — " + \
           IME_Slots[aiSlotIndex].resourceName + \
           " → " + IME_Slots[aiSlotIndex].companyName + \
           " payout=" + payout)

    Int tier     = IME_Slots[aiSlotIndex].resourceTier
    Int bidType  = IME_Slots[aiSlotIndex].bidType
    Float awarded  = IME_Slots[aiSlotIndex].awardedGameTime
    Float deadline = IME_Slots[aiSlotIndex].deadlineGameTime
    CalculateAndApplyRepAward(tier, bidType, awarded, deadline)

    CompleteContractQuestForSlot(aiSlotIndex)
    ClearSlot(aiSlotIndex)

    Return True
EndFunction

Function FailContract(Int aiSlotIndex)
    If aiSlotIndex < 0 || aiSlotIndex >= IME_MaxSlots
        Return
    EndIf

    Int tier       = IME_Slots[aiSlotIndex].resourceTier
    Int repPenalty = GetTierRepFail(tier)

    IMELog("FailContract[" + aiSlotIndex + "] T" + tier + \
           " — " + IME_Slots[aiSlotIndex].resourceName + \
           " repPenalty=" + repPenalty)

    ModifyReputation(repPenalty)
    FailContractQuestForSlot(aiSlotIndex)
    ClearSlot(aiSlotIndex)
EndFunction

Function CheckDeadlines()
    Float currentTime = Utility.GetCurrentGameTime()
    Int i = 0
    While i < IME_MaxSlots
        If IME_Slots[i].isAwarded && IME_Slots[i].isActive
            If currentTime > IME_Slots[i].deadlineGameTime
                IMELog("CheckDeadlines — slot " + i + " expired")
                FailContract(i)
            EndIf
        EndIf
        i += 1
    EndWhile
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; REPUTATION
; ═══════════════════════════════════════════════════════════════════════════════

Function CalculateAndApplyRepAward(Int aiTier, Int aiBidType, Float aAwardedTime, Float aDeadlineTime)
    Int flat = GetTierRepComplete(aiTier)

    Float currentTime   = Utility.GetCurrentGameTime()
    Float totalWindow   = aDeadlineTime - aAwardedTime
    Float timeRemaining = aDeadlineTime - currentTime
    Float earlyFraction = 0.0
    If totalWindow > 0.0
        earlyFraction = timeRemaining / totalWindow
        If earlyFraction < 0.0
            earlyFraction = 0.0
        ElseIf earlyFraction > 1.0
            earlyFraction = 1.0
        EndIf
    EndIf
    Int earlyBonus = (earlyFraction * (flat as Float * IME_EarlyBonusFraction)) as Int

    Int bidMod
    If aiBidType == 0
        bidMod = IME_BidRepMod_Lowball
    ElseIf aiBidType == 2
        bidMod = IME_BidRepMod_High
    Else
        bidMod = IME_BidRepMod_Fair
    EndIf

    Int total = flat + earlyBonus + bidMod
    If total < 1
        total = 1
    EndIf

    IMELog("RepAward T" + aiTier + " flat=" + flat + \
           " earlyBonus=" + earlyBonus + " bidMod=" + bidMod + " total=" + total)
    ModifyReputation(total)
EndFunction

Function ModifyReputation(Int aiAmount)
    Int current = IME_Reputation.GetValue() as Int
    Int newVal  = current + aiAmount
    If newVal > IME_Rep_Max
        newVal = IME_Rep_Max
    ElseIf newVal < IME_Rep_Min
        newVal = IME_Rep_Min
    EndIf
    IME_Reputation.SetValueInt(newVal)
    IMELog("Reputation: " + current + " + " + aiAmount + " = " + newVal)
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; DISPLAY HELPERS — called by terminal scripts
; ═══════════════════════════════════════════════════════════════════════════════

String Function GetUrgencyLabel(Int aiUrgencyTier)
    If aiUrgencyTier == 2
        Return "[RUSH] "
    ElseIf aiUrgencyTier == 1
        Return "[TIGHT] "
    Else
        Return ""
    EndIf
EndFunction

Int Function GetHoursRemaining(Int aiSlotIndex)
    Float remaining = IME_Slots[aiSlotIndex].deadlineGameTime - Utility.GetCurrentGameTime()
    If remaining < 0.0
        Return 0
    EndIf
    Return (remaining * 24.0) as Int
EndFunction

String Function GetSettlementName(Int aiSettlementIndex)
    Return IME_SettlementNames[aiSettlementIndex]
EndFunction

String Function GetWinChanceLabel(Int aiTier, Int aiBidType)
    Float chance = CalculateWinChance(aiTier, aiBidType)
    If chance >= 0.75
        Return "High"
    ElseIf chance >= 0.45
        Return "Moderate"
    ElseIf chance >= 0.20
        Return "Low"
    Else
        Return "Very Low"
    EndIf
EndFunction

Int Function GetAwardedContractCount()
    Int count = 0
    Int i = 0
    While i < IME_MaxSlots
        If IME_Slots[i].isAwarded
            count += 1
        EndIf
        i += 1
    EndWhile
    Return count
EndFunction

Function RefreshIfReady()
    Float lastRefresh = IME_LastRefreshTime.GetValue() as Float
    Float currentTime = Utility.GetCurrentGameTime()
    If (currentTime - lastRefresh) >= (IME_RefreshIntervalHours / 24.0)
        PopulateSlots()
    EndIf
EndFunction

; ── Tier accessors (rep system) ───────────────────────────────────────────────

Int Function GetTierRepComplete(Int aiTier)
    If aiTier == 1
        Return IME_RepComplete_T1
    ElseIf aiTier == 2
        Return IME_RepComplete_T2
    ElseIf aiTier == 3
        Return IME_RepComplete_T3
    ElseIf aiTier == 4
        Return IME_RepComplete_T4
    Else
        Return IME_RepComplete_T5
    EndIf
EndFunction

Int Function GetTierRepFail(Int aiTier)
    If aiTier == 1
        Return IME_RepFail_T1
    ElseIf aiTier == 2
        Return IME_RepFail_T2
    ElseIf aiTier == 3
        Return IME_RepFail_T3
    ElseIf aiTier == 4
        Return IME_RepFail_T4
    Else
        Return IME_RepFail_T5
    EndIf
EndFunction

Float Function GetTierGate(Int aiTier)
    If aiTier == 1
        Return IME_TierGate_T1
    ElseIf aiTier == 2
        Return IME_TierGate_T2
    ElseIf aiTier == 3
        Return IME_TierGate_T3
    ElseIf aiTier == 4
        Return IME_TierGate_T4
    Else
        Return IME_TierGate_T5
    EndIf
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; JOB POOL ACCESSORS
; ═══════════════════════════════════════════════════════════════════════════════

Int Function GetTierJobCount(Int aiTier)
    If aiTier == 1
        Return IME_Tier1_JobCount
    ElseIf aiTier == 2
        Return IME_Tier2_JobCount
    ElseIf aiTier == 3
        Return IME_Tier3_JobCount
    ElseIf aiTier == 4
        Return IME_Tier4_JobCount
    Else
        Return IME_Tier5_JobCount
    EndIf
EndFunction

; Papyrus doesn't support dynamic typed array indexing — If chain required
JobTemplate Function GetJobFromPool(Int aiTier, Int aiJobIdx)
    If aiTier == 1
        Return IME_JobPool_T1[aiJobIdx]
    ElseIf aiTier == 2
        Return IME_JobPool_T2[aiJobIdx]
    ElseIf aiTier == 3
        Return IME_JobPool_T3[aiJobIdx]
    ElseIf aiTier == 4
        Return IME_JobPool_T4[aiJobIdx]
    Else
        Return IME_JobPool_T5[aiJobIdx]
    EndIf
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; URGENCY HELPERS
; ═══════════════════════════════════════════════════════════════════════════════

Int Function RollUrgencyTier()
    Int roll = Utility.RandomInt(1, 100)
    If roll <= IME_UrgencyWeight_Normal
        Return 0
    ElseIf roll <= (IME_UrgencyWeight_Normal + IME_UrgencyWeight_Tight)
        Return 1
    Else
        Return 2
    EndIf
EndFunction

Float Function GetUrgencyPriceMult(Int aiUrgency)
    If aiUrgency == 0
        Return IME_UrgencyPriceMult_Normal
    ElseIf aiUrgency == 1
        Return IME_UrgencyPriceMult_Tight
    Else
        Return IME_UrgencyPriceMult_Rush
    EndIf
EndFunction

Float Function GetUrgencyDeadlineMult(Int aiUrgency)
    If aiUrgency == 0
        Return IME_UrgencyDeadlineMult_Normal
    ElseIf aiUrgency == 1
        Return IME_UrgencyDeadlineMult_Tight
    Else
        Return IME_UrgencyDeadlineMult_Rush
    EndIf
EndFunction

Float Function GetBidPriceMult(Int aiBidType)
    If aiBidType == 0
        Return IME_BidMult_Lowball
    ElseIf aiBidType == 2
        Return IME_BidMult_High
    Else
        Return IME_BidMult_Fair
    EndIf
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; CONTRACT QUEST MANAGEMENT
; ═══════════════════════════════════════════════════════════════════════════════

Int Function GetFreeContractQuestIndex()
    Int i = 0
    While i < IME_ContractQuests.Length
        If !IME_ContractQuests[i].IsRunning()
            Return i
        EndIf
        i += 1
    EndWhile
    IMELog("GetFreeContractQuestIndex — WARNING: no free quest slot found")
    Return -1
EndFunction

Function ActivateContractQuest(Int aiQuestIndex, Int aiSlotIndex)
    IME_ContractQuests[aiQuestIndex].Start()
    IME_ContractQuestScript contractScript = IME_ContractQuests[aiQuestIndex] as IME_ContractQuestScript
    If contractScript
        contractScript.InitContract(aiSlotIndex)
    Else
        IMELog("ActivateContractQuest — WARNING: cast failed for quest " + aiQuestIndex)
    EndIf
EndFunction

Function CompleteContractQuestForSlot(Int aiSlotIndex)
    Int i = 0
    While i < IME_ContractQuests.Length
        IME_ContractQuestScript cs = IME_ContractQuests[i] as IME_ContractQuestScript
        If cs && cs.SlotIndex == aiSlotIndex
            cs.CompleteContract()
            Return
        EndIf
        i += 1
    EndWhile
    IMELog("CompleteContractQuestForSlot — WARNING: no quest for slot " + aiSlotIndex)
EndFunction

Function FailContractQuestForSlot(Int aiSlotIndex)
    Int i = 0
    While i < IME_ContractQuests.Length
        IME_ContractQuestScript cs = IME_ContractQuests[i] as IME_ContractQuestScript
        If cs && cs.SlotIndex == aiSlotIndex
            cs.FailContract()
            Return
        EndIf
        i += 1
    EndWhile
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; INITIALISATION
; ═══════════════════════════════════════════════════════════════════════════════

Function InitSettlementNames()
    ; v1: single dropoff terminal at New Atlantis spaceport
    ; Remaining entries retained for future multi-settlement support
    IME_SettlementNames = new String[4]
    IME_SettlementNames[0] = "New Atlantis"
    IME_SettlementNames[1] = "Neon"
    IME_SettlementNames[2] = "Akila City"
    IME_SettlementNames[3] = "Cydonia"
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; DEBUG LOGGING
; ═══════════════════════════════════════════════════════════════════════════════

Function IMELog(String asMessage)
    If IME_DebugLogging
        Debug.Trace("[IME] " + asMessage)
    EndIf
EndFunction
