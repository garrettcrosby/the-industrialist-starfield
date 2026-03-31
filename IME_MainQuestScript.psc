; ═══════════════════════════════════════════════════════════════════════════════
; IME_MainQuestScript
; Attached to: IME_MainQuest (always-running management quest)
;
; Responsibilities:
;   - Owns all order pool data and active slot state
;   - Drives the 24-hour refresh timer
;   - Handles bid resolution, fulfillment, failure, and reputation
;   - Exposes functions called by terminal and dropoff scripts
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_MainQuestScript Extends Quest

; ── STRUCTS ───────────────────────────────────────────────────────────────────

Struct ActiveOrder
    Int     resourceTier        ; 1-5
    Int     tierResourceIndex   ; index within that tier's arrays
    String  resourceName        ; display string
    Int     resourceBaseValue   ; credits per unit
    String  resourceType        ; "Inorganic", "Organic", "Manufactured"
    Int     quantity
    Int     fairPrice           ; qty * baseValue * urgencyPriceMult
    Int     awardedPrice        ; actual payout based on bid type
    Int     companyIndex        ; index into IME_CompanyNames
    String  companyName         ; display string
    Int     settlementIndex     ; 0=New Atlantis 1=Neon 2=Akila 3=Cydonia
    Float   postedGameTime      ; when slot was populated
    Float   awardedGameTime     ; when bid was won
    Float   deadlineGameTime    ; absolute game time deadline
    Float   deadlineHours       ; total hours from award to deadline (for display)
    Int     urgencyTier         ; 0=Normal 1=Tight 2=Rush
    Float   urgencyPriceMult    ; price multiplier from urgency
    Int     bidType             ; 0=Lowball 1=Fair 2=High
    Bool    isAwarded           ; true once player wins the bid
    Bool    isActive            ; true if slot is populated (awarded or open)
EndStruct

; ── CONSTANTS — tune these without touching logic ─────────────────────────────

; Reputation bounds
Int Property IME_Rep_Max        = 500   AutoReadOnly
Int Property IME_Rep_Min        = -100  AutoReadOnly

; Reputation: flat award per tier on completion
Int Property IME_RepComplete_T1 = 2     AutoReadOnly
Int Property IME_RepComplete_T2 = 5     AutoReadOnly
Int Property IME_RepComplete_T3 = 10    AutoReadOnly
Int Property IME_RepComplete_T4 = 20    AutoReadOnly
Int Property IME_RepComplete_T5 = 35    AutoReadOnly

; Reputation: flat penalty per tier on failure
Int Property IME_RepFail_T1     = -1    AutoReadOnly
Int Property IME_RepFail_T2     = -3    AutoReadOnly
Int Property IME_RepFail_T3     = -8    AutoReadOnly
Int Property IME_RepFail_T4     = -20   AutoReadOnly
Int Property IME_RepFail_T5     = -40   AutoReadOnly

; Early completion bonus: max additional rep as fraction of flat award
; e.g. 0.5 means a T3 job (+10 flat) can earn up to +5 bonus for instant delivery
Float Property IME_EarlyBonusFraction = 0.5 AutoReadOnly

; Bid rep modifiers (added to final rep award)
Int Property IME_BidRepMod_Lowball = 1  AutoReadOnly
Int Property IME_BidRepMod_Fair    = 0  AutoReadOnly
Int Property IME_BidRepMod_High    = -1 AutoReadOnly

; Bid price multipliers (applied to fair price)
Float Property IME_BidMult_Lowball = 0.75 AutoReadOnly
Float Property IME_BidMult_Fair    = 1.0  AutoReadOnly
Float Property IME_BidMult_High    = 1.30 AutoReadOnly

; Win probability: base chances by bid type (before rep modifier)
Float Property IME_WinBase_Lowball = 0.70 AutoReadOnly
Float Property IME_WinBase_Fair    = 0.45 AutoReadOnly
Float Property IME_WinBase_High    = 0.20 AutoReadOnly

; Reputation tier gates (minimum rep to have any real chance)
Int Property IME_RepGate_T1     = -100  AutoReadOnly
Int Property IME_RepGate_T2     = 0     AutoReadOnly
Int Property IME_RepGate_T3     = 50    AutoReadOnly
Int Property IME_RepGate_T4     = 150   AutoReadOnly
Int Property IME_RepGate_T5     = 300   AutoReadOnly

; Tier gate multipliers (applied before rep modifier; low = locked out at low rep)
Float Property IME_TierGate_T1  = 1.00  AutoReadOnly
Float Property IME_TierGate_T2  = 0.80  AutoReadOnly
Float Property IME_TierGate_T3  = 0.50  AutoReadOnly
Float Property IME_TierGate_T4  = 0.25  AutoReadOnly
Float Property IME_TierGate_T5  = 0.10  AutoReadOnly

