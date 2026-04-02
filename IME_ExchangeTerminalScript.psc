; ═══════════════════════════════════════════════════════════════════════════════
; IME_ExchangeTerminalScript
; Attached to: IME_ExchangeTerminal (the job board at Cydonia)
;
; Responsibilities:
;   - Triggers refresh check when player opens the terminal
;   - Exposes per-slot display properties that terminal menu entries read
;   - Handles bid selection calls from terminal menu fragments
;   - Exposes contractor status (rep, tier unlock) for status page
;
; Terminal menu structure (set up in CK):
;   [Main Menu]
;   ├── Browse Open Orders
;   │   ├── Slot 0  [conditional: IME_SlotVisible_00 == 1]
;   │   │   ├── View Details  → shows detail properties
;   │   │   │   ├── Lowball Bid   → calls BidOnSlot(0, 0)
;   │   │   │   ├── Fair Offer    → calls BidOnSlot(0, 1)
;   │   │   │   └── High Bid      → calls BidOnSlot(0, 2)
;   │   ├── Slot 1 ... (repeat for all 11 slots)
;   ├── Active Contracts
;   │   └── (conditional entries per awarded slot)
;   └── Contractor Status
;       └── (reads IME_Display_Rep, IME_Display_TierUnlock)
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_ExchangeTerminalScript Extends ObjectReference

; ── PROPERTIES — wire in CK ───────────────────────────────────────────────────

IME_MainQuestScript Property MainScript Auto

; Terminal display properties — the terminal menu reads these globals/properties
; One set per slot (11 max). CK terminal menu entries reference these as
; conditions and display tokens.

; Slot visibility flags (1 = show in menu, 0 = hide)
; These are Int globals wired in the terminal conditions
GlobalVariable[] Property IME_SlotVisible    Auto  ; [11] 0 or 1
GlobalVariable[] Property IME_SlotAwarded    Auto  ; [11] 0 or 1

; Slot display string globals — terminal text uses GetValue() on these
GlobalVariable[] Property IME_SlotUrgency    Auto  ; [11] urgency tier 0/1/2
GlobalVariable[] Property IME_SlotTier       Auto  ; [11] resource tier
GlobalVariable[] Property IME_SlotHours      Auto  ; [11] hours remaining

; These are String properties because terminal text substitution can use them
; via a linked Message record that reads script properties
; (Wire as alias fill from this script in the CK)
String[] Property IME_Display_ResourceName   Auto  ; [11]
String[] Property IME_Display_CompanyName    Auto  ; [11]
String[] Property IME_Display_Settlement     Auto  ; [11]
String[] Property IME_Display_Quantity       Auto  ; [11] e.g. "250"
String[] Property IME_Display_FairPriceLow   Auto  ; [11] e.g. "18,750"  (fair * 0.85)
String[] Property IME_Display_FairPriceHigh  Auto  ; [11] e.g. "26,000"  (fair * 1.15)
String[] Property IME_Display_BidLowPrice    Auto  ; [11] lowball payout
String[] Property IME_Display_BidFairPrice   Auto  ; [11] fair payout
String[] Property IME_Display_BidHighPrice   Auto  ; [11] high payout
String[] Property IME_Display_WinChanceLow   Auto  ; [11] "High" / "Moderate" / "Low" / "Very Low"
String[] Property IME_Display_WinChanceFair  Auto  ; [11]
String[] Property IME_Display_WinChanceHigh  Auto  ; [11]
String[] Property IME_Display_UrgencyLabel   Auto  ; [11] "" / "[TIGHT]" / "[RUSH]"

; Active contracts display (for the Active Contracts page)
String[] Property IME_Active_ResourceName    Auto  ; [4] max active contracts
String[] Property IME_Active_Progress        Auto  ; [4] "47 / 200"
String[] Property IME_Active_Company         Auto  ; [4]
String[] Property IME_Active_Settlement      Auto  ; [4]
String[] Property IME_Active_HoursRemaining  Auto  ; [4]

; Contractor status page
String Property IME_Display_Rep          = "" Auto
String Property IME_Display_TierUnlock   = "" Auto

; Bid result scratch — read by terminal after BidOnSlot fires
; Terminal checks IME_BidResultGlobal (0=lose, 1=win) in a result menu entry
GlobalVariable Property IME_BidResultGlobal  Auto

; ── STATE ─────────────────────────────────────────────────────────────────────

; Most recently interacted slot index — set before bid options shown
Int Property IME_SelectedSlot = -1 Auto

; ═══════════════════════════════════════════════════════════════════════════════
; TERMINAL OPEN — called from terminal OnActivate fragment
; ═══════════════════════════════════════════════════════════════════════════════

