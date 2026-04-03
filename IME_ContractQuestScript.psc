; ═══════════════════════════════════════════════════════════════════════════════
; IME_ContractQuestScript
; Attached to: IME_Contract_01 through IME_Contract_08
;
; Responsibilities:
;   - Holds per-contract state for the quest journal
;   - Drives the quest objective display (quantity tracking)
;   - Monitors its own deadline and calls FailContract if missed
;   - Exposes SlotIndex so the main script can find it by slot
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_ContractQuestScript Extends Quest

; ── PROPERTIES — wire in CK ───────────────────────────────────────────────────

; Reference to the main quest script — wire in CK
IME_MainQuestScript Property MainScript Auto

; Quest stages — set these up in the CK quest stage editor:
;   Stage 0:   Dormant (initial)
;   Stage 10:  Active contract — objective set, deadline running
;   Stage 100: Complete
;   Stage 200: Failed
Int Property STAGE_DORMANT   = 0   AutoReadOnly
Int Property STAGE_ACTIVE    = 10  AutoReadOnly
Int Property STAGE_COMPLETE  = 100 AutoReadOnly
Int Property STAGE_FAILED    = 200 AutoReadOnly

; How often to check the deadline, in in-game hours
Float Property DeadlineCheckInterval = 1.0 AutoReadOnly

; ── STATE ─────────────────────────────────────────────────────────────────────

; Which slot in IME_MainQuestScript.IME_Slots this contract maps to
Int Property SlotIndex = -1 Auto

; Cached from slot at contract activation — used for objective display
String Property ResourceName    = "" Auto
Int    Property QuantityRequired = 0  Auto
Int    Property QuantityDelivered = 0 Auto
String Property CompanyName     = "" Auto
String Property SettlementName  = "" Auto
Int    Property AwardedPrice    = 0   Auto
Int    Property ResourceTier    = 0   Auto
Float  Property DeadlineGameTime = 0.0 Auto

; ═══════════════════════════════════════════════════════════════════════════════
; LIFECYCLE
; ═══════════════════════════════════════════════════════════════════════════════

; Called by IME_MainQuestScript.ActivateContractQuest()
Function InitContract(Int aiSlotIndex)
    SlotIndex = aiSlotIndex

    ; Cache display values from slot
    ResourceName      = MainScript.IME_Slots[aiSlotIndex].resourceName
    QuantityRequired  = MainScript.IME_Slots[aiSlotIndex].quantity
    QuantityDelivered = 0
    CompanyName       = MainScript.IME_Slots[aiSlotIndex].companyName
    AwardedPrice      = MainScript.IME_Slots[aiSlotIndex].awardedPrice
    ResourceTier      = MainScript.IME_Slots[aiSlotIndex].resourceTier
    DeadlineGameTime  = MainScript.IME_Slots[aiSlotIndex].deadlineGameTime

    Int settlementIdx = MainScript.IME_Slots[aiSlotIndex].settlementIndex
    SettlementName    = MainScript.GetSettlementName(settlementIdx)

    ; Advance quest to active stage — this triggers the journal objective
    SetCurrentStageID(STAGE_ACTIVE)

    ; Begin deadline monitoring
    StartTimer(60.0, 1)
EndFunction

; Fires every 60 real seconds — checks game time internally for deadline
Event OnTimer(Int aiTimerID)
    If GetCurrentStageID() != STAGE_ACTIVE
        Return
    EndIf

    ; Check deadline
    If Utility.GetCurrentGameTime() > DeadlineGameTime
        ; Main script handles rep penalty and slot cleanup
        MainScript.FailContract(SlotIndex)
        ; FailContract() calls back to FailContract() on this script — do not re-register
        Return
    EndIf

    StartTimer(60.0, 1)
EndEvent

; ═══════════════════════════════════════════════════════════════════════════════
; CALLED BY MAIN SCRIPT
; ═══════════════════════════════════════════════════════════════════════════════

Function CompleteContract()
    SetCurrentStageID(STAGE_COMPLETE)
    SlotIndex = -1
EndFunction

Function FailContract()
    SetCurrentStageID(STAGE_FAILED)
    SlotIndex = -1
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; CALLED BY DROPOFF TERMINAL SCRIPT
; Increments delivery count and updates objective display.
; Returns true if contract is now fully delivered.
; ═══════════════════════════════════════════════════════════════════════════════

Bool Function AddDelivery(Int aiAmount)
    QuantityDelivered += aiAmount
    If QuantityDelivered > QuantityRequired
        QuantityDelivered = QuantityRequired
    EndIf

    ; The quest objective counter in the CK should be set up as:
    ;   Objective text: "Deliver <alias=ResourceName> to <alias=CompanyName>, <alias=SettlementName>"
    ;   Counter: QuantityDelivered / QuantityRequired
    ; Update the counter via quest objective count (wired to QuantityDelivered property)

    If QuantityDelivered >= QuantityRequired
        Return True
    EndIf
    Return False
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; DISPLAY HELPERS — called by terminal scripts for status display
; ═══════════════════════════════════════════════════════════════════════════════

; Returns hours remaining as integer for display
Int Function GetHoursRemaining()
    Float remaining = DeadlineGameTime - Utility.GetCurrentGameTime()
    If remaining < 0.0
        Return 0
    EndIf
    Return (remaining * 24.0) as Int
EndFunction

; Returns delivery progress string e.g. "47 / 200"
String Function GetProgressString()
    Return QuantityDelivered + " / " + QuantityRequired
EndFunction

; Returns true if this contract is for the given settlement index
Bool Function IsForSettlement(Int aiSettlementIndex)
    If SlotIndex < 0
        Return False
    EndIf
    Return MainScript.IME_Slots[SlotIndex].settlementIndex == aiSettlementIndex
EndFunction