; Deadline hours per tier (base, before type and urgency modifiers)
Int Property IME_Deadline_T1    = 72    AutoReadOnly
Int Property IME_Deadline_T2    = 96    AutoReadOnly
Int Property IME_Deadline_T3    = 120   AutoReadOnly
Int Property IME_Deadline_T4    = 168   AutoReadOnly
Int Property IME_Deadline_T5    = 240   AutoReadOnly

; Deadline type modifiers — the global balancing knobs
; Set these in CK to adjust difficulty without touching logic
; 1.0 = normal, 1.5 = easier (more time), 0.75 = harder (less time)
Float Property IME_DeadlineMod_Inorganic    = 1.0 Auto
Float Property IME_DeadlineMod_Organic      = 1.0 Auto
Float Property IME_DeadlineMod_Manufactured = 1.0 Auto

; Urgency tiers: weighted probability out of 100
; Normal=60%, Tight=30%, Rush=10%
Int Property IME_UrgencyWeight_Normal = 60 AutoReadOnly
Int Property IME_UrgencyWeight_Tight  = 30 AutoReadOnly
; Rush = remaining 10%

; Urgency deadline multipliers (fraction of base deadline)
Float Property IME_UrgencyDeadlineMult_Normal = 1.00 AutoReadOnly
Float Property IME_UrgencyDeadlineMult_Tight  = 0.65 AutoReadOnly
Float Property IME_UrgencyDeadlineMult_Rush   = 0.40 AutoReadOnly

; Urgency price multipliers
Float Property IME_UrgencyPriceMult_Normal    = 1.00 AutoReadOnly
Float Property IME_UrgencyPriceMult_Tight     = 1.25 AutoReadOnly
Float Property IME_UrgencyPriceMult_Rush      = 1.50 AutoReadOnly

; Slot distribution
Int Property IME_SlotDist_T1_Min     = 3  AutoReadOnly
Int Property IME_SlotDist_T1_Max     = 4  AutoReadOnly
Int Property IME_SlotDist_T2_Min     = 2  AutoReadOnly
Int Property IME_SlotDist_T2_Max     = 3  AutoReadOnly
Int Property IME_SlotDist_T3_Min     = 1  AutoReadOnly
Int Property IME_SlotDist_T3_Max     = 2  AutoReadOnly
Int Property IME_SlotDist_T4         = 1  AutoReadOnly
Int Property IME_SlotDist_T5_Chance  = 30 AutoReadOnly  ; % chance T5 slot appears

; Board refresh interval in in-game hours
Float Property IME_RefreshIntervalHours = 24.0 AutoReadOnly

; Maximum concurrent awarded contracts (player can hold this many at once)
Int Property IME_MaxAwardedContracts = 4 AutoReadOnly

; ── GLOBAL VARIABLES — wired in CK ───────────────────────────────────────────

GlobalVariable Property IME_Reputation      Auto  ; the global rep score
GlobalVariable Property IME_LastRefreshTime Auto  ; game time of last refresh

; ── QUEST REFERENCES — wired in CK ───────────────────────────────────────────
; One contract quest per max slot (size must match IME_MaxSlots)
Quest[] Property IME_ContractQuests Auto

; ── SETTLEMENT NAMES — for display ───────────────────────────────────────────
; Populated in OnInit
String[] IME_SettlementNames

; ── ACTIVE BOARD STATE ────────────────────────────────────────────────────────
; Maximum possible slots: T1_Max + T2_Max + T3_Max + T4 + 1(T5) = 11
Int Property IME_MaxSlots = 11 AutoReadOnly
ActiveOrder[] IME_Slots

; Track how many slots are actually active this cycle
Int IME_ActiveSlotCount = 0

; ── BID RESULT SCRATCH — read by terminal script after BidOnSlot() ────────────
Bool Property IME_LastBidResult    = False Auto
Int  Property IME_LastBidSlotIndex = -1    Auto

; ── DATA TABLES ───────────────────────────────────────────────────────────────
; Company data (43 entries — see IME_DataTables.psc for index reference)
Int  IME_CompanyCount = 43
String[] IME_CompanyNames
Int[]    IME_CompanySettlement

; Tier counts
Int Property IME_Tier1_Count = 31 AutoReadOnly
Int Property IME_Tier2_Count = 27 AutoReadOnly
Int Property IME_Tier3_Count = 23 AutoReadOnly
Int Property IME_Tier4_Count = 14 AutoReadOnly
Int Property IME_Tier5_Count = 7  AutoReadOnly

