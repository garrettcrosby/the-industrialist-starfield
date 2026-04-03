; ═══════════════════════════════════════════════════════════════════════════════
; IME_JobQuestScript
; Attached to: IME_JobQuest_00 through IME_JobQuest_11
;
; Responsibilities:
;   - Represents a single available job slot on the mission board
;   - Populates per-quest display globals when a slot is assigned
;   - Overrides HandleOnMissionAccepted() to present bid options
;   - Routes bid result back to the vanilla MissionAccepted() flow
;
; Lifecycle:
;   Started directly by IME_MainQuestScript.PopulateSingleSlot()
;   Stopped directly by IME_MainQuestScript.ClearSlot()
;   MissionAccepted(true) after a won bid — quest leaves the available list
;   MissionAccepted(false) on a lost bid or cancel — stays on board
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_JobQuestScript Extends MissionQuestScript

; ── PROPERTIES — wire in CK ───────────────────────────────────────────────────

IME_MainQuestScript Property IMEMain Auto Const Mandatory

; Per-quest display globals — wire a unique GlobalVariable form per quest.
; Quest description text references these as <Global=IME_Job_XX_Tier> etc.
; so each of the 12 job quests needs its own set of 5 globals in the CK.
GlobalVariable Property IME_Job_Tier    Auto Const Mandatory
GlobalVariable Property IME_Job_Urgency Auto Const Mandatory
GlobalVariable Property IME_Job_Qty     Auto Const Mandatory
GlobalVariable Property IME_Job_Hours   Auto Const Mandatory
GlobalVariable Property IME_Job_Fair    Auto Const Mandatory

; ── STATE ─────────────────────────────────────────────────────────────────────

; Which slot in IME_MainQuestScript.IME_Slots this quest currently represents.
; -1 means unassigned. Set by IMEMain.PopulateSingleSlot(), cleared on Stop().
Int Property SlotIndex = -1 Auto Hidden

; ═══════════════════════════════════════════════════════════════════════════════
; INITIALISATION — called by IME_MainQuestScript after starting this quest
; ═══════════════════════════════════════════════════════════════════════════════

Function InitJobQuest(Int aiSlotIndex)
    SlotIndex = aiSlotIndex

    IME_Job_Tier.SetValue(IMEMain.IME_Slots[aiSlotIndex].resourceTier)
    IME_Job_Urgency.SetValue(IMEMain.IME_Slots[aiSlotIndex].urgencyTier)
    IME_Job_Qty.SetValue(IMEMain.IME_Slots[aiSlotIndex].quantity)
    IME_Job_Hours.SetValue(IMEMain.GetHoursRemaining(aiSlotIndex))
    IME_Job_Fair.SetValue(IMEMain.IME_Slots[aiSlotIndex].fairPrice)
EndFunction

; Called by IME_MainQuestScript.ClearSlot() to retire this quest
Function ClearJobQuest()
    SlotIndex = -1
    Stop()
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; BID FLOW — fired by the mission board when player selects this job
; ═══════════════════════════════════════════════════════════════════════════════

; Override from MissionQuestScript
Function HandleOnMissionAccepted()
    If SlotIndex < 0
        MissionAccepted(false)
        Return
    EndIf

    ; Update bid price globals so the bid message tokens show current values
    Int fair = IMEMain.IME_Slots[SlotIndex].fairPrice
    IMEMain.IME_BidGlobal_Low.SetValue((fair  * IMEMain.IME_BidMult_Lowball) as Int)
    IMEMain.IME_BidGlobal_Fair.SetValue(fair)
    IMEMain.IME_BidGlobal_High.SetValue((fair * IMEMain.IME_BidMult_High) as Int)

    ; Show bid selection message
    ; Button 0 = Lowball, 1 = Fair Offer, 2 = High Bid, 3 = Cancel
    Int choice = IMEMain.IME_BidSelectMessage.Show()

    If choice == 3  ; Cancel — leave quest on board unchanged
        MissionAccepted(false)
        Return
    EndIf

    Bool won = IMEMain.BidOnSlot(SlotIndex, choice)

    If won
        IMEMain.IME_BidWinMessage.Show()
        MissionAccepted(true)   ; quest marked accepted, removed from available list
    Else
        IMEMain.IME_BidLoseMessage.Show()
        MissionAccepted(false)  ; stays on board for another attempt
    EndIf
EndFunction

; Override from MissionQuestScript — provides the reward value shown on the board
Int Function GetActualReward()
    If SlotIndex < 0
        Return 0
    EndIf
    Return IMEMain.IME_Slots[SlotIndex].fairPrice
EndFunction
