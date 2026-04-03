; ═══════════════════════════════════════════════════════════════════════════════
; IME_BoardActivatorScript
; Attached to: the exchange board object placed at Cydonia
;
; Responsibilities:
;   - Intercepts player activation of the board object
;   - Triggers a board data refresh check before opening the menu
;   - Opens the native mission board UI filtered to IME jobs only
;
; Note: this does NOT extend MissionBoardActivatorScript. It calls
; Game.ShowMissionBoardMenu() directly so the IME_MainQuestScript owns
; all refresh logic. The story manager and MissionParentScript are
; not involved — IME_MainQuestScript starts and stops job quests directly.
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_BoardActivatorScript Extends ObjectReference

; ── PROPERTIES — wire in CK ───────────────────────────────────────────────────

IME_MainQuestScript Property MainScript Auto Const Mandatory

; Wire to IME_FilterKeyword — only quests tagged with this keyword appear on
; this board. Assign the keyword to each IME_JobQuest_XX in the CK.
Keyword Property IME_FilterKeyword Auto Const Mandatory

; Optional faction theme for the board UI:
;   -1 = no theme (default)
;    1 = United Colonies
;    2 = Ryujin Industries
;    4 = Freestar
; See MissionBoardActivatorScript header for full list.
Int Property FactionID = -1 Auto Const

; ── ACTIVATION ────────────────────────────────────────────────────────────────

auto state default
    Event OnActivate(ObjectReference akActionRef)
        If akActionRef == Game.GetPlayer()
            GotoState("busy")
            MainScript.RefreshIfReady()
            Game.ShowMissionBoardMenu(IME_FilterKeyword, FactionID)
            GotoState("default")
        EndIf
    EndEvent
EndState

state busy
    ; Swallow repeated activations while the menu is open
    Event OnActivate(ObjectReference akActionRef)
    EndEvent
EndState