; Quantity bounds per tier
Int Property IME_Tier1_QtyMin = 3500  AutoReadOnly
Int Property IME_Tier1_QtyMax = 5000  AutoReadOnly
Int Property IME_Tier2_QtyMin = 1500  AutoReadOnly
Int Property IME_Tier2_QtyMax = 2500  AutoReadOnly
Int Property IME_Tier3_QtyMin = 500   AutoReadOnly
Int Property IME_Tier3_QtyMax = 1000  AutoReadOnly
Int Property IME_Tier4_QtyMin = 350   AutoReadOnly
Int Property IME_Tier4_QtyMax = 750   AutoReadOnly
Int Property IME_Tier5_QtyMin = 50    AutoReadOnly
Int Property IME_Tier5_QtyMax = 500   AutoReadOnly

; Resource name arrays (one per tier)
String[] IME_Tier1_Names
String[] IME_Tier2_Names
String[] IME_Tier3_Names
String[] IME_Tier4_Names
String[] IME_Tier5_Names

; Resource base value arrays (one per tier)
Int[] IME_Tier1_BaseValue
Int[] IME_Tier2_BaseValue
Int[] IME_Tier3_BaseValue
Int[] IME_Tier4_BaseValue
Int[] IME_Tier5_BaseValue

; Resource type arrays ("Inorganic", "Organic", "Manufactured")
String[] IME_Tier1_Type
String[] IME_Tier2_Type
String[] IME_Tier3_Type
String[] IME_Tier4_Type
String[] IME_Tier5_Type

; Company count per resource (parallel to name/value arrays)
Int[] IME_Tier1_CompCount
Int[] IME_Tier2_CompCount
Int[] IME_Tier3_CompCount
Int[] IME_Tier4_CompCount
Int[] IME_Tier5_CompCount

; ═══════════════════════════════════════════════════════════════════════════════
; LIFECYCLE
; ═══════════════════════════════════════════════════════════════════════════════

Event OnInit()
    InitSettlementNames()
    InitCompanyData()
    InitTier1Data()
    InitTier2Data()
    InitTier3Data()
    InitTier4Data()
    InitTier5Data()
    IME_CompanyLookup.InitCompanyLists()
    InitSlots()
    IME_Reputation.SetValueInt(0)
    IME_LastRefreshTime.SetValueFloat(0.0)
    PopulateSlots()
    RegisterForUpdateGameTime(IME_RefreshIntervalHours)
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
    IME_Slots = new ActiveOrder[11]  ; IME_MaxSlots
    Int i = 0
    While i < 11
        IME_Slots[i] = new ActiveOrder
        IME_Slots[i].isActive = False
        IME_Slots[i].isAwarded = False
        i += 1
    EndWhile
    IME_ActiveSlotCount = 0
EndFunction

Function PopulateSlots()
    ; Only refresh open (non-awarded) slots — don't touch active contracts
    ; First clear all non-awarded slots
    Int i = 0
    While i < IME_MaxSlots
        If IME_Slots[i].isActive && !IME_Slots[i].isAwarded
            IME_Slots[i].isActive = False
        EndIf
        i += 1
    EndWhile

    ; Determine how many slots per tier this cycle
    Int t1Count = Utility.RandomInt(IME_SlotDist_T1_Min, IME_SlotDist_T1_Max)
    Int t2Count = Utility.RandomInt(IME_SlotDist_T2_Min, IME_SlotDist_T2_Max)
    Int t3Count = Utility.RandomInt(IME_SlotDist_T3_Min, IME_SlotDist_T3_Max)
    Int t4Count = IME_SlotDist_T4
    Int t5Count = 0
    If Utility.RandomInt(1, 100) <= IME_SlotDist_T5_Chance
        t5Count = 1
    EndIf

    ; Fill slots in order: T1 first, T5 last
    Int slotIdx = 0
    ; Skip any slots that are awarded (active contracts carry over)
    While slotIdx < IME_MaxSlots && IME_Slots[slotIdx].isAwarded
        slotIdx += 1
    EndWhile

    slotIdx = FillTierSlots(1, t1Count, slotIdx)
    slotIdx = FillTierSlots(2, t2Count, slotIdx)
    slotIdx = FillTierSlots(3, t3Count, slotIdx)
    slotIdx = FillTierSlots(4, t4Count, slotIdx)
    slotIdx = FillTierSlots(5, t5Count, slotIdx)

    IME_LastRefreshTime.SetValueFloat(Utility.GetCurrentGameTime())
EndFunction