Event OnActivate(ObjectReference akActionRef)
    ; Refresh board if overdue
    MainScript.RefreshIfReady()

    ; Rebuild all display properties
    UpdateAllDisplayProperties()
EndEvent

; ═══════════════════════════════════════════════════════════════════════════════
; DISPLAY UPDATE
; ═══════════════════════════════════════════════════════════════════════════════

Function UpdateAllDisplayProperties()
    Int i = 0
    While i < MainScript.IME_MaxSlots
        UpdateSlotDisplay(i)
        i += 1
    EndWhile
    UpdateActiveContractsDisplay()
    UpdateStatusDisplay()
EndFunction

Function UpdateSlotDisplay(Int aiSlotIndex)
    Bool isActive   = MainScript.IME_Slots[aiSlotIndex].isActive
    Bool isAwarded  = MainScript.IME_Slots[aiSlotIndex].isAwarded

    ; Visibility: show if active and not yet awarded
    IME_SlotVisible[aiSlotIndex].SetValueInt(isActive && !isAwarded ? 1 : 0)
    IME_SlotAwarded[aiSlotIndex].SetValueInt(isAwarded ? 1 : 0)

    If !isActive
        Return
    EndIf

    Int tier     = MainScript.IME_Slots[aiSlotIndex].resourceTier
    Int urgency  = MainScript.IME_Slots[aiSlotIndex].urgencyTier
    Int hoursRem = MainScript.GetHoursRemaining(aiSlotIndex)
    Int qty      = MainScript.IME_Slots[aiSlotIndex].quantity
    Int fair     = MainScript.IME_Slots[aiSlotIndex].fairPrice

    ; Globals for terminal conditions
    IME_SlotUrgency[aiSlotIndex].SetValueInt(urgency)
    IME_SlotTier[aiSlotIndex].SetValueInt(tier)
    IME_SlotHours[aiSlotIndex].SetValueInt(hoursRem)

    ; String display properties
    IME_Display_ResourceName[aiSlotIndex]  = MainScript.IME_Slots[aiSlotIndex].resourceName
    IME_Display_CompanyName[aiSlotIndex]   = MainScript.IME_Slots[aiSlotIndex].companyName
    IME_Display_Settlement[aiSlotIndex]    = MainScript.GetSettlementName(MainScript.IME_Slots[aiSlotIndex].settlementIndex)
    IME_Display_Quantity[aiSlotIndex]      = qty as String
    IME_Display_UrgencyLabel[aiSlotIndex]  = MainScript.GetUrgencyLabel(urgency)

    ; Fair price range — shown as estimate to preserve bid tension
    ; Show 85%-115% of fair price rather than exact figure
    Int fairLow  = (fair * 0.85) as Int
    Int fairHigh = (fair * 1.15) as Int
    IME_Display_FairPriceLow[aiSlotIndex]  = FormatCredits(fairLow)
    IME_Display_FairPriceHigh[aiSlotIndex] = FormatCredits(fairHigh)

    ; Bid payouts — exact amounts for each option
    Int bidLow  = (fair * MainScript.IME_BidMult_Lowball) as Int
    Int bidFair = (fair * MainScript.IME_BidMult_Fair)    as Int
    Int bidHigh = (fair * MainScript.IME_BidMult_High)    as Int
    IME_Display_BidLowPrice[aiSlotIndex]   = FormatCredits(bidLow)
    IME_Display_BidFairPrice[aiSlotIndex]  = FormatCredits(bidFair)
    IME_Display_BidHighPrice[aiSlotIndex]  = FormatCredits(bidHigh)

    ; Win chance labels
    IME_Display_WinChanceLow[aiSlotIndex]  = MainScript.GetWinChanceLabel(tier, 0)
    IME_Display_WinChanceFair[aiSlotIndex] = MainScript.GetWinChanceLabel(tier, 1)
    IME_Display_WinChanceHigh[aiSlotIndex] = MainScript.GetWinChanceLabel(tier, 2)
EndFunction