Int Function FillTierSlots(Int aiTier, Int aiCount, Int aiStartSlot)
    Int filled = 0
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
    ; 1. Pick random resource index within tier
    Int tierCount = GetTierCount(aiTier)
    Int resIdx = Utility.RandomInt(0, tierCount - 1)

    ; 2. Pick random company for this resource
    Int compListSize = GetCompCountForResource(aiTier, resIdx)
    Int compListPick = Utility.RandomInt(0, compListSize - 1)
    Int compIdx = GetCompanyIndexForResource(aiTier, resIdx, compListPick)

    ; 3. Resolve settlement — if company is Random (-1), pick one of the four
    Int settlement = IME_CompanySettlement[compIdx]
    If settlement == -1
        settlement = Utility.RandomInt(0, 3)
    EndIf

    ; 4. Roll urgency tier
    Int urgency = RollUrgencyTier()
    Float urgencyPriceMult   = GetUrgencyPriceMult(urgency)
    Float urgencyDeadlineMult = GetUrgencyDeadlineMult(urgency)

    ; 5. Generate quantity within tier bounds
    Int qtyMin = GetTierQtyMin(aiTier)
    Int qtyMax = GetTierQtyMax(aiTier)
    Int qty = Utility.RandomInt(qtyMin, qtyMax)

    ; 6. Calculate fair price
    Int baseVal = GetTierBaseValue(aiTier, resIdx)
    Int fairPrice = (qty * baseVal * urgencyPriceMult) as Int

    ; 7. Calculate deadline
    Int baseDeadlineHours = GetTierDeadlineHours(aiTier)
    String resType = GetTierResourceType(aiTier, resIdx)
    Float typeMod = GetDeadlineTypeMod(resType)
    Float finalHours = (baseDeadlineHours as Float) * typeMod * urgencyDeadlineMult
    ; Deadline stored as game-time days from now
    Float deadlineGT = Utility.GetCurrentGameTime() + (finalHours / 24.0)

    ; 8. Write into slot
    IME_Slots[aiSlotIndex].resourceTier       = aiTier
    IME_Slots[aiSlotIndex].tierResourceIndex  = resIdx
    IME_Slots[aiSlotIndex].resourceName       = GetTierResourceName(aiTier, resIdx)
    IME_Slots[aiSlotIndex].resourceBaseValue  = baseVal
    IME_Slots[aiSlotIndex].resourceType       = resType
    IME_Slots[aiSlotIndex].quantity           = qty
    IME_Slots[aiSlotIndex].fairPrice          = fairPrice
    IME_Slots[aiSlotIndex].awardedPrice       = 0
    IME_Slots[aiSlotIndex].companyIndex       = compIdx
    IME_Slots[aiSlotIndex].companyName        = IME_CompanyNames[compIdx]
    IME_Slots[aiSlotIndex].settlementIndex    = settlement
    IME_Slots[aiSlotIndex].postedGameTime     = Utility.GetCurrentGameTime()
    IME_Slots[aiSlotIndex].awardedGameTime    = 0.0
    IME_Slots[aiSlotIndex].deadlineGameTime   = deadlineGT
    IME_Slots[aiSlotIndex].deadlineHours      = finalHours
    IME_Slots[aiSlotIndex].urgencyTier        = urgency
    IME_Slots[aiSlotIndex].urgencyPriceMult   = urgencyPriceMult
    IME_Slots[aiSlotIndex].bidType            = -1
    IME_Slots[aiSlotIndex].isAwarded          = False
    IME_Slots[aiSlotIndex].isActive           = True
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; BIDDING
; ═══════════════════════════════════════════════════════════════════════════════

; Called by exchange terminal script when player selects a bid option
; Returns true if won, false if lost. Result also written to IME_LastBidResult.
Bool Function BidOnSlot(Int aiSlotIndex, Int aiBidType)
    If aiSlotIndex < 0 || aiSlotIndex >= IME_MaxSlots
        Return False
    EndIf
    If !IME_Slots[aiSlotIndex].isActive || IME_Slots[aiSlotIndex].isAwarded
        Return False
    EndIf

    ; Check if player is already at max active contracts
    If GetAwardedContractCount() >= IME_MaxAwardedContracts
        IME_LastBidResult = False
        IME_LastBidSlotIndex = aiSlotIndex
        Return False
    EndIf

    Int tier = IME_Slots[aiSlotIndex].resourceTier
    Float winChance = CalculateWinChance(tier, aiBidType)
    Float roll = Utility.RandomFloat(0.0, 1.0)
    Bool won = roll <= winChance

    IME_LastBidResult = won
    IME_LastBidSlotIndex = aiSlotIndex

    If won
        ; Calculate awarded price
        Float bidMult = GetBidPriceMult(aiBidType)
        Int awardedPrice = (IME_Slots[aiSlotIndex].fairPrice * bidMult) as Int

        IME_Slots[aiSlotIndex].isAwarded     = True
        IME_Slots[aiSlotIndex].bidType       = aiBidType
        IME_Slots[aiSlotIndex].awardedPrice  = awardedPrice
        IME_Slots[aiSlotIndex].awardedGameTime = Utility.GetCurrentGameTime()

        ; Activate the corresponding contract quest
        Int contractIdx = GetFreeContractQuestIndex()
        If contractIdx >= 0
            ActivateContractQuest(contractIdx, aiSlotIndex)
        EndIf
    EndIf

    Return won
EndFunction

Float Function CalculateWinChance(Int aiTier, Int aiBidType)
    ; Base chance from bid type
    Float baseChance
    If aiBidType == 0
        baseChance = IME_WinBase_Lowball
    ElseIf aiBidType == 1
        baseChance = IME_WinBase_Fair
    Else
        baseChance = IME_WinBase_High
    EndIf

    ; Reputation multiplier
    ; At rep 0 = 1.0x, at rep max(500) = 2.0x, at rep min(-100) = 0.8x
    Int rep = IME_Reputation.GetValue() as Int
    Float repMult = 1.0 + (rep as Float / (IME_Rep_Max as Float))
    If repMult < 0.1
        repMult = 0.1
    EndIf

    ; Tier gate — hard multiplier that locks out high tiers at low rep
    Float tierGate = GetTierGate(aiTier)

    Float finalChance = baseChance * repMult * tierGate

    ; Hard caps
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

; Called by dropoff terminal script.
; Returns true if fulfillment succeeded.
Bool Function FulfillContract(Int aiSlotIndex, ObjectReference akContainerRef)
    If aiSlotIndex < 0 || aiSlotIndex >= IME_MaxSlots
        Return False
    EndIf
    If !IME_Slots[aiSlotIndex].isAwarded
        Return False
    EndIf

    ; Check deadline — if expired, fail instead
    If Utility.GetCurrentGameTime() > IME_Slots[aiSlotIndex].deadlineGameTime
        FailContract(aiSlotIndex)
        Return False
    EndIf

    ; Verify player has required quantity
    ; akContainerRef is the player ref passed from the dropoff terminal
    String resName = IME_Slots[aiSlotIndex].resourceName
    Int required   = IME_Slots[aiSlotIndex].quantity
    ; Note: item removal uses Form reference wired as property on dropoff script
    ; The dropoff script calls FulfillContract after verifying inventory itself
    ; so here we just handle the payout and rep

    ; Pay out credits
    Int payout = IME_Slots[aiSlotIndex].awardedPrice
    Game.GetPlayer().AddItem(Gold001, payout)

    ; Calculate and apply reputation
    Int tier     = IME_Slots[aiSlotIndex].resourceTier
    Int bidType  = IME_Slots[aiSlotIndex].bidType
    Float awarded = IME_Slots[aiSlotIndex].awardedGameTime
    Float deadline = IME_Slots[aiSlotIndex].deadlineGameTime
    CalculateAndApplyRepAward(tier, bidType, awarded, deadline)

    ; Complete the contract quest
    CompleteContractQuestForSlot(aiSlotIndex)

    ; Clear the slot
    ClearSlot(aiSlotIndex)

    Return True
EndFunction

Function FailContract(Int aiSlotIndex)
    If aiSlotIndex < 0 || aiSlotIndex >= IME_MaxSlots
        Return
    EndIf

    Int tier = IME_Slots[aiSlotIndex].resourceTier
    Int repPenalty = GetTierRepFail(tier)
    ModifyReputation(repPenalty)  ; repPenalty is already negative

    ; Fail the contract quest
    FailContractQuestForSlot(aiSlotIndex)

    ClearSlot(aiSlotIndex)
EndFunction

Function CheckDeadlines()
    Float currentTime = Utility.GetCurrentGameTime()
    Int i = 0
    While i < IME_MaxSlots
        If IME_Slots[i].isAwarded && IME_Slots[i].isActive
            If currentTime > IME_Slots[i].deadlineGameTime
                FailContract(i)
            EndIf
        EndIf
        i += 1
    EndWhile
EndFunction

Function ClearSlot(Int aiSlotIndex)
    IME_Slots[aiSlotIndex].isActive  = False
    IME_Slots[aiSlotIndex].isAwarded = False
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; REPUTATION
; ═══════════════════════════════════════════════════════════════════════════════

Function CalculateAndApplyRepAward(Int aiTier, Int aiBidType, Float aAwardedTime, Float aDeadlineTime)
    Int flat = GetTierRepComplete(aiTier)

    ; Early completion bonus
    Float currentTime    = Utility.GetCurrentGameTime()
    Float totalWindow    = aDeadlineTime - aAwardedTime
    Float timeRemaining  = aDeadlineTime - currentTime
    Float earlyFraction  = 0.0
    If totalWindow > 0.0
        earlyFraction = timeRemaining / totalWindow
        If earlyFraction < 0.0
            earlyFraction = 0.0
        ElseIf earlyFraction > 1.0
            earlyFraction = 1.0
        EndIf
    EndIf
    Int earlyBonus = (earlyFraction * (flat as Float * IME_EarlyBonusFraction)) as Int

    ; Bid modifier
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
        total = 1  ; always award at least 1 rep for completion
    EndIf

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
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; DISPLAY HELPERS — called by terminal script to build menu text
; ═══════════════════════════════════════════════════════════════════════════════