Function UpdateActiveContractsDisplay()
    ; Find all awarded slots and fill active display slots 0-3
    Int displayIdx = 0
    Int i = 0
    While i < MainScript.IME_MaxSlots && displayIdx < 4
        If MainScript.IME_Slots[i].isAwarded
            ; Find the contract quest for this slot to get delivery progress
            Int contractIdx = FindContractQuestForSlot(i)
            String progress = "? / ?"
            Int hoursRem    = 0
            If contractIdx >= 0
                IME_ContractQuestScript cs = MainScript.IME_ContractQuests[contractIdx] as IME_ContractQuestScript
                If cs
                    progress = cs.GetProgressString()
                    hoursRem = cs.GetHoursRemaining()
                EndIf
            EndIf
            IME_Active_ResourceName[displayIdx]   = MainScript.IME_Slots[i].resourceName
            IME_Active_Progress[displayIdx]       = progress
            IME_Active_Company[displayIdx]        = MainScript.IME_Slots[i].companyName
            IME_Active_Settlement[displayIdx]     = MainScript.GetSettlementName(MainScript.IME_Slots[i].settlementIndex)
            IME_Active_HoursRemaining[displayIdx] = hoursRem as String
            displayIdx += 1
        EndIf
        i += 1
    EndWhile
    ; Blank remaining display slots
    While displayIdx < 4
        IME_Active_ResourceName[displayIdx]   = ""
        IME_Active_Progress[displayIdx]       = ""
        IME_Active_Company[displayIdx]        = ""
        IME_Active_Settlement[displayIdx]     = ""
        IME_Active_HoursRemaining[displayIdx] = ""
        displayIdx += 1
    EndWhile
EndFunction

Function UpdateStatusDisplay()
    Int rep = MainScript.IME_Reputation.GetValueInt()
    IME_Display_Rep = rep as String

    ; Tier unlock status — show which tiers the player can realistically bid on
    String unlocks = "Tier 1: Open"
    If rep >= MainScript.IME_RepGate_T2
        unlocks += " | Tier 2: Open"
    Else
        unlocks += " | Tier 2: Locked (Rep " + MainScript.IME_RepGate_T2 + ")"
    EndIf
    If rep >= MainScript.IME_RepGate_T3
        unlocks += " | Tier 3: Open"
    Else
        unlocks += " | Tier 3: Locked (Rep " + MainScript.IME_RepGate_T3 + ")"
    EndIf
    If rep >= MainScript.IME_RepGate_T4
        unlocks += " | Tier 4: Open"
    Else
        unlocks += " | Tier 4: Locked (Rep " + MainScript.IME_RepGate_T4 + ")"
    EndIf
    If rep >= MainScript.IME_RepGate_T5
        unlocks += " | Tier 5: Open"
    Else
        unlocks += " | Tier 5: Locked (Rep " + MainScript.IME_RepGate_T5 + ")"
    EndIf
    IME_Display_TierUnlock = unlocks
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; BID HANDLING — called from terminal menu script fragments
; ═══════════════════════════════════════════════════════════════════════════════

; Called when player selects a slot to view details
Function SelectSlot(Int aiSlotIndex)
    IME_SelectedSlot = aiSlotIndex
EndFunction

; Called when player selects a bid option from the detail page
; aiBidType: 0=Lowball, 1=Fair, 2=High
Function BidOnSelectedSlot(Int aiBidType)
    If IME_SelectedSlot < 0
        Return
    EndIf

    Bool won = MainScript.BidOnSlot(IME_SelectedSlot, aiBidType)

    ; Write result to global so terminal condition can branch to win/lose page
    IME_BidResultGlobal.SetValueInt(won ? 1 : 0)

    ; Refresh display immediately so awarded slot moves to Active Contracts
    If won
        UpdateAllDisplayProperties()
    EndIf

    IME_SelectedSlot = -1
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; HELPERS
; ═══════════════════════════════════════════════════════════════════════════════

; Formats an integer as a credit string e.g. 18750 -> "18,750"
; Papyrus has no built-in number formatting so we do it manually
String Function FormatCredits(Int aiAmount)
    If aiAmount < 1000
        Return aiAmount as String
    ElseIf aiAmount < 1000000
        Int thousands = aiAmount / 1000
        Int remainder = aiAmount - (thousands * 1000)
        If remainder < 10
            Return thousands + ",00" + remainder
        ElseIf remainder < 100
            Return thousands + ",0" + remainder
        Else
            Return thousands + "," + remainder
        EndIf
    Else
        ; Millions — unlikely but handled
        Int millions  = aiAmount / 1000000
        Int remainder = (aiAmount - (millions * 1000000)) / 1000
        Return millions + "," + remainder + ",000"
    EndIf
EndFunction

Int Function FindContractQuestForSlot(Int aiSlotIndex)
    Int i = 0
    While i < MainScript.IME_ContractQuests.Length
        IME_ContractQuestScript cs = MainScript.IME_ContractQuests[i] as IME_ContractQuestScript
        If cs && cs.SlotIndex == aiSlotIndex
            Return i
        EndIf
        i += 1
    EndWhile
    Return -1
EndFunction