; Returns a short urgency label for the terminal listing
String Function GetUrgencyLabel(Int aiUrgencyTier)
    If aiUrgencyTier == 2
        Return "[RUSH] "
    ElseIf aiUrgencyTier == 1
        Return "[TIGHT] "
    Else
        Return ""
    EndIf
EndFunction

; Returns remaining hours on deadline as an Int for display
Int Function GetHoursRemaining(Int aiSlotIndex)
    Float remaining = IME_Slots[aiSlotIndex].deadlineGameTime - Utility.GetCurrentGameTime()
    If remaining < 0.0
        Return 0
    EndIf
    Return (remaining * 24.0) as Int
EndFunction

; Returns display string for settlement
String Function GetSettlementName(Int aiSettlementIndex)
    Return IME_SettlementNames[aiSettlementIndex]
EndFunction

; Returns win chance as a percentage string for the bid detail screen
; Shows a rough label rather than the exact number — keeps some mystery
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

; Returns awarded contract count
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

; Called by exchange terminal to check if refresh is overdue
Function RefreshIfReady()
    Float lastRefresh  = IME_LastRefreshTime.GetValue() as Float
    Float currentTime  = Utility.GetCurrentGameTime()
    If (currentTime - lastRefresh) >= (IME_RefreshIntervalHours / 24.0)
        PopulateSlots()
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
    Return -1  ; all quests in use (shouldn't happen given MaxAwardedContracts check)
EndFunction

Function ActivateContractQuest(Int aiQuestIndex, Int aiSlotIndex)
    ; The contract quest script reads slot data from this script
    ; We just need to start it and pass the slot index
    IME_ContractQuests[aiQuestIndex].Start()
    ; Cast to contract script and initialize
    IME_ContractQuestScript contractScript = IME_ContractQuests[aiQuestIndex] as IME_ContractQuestScript
    If contractScript
        contractScript.InitContract(aiSlotIndex)
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
; TIER DATA ACCESSORS
; These replace dynamic array-of-array indexing which Papyrus doesn't support.
; Tedious but reliable.
; ═══════════════════════════════════════════════════════════════════════════════

Int Function GetTierCount(Int aiTier)
    If aiTier == 1 ; Return IME_Tier1_Count
        Return 31
    ElseIf aiTier == 2
        Return 27
    ElseIf aiTier == 3
        Return 23
    ElseIf aiTier == 4
        Return 14
    Else
        Return 7
    EndIf
EndFunction

Int Function GetTierQtyMin(Int aiTier)
    If aiTier == 1
        Return IME_Tier1_QtyMin
    ElseIf aiTier == 2
        Return IME_Tier2_QtyMin
    ElseIf aiTier == 3
        Return IME_Tier3_QtyMin
    ElseIf aiTier == 4
        Return IME_Tier4_QtyMin
    Else
        Return IME_Tier5_QtyMin
    EndIf
EndFunction

Int Function GetTierQtyMax(Int aiTier)
    If aiTier == 1
        Return IME_Tier1_QtyMax
    ElseIf aiTier == 2
        Return IME_Tier2_QtyMax
    ElseIf aiTier == 3
        Return IME_Tier3_QtyMax
    ElseIf aiTier == 4
        Return IME_Tier4_QtyMax
    Else
        Return IME_Tier5_QtyMax
    EndIf
EndFunction

Int Function GetTierDeadlineHours(Int aiTier)
    If aiTier == 1
        Return IME_Deadline_T1
    ElseIf aiTier == 2
        Return IME_Deadline_T2
    ElseIf aiTier == 3
        Return IME_Deadline_T3
    ElseIf aiTier == 4
        Return IME_Deadline_T4
    Else
        Return IME_Deadline_T5
    EndIf
EndFunction

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

String Function GetTierResourceName(Int aiTier, Int aiResIdx)
    If aiTier == 1
        Return IME_Tier1_Names[aiResIdx]
    ElseIf aiTier == 2
        Return IME_Tier2_Names[aiResIdx]
    ElseIf aiTier == 3
        Return IME_Tier3_Names[aiResIdx]
    ElseIf aiTier == 4
        Return IME_Tier4_Names[aiResIdx]
    Else
        Return IME_Tier5_Names[aiResIdx]
    EndIf
EndFunction

Int Function GetTierBaseValue(Int aiTier, Int aiResIdx)
    If aiTier == 1
        Return IME_Tier1_BaseValue[aiResIdx]
    ElseIf aiTier == 2
        Return IME_Tier2_BaseValue[aiResIdx]
    ElseIf aiTier == 3
        Return IME_Tier3_BaseValue[aiResIdx]
    ElseIf aiTier == 4
        Return IME_Tier4_BaseValue[aiResIdx]
    Else
        Return IME_Tier5_BaseValue[aiResIdx]
    EndIf
EndFunction

String Function GetTierResourceType(Int aiTier, Int aiResIdx)
    If aiTier == 1
        Return IME_Tier1_Type[aiResIdx]
    ElseIf aiTier == 2
        Return IME_Tier2_Type[aiResIdx]
    ElseIf aiTier == 3
        Return IME_Tier3_Type[aiResIdx]
    ElseIf aiTier == 4
        Return IME_Tier4_Type[aiResIdx]
    Else
        Return IME_Tier5_Type[aiResIdx]
    EndIf
EndFunction

Int Function GetCompCountForResource(Int aiTier, Int aiResIdx)
    If aiTier == 1
        Return IME_Tier1_CompCount[aiResIdx]
    ElseIf aiTier == 2
        Return IME_Tier2_CompCount[aiResIdx]
    ElseIf aiTier == 3
        Return IME_Tier3_CompCount[aiResIdx]
    ElseIf aiTier == 4
        Return IME_Tier4_CompCount[aiResIdx]
    Else
        Return IME_Tier5_CompCount[aiResIdx]
    EndIf
EndFunction

; GetCompanyIndexForResource: the big lookup table.
; Returns the actual company index given tier, resource index, and pick index.
; This is where the per-resource company lists from IME_DataTables live.
; Each resource's company list is a separate Int[] property wired in CK.
; For brevity, this shows the pattern — the full function is in IME_CompanyLookup.psc
Int Function GetCompanyIndexForResource(Int aiTier, Int aiResIdx, Int aiPickIdx)
    Return IME_CompanyLookup.GetIndex(aiTier, aiResIdx, aiPickIdx)
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

Float Function GetDeadlineTypeMod(String asType)
    If asType == "Organic"
        Return IME_DeadlineMod_Organic
    ElseIf asType == "Manufactured"
        Return IME_DeadlineMod_Manufactured
    Else
        Return IME_DeadlineMod_Inorganic
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
; INITIALISATION — company data and settlement names
; ═══════════════════════════════════════════════════════════════════════════════

Function InitSettlementNames()
    IME_SettlementNames = new String[4]
    IME_SettlementNames[0] = "New Atlantis"
    IME_SettlementNames[1] = "Neon"
    IME_SettlementNames[2] = "Akila City"
    IME_SettlementNames[3] = "Cydonia"
EndFunction

Function InitCompanyData()
    IME_CompanyNames = new String[43]
    IME_CompanyNames[0]  = "EIT Clothiers"
    IME_CompanyNames[1]  = "Enhance"
    IME_CompanyNames[2]  = "Generdyne Industries"
    IME_CompanyNames[3]  = "Galbank"
    IME_CompanyNames[4]  = "Xenofresh Fisheries"
    IME_CompanyNames[5]  = "Filburn Agriculture"
    IME_CompanyNames[6]  = "Chunks"
    IME_CompanyNames[7]  = "Centauri Mills"
    IME_CompanyNames[8]  = "Chandra Vineyards"
    IME_CompanyNames[9]  = "Arc Might"
    IME_CompanyNames[10] = "Celtcorp"
    IME_CompanyNames[11] = "Reliant Medical"
    IME_CompanyNames[12] = "Argos Extractors"
    IME_CompanyNames[13] = "Consolidated Mining"
    IME_CompanyNames[14] = "Six Sisters"
    IME_CompanyNames[15] = "Taiyo Astroneering"
    IME_CompanyNames[16] = "Trident Luxury Lines"
    IME_CompanyNames[17] = "Stroud-Eklund"
    IME_CompanyNames[18] = "Deimos Staryards"
    IME_CompanyNames[19] = "HopeTech"
    IME_CompanyNames[20] = "Nova Galactic"
    IME_CompanyNames[21] = "Slayton Aerospace"
    IME_CompanyNames[22] = "Amun Dunn"
    IME_CompanyNames[23] = "Panoptes"
    IME_CompanyNames[24] = "Reladyne"
    IME_CompanyNames[25] = "Dogstar"
    IME_CompanyNames[26] = "Sextant Shield Systems"
    IME_CompanyNames[27] = "Nautilus"
    IME_CompanyNames[28] = "Protectorate Systems"
    IME_CompanyNames[29] = "Vanguard"
    IME_CompanyNames[30] = "Deep Core"
    IME_CompanyNames[31] = "Xiang"
    IME_CompanyNames[32] = "Ballistics Solutions"
    IME_CompanyNames[33] = "Light Scythe"
    IME_CompanyNames[34] = "Shinigami"
    IME_CompanyNames[35] = "Horizon Defence"
    IME_CompanyNames[36] = "SON"
    IME_CompanyNames[37] = "Lunar Robotics"
    IME_CompanyNames[38] = "Infinity Ltd"
    IME_CompanyNames[39] = "Ryujin"
    IME_CompanyNames[40] = "Kore Kinetics"
    IME_CompanyNames[41] = "Laredo"
    IME_CompanyNames[42] = "Aboron"

    IME_CompanySettlement = new Int[43]
    IME_CompanySettlement[0]  = 0   ; EIT Clothiers       - New Atlantis
    IME_CompanySettlement[1]  = -1  ; Enhance             - Random
    IME_CompanySettlement[2]  = 1   ; Generdyne           - Neon
    IME_CompanySettlement[3]  = 0   ; Galbank             - New Atlantis
    IME_CompanySettlement[4]  = 1   ; Xenofresh           - Neon
    IME_CompanySettlement[5]  = 2   ; Filburn             - Akila
    IME_CompanySettlement[6]  = -1  ; Chunks              - Random
    IME_CompanySettlement[7]  = -1  ; Centauri Mills      - Random
    IME_CompanySettlement[8]  = -1  ; Chandra Vineyards   - Random
    IME_CompanySettlement[9]  = -1  ; Arc Might           - Random
    IME_CompanySettlement[10] = 1   ; Celtcorp            - Neon
    IME_CompanySettlement[11] = 0   ; Reliant Medical     - New Atlantis
    IME_CompanySettlement[12] = 0   ; Argos Extractors    - New Atlantis
    IME_CompanySettlement[13] = -1  ; Consolidated Mining - Random
    IME_CompanySettlement[14] = -1  ; Six Sisters         - Random
    IME_CompanySettlement[15] = 1   ; Taiyo               - Neon
    IME_CompanySettlement[16] = -1  ; Trident             - Random
    IME_CompanySettlement[17] = 1   ; Stroud-Eklund       - Neon
    IME_CompanySettlement[18] = -1  ; Deimos              - Random
    IME_CompanySettlement[19] = -1  ; HopeTech            - Random
    IME_CompanySettlement[20] = -1  ; Nova Galactic       - Random
    IME_CompanySettlement[21] = 1   ; Slayton             - Neon
    IME_CompanySettlement[22] = -1  ; Amun Dunn           - Random
    IME_CompanySettlement[23] = -1  ; Panoptes            - Random
    IME_CompanySettlement[24] = -1  ; Reladyne            - Random
    IME_CompanySettlement[25] = -1  ; Dogstar             - Random
    IME_CompanySettlement[26] = 1   ; Sextant             - Neon
    IME_CompanySettlement[27] = 1   ; Nautilus            - Neon
    IME_CompanySettlement[28] = 1   ; Protectorate        - Neon
    IME_CompanySettlement[29] = -1  ; Vanguard            - Random
    IME_CompanySettlement[30] = 1   ; Deep Core           - Neon
    IME_CompanySettlement[31] = 1   ; Xiang               - Neon
    IME_CompanySettlement[32] = -1  ; Ballistics Sol.     - Random
    IME_CompanySettlement[33] = -1  ; Light Scythe        - Random
    IME_CompanySettlement[34] = 1   ; Shinigami           - Neon
    IME_CompanySettlement[35] = -1  ; Horizon Defence     - Random
    IME_CompanySettlement[36] = 0   ; SON                 - New Atlantis
    IME_CompanySettlement[37] = 3   ; Lunar Robotics      - Cydonia
    IME_CompanySettlement[38] = 0   ; Infinity Ltd        - New Atlantis
    IME_CompanySettlement[39] = -1  ; Ryujin              - Random (Neon-linked but multi-settle ok)
    IME_CompanySettlement[40] = 1   ; Kore Kinetics       - Neon
    IME_CompanySettlement[41] = 2   ; Laredo              - Akila
    IME_CompanySettlement[42] = -1  ; Aboron              - Random
EndFunction

; ── Tier data init functions are in IME_DataInit.psc (companion file)
; ── to keep this script under the Papyrus byte limit.
; ── They set IME_TierN_Names, IME_TierN_BaseValue, IME_TierN_Type,
; ── and IME_TierN_CompCount arrays.
; ── Called from OnInit() above.

Function InitTier1Data()
    ; Populated in IME_DataInit.psc — stub here for structure
EndFunction

Function InitTier2Data()
EndFunction

Function InitTier3Data()
EndFunction

Function InitTier4Data()
EndFunction

Function InitTier5Data()
EndFunction
