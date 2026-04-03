; ═══════════════════════════════════════════════════════════════════════════════
; IME_DropoffTerminalScript
; Attached to: IME_Dropoff_NewAtlantis, IME_Dropoff_Neon,
;              IME_Dropoff_Akila, IME_Dropoff_Cydonia
;
; One script, four terminal placements. Set SettlementIndex in CK per instance:
;   0 = New Atlantis
;   1 = Neon
;   2 = Akila City
;   3 = Cydonia
;
; Responsibilities:
;   - Finds all active contracts assigned to this settlement
;   - Verifies player inventory against required items
;   - Removes items and triggers fulfillment on the main script
;   - Handles the case of no active contracts or insufficient cargo
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_DropoffTerminalScript Extends ObjectReference

; ── PROPERTIES — wire in CK ───────────────────────────────────────────────────

IME_MainQuestScript Property MainScript Auto

; Set this per terminal placement in the CK (0-3)
Int Property SettlementIndex = 0 Auto

; Item form references — wire every resource Form to a property here.
; Naming convention: IME_Item_<ResourceNameNoSpaces>
; e.g. IME_Item_Aluminum, IME_Item_FissionRod, etc.
; These are looked up by resource name via GetItemFormForResource()
; Full list must match all 102 resources in the data tables.
;
; For brevity, a representative sample is shown.
; The complete list follows the same pattern for all resources.
MiscObject Property IME_Item_Aluminum             Auto
MiscObject Property IME_Item_Argon                Auto
MiscObject Property IME_Item_Chlorine             Auto
MiscObject Property IME_Item_Copper               Auto
MiscObject Property IME_Item_Iron                 Auto
MiscObject Property IME_Item_Lead                 Auto
MiscObject Property IME_Item_Nickel               Auto
MiscObject Property IME_Item_Uranium              Auto
MiscObject Property IME_Item_Water                Auto
MiscObject Property IME_Item_Alkanes              Auto
MiscObject Property IME_Item_Benzene              Auto
MiscObject Property IME_Item_Beryllium            Auto
MiscObject Property IME_Item_Chlorosilanes        Auto
MiscObject Property IME_Item_Cobalt               Auto
MiscObject Property IME_Item_Fluorine             Auto
MiscObject Property IME_Item_Helium3              Auto
MiscObject Property IME_Item_Iridium              Auto
MiscObject Property IME_Item_Silver               Auto
MiscObject Property IME_Item_Tungsten             Auto
MiscObject Property IME_Item_CarboxylicAcids      Auto
MiscObject Property IME_Item_Gold                 Auto
MiscObject Property IME_Item_Lithium              Auto
MiscObject Property IME_Item_Mercury              Auto
MiscObject Property IME_Item_Neodymium            Auto
MiscObject Property IME_Item_Platinum             Auto
MiscObject Property IME_Item_Tantalum             Auto
MiscObject Property IME_Item_Tetrafluorides       Auto
MiscObject Property IME_Item_Titanium             Auto
MiscObject Property IME_Item_Vanadium             Auto
MiscObject Property IME_Item_Antimony             Auto
MiscObject Property IME_Item_Caesium              Auto
MiscObject Property IME_Item_Dysprosium           Auto
MiscObject Property IME_Item_Europium             Auto
MiscObject Property IME_Item_IonicLiquids         Auto
MiscObject Property IME_Item_Neon                 Auto
MiscObject Property IME_Item_Palladium            Auto
MiscObject Property IME_Item_Plutonium            Auto
MiscObject Property IME_Item_Xenon                Auto
MiscObject Property IME_Item_Ytterbium            Auto
MiscObject Property IME_Item_Aldumite             Auto
MiscObject Property IME_Item_Vytinium             Auto
MiscObject Property IME_Item_Fiber                Auto
MiscObject Property IME_Item_MetabolicAgent       Auto
MiscObject Property IME_Item_Nutrient             Auto
MiscObject Property IME_Item_Sealant              Auto
MiscObject Property IME_Item_StructuralMaterial   Auto
MiscObject Property IME_Item_Toxin                Auto
MiscObject Property IME_Item_Antimicrobial        Auto
MiscObject Property IME_Item_Cosmetic             Auto
MiscObject Property IME_Item_Membrane             Auto
MiscObject Property IME_Item_OrnamentalMaterial   Auto
MiscObject Property IME_Item_Pigment              Auto
MiscObject Property IME_Item_Spice                Auto
MiscObject Property IME_Item_Adhesive             Auto
MiscObject Property IME_Item_AminoAcids           Auto
MiscObject Property IME_Item_Analgesic            Auto
MiscObject Property IME_Item_Aromatic             Auto
MiscObject Property IME_Item_Hallucinogen         Auto
MiscObject Property IME_Item_Sedative             Auto
MiscObject Property IME_Item_Biosuppressant       Auto
MiscObject Property IME_Item_Hypercatalyst        Auto
MiscObject Property IME_Item_Lubricant            Auto
MiscObject Property IME_Item_Polymer              Auto
MiscObject Property IME_Item_Solvent              Auto
MiscObject Property IME_Item_Stimulant            Auto
MiscObject Property IME_Item_GastronomicDelight   Auto
MiscObject Property IME_Item_HighTensileSpidroin  Auto
MiscObject Property IME_Item_Immunostimulant      Auto
MiscObject Property IME_Item_LuxuryTextile        Auto
MiscObject Property IME_Item_MemorySubstrate      Auto
MiscObject Property IME_Item_AdaptiveFrame        Auto
MiscObject Property IME_Item_AustenicManifold     Auto
MiscObject Property IME_Item_CommRelay            Auto
MiscObject Property IME_Item_IsocenteredMagnet    Auto
MiscObject Property IME_Item_IsotopicCoolant      Auto
MiscObject Property IME_Item_MagPressureTank      Auto
MiscObject Property IME_Item_Monopropellant       Auto
MiscObject Property IME_Item_Polytextile          Auto
MiscObject Property IME_Item_ReactiveGauge        Auto
MiscObject Property IME_Item_TauGradeRheostat     Auto
MiscObject Property IME_Item_ZeroWire             Auto
MiscObject Property IME_Item_DrillingRig          Auto
MiscObject Property IME_Item_MolecularSieve       Auto
MiscObject Property IME_Item_ParamagnomConductor  Auto
MiscObject Property IME_Item_PositronBattery      Auto
MiscObject Property IME_Item_SemimetalWafer       Auto
MiscObject Property IME_Item_SupercooledMagnet    Auto
MiscObject Property IME_Item_ZeroGGimbal          Auto
MiscObject Property IME_Item_ControlRod           Auto
MiscObject Property IME_Item_MicrosecondRegulator Auto
MiscObject Property IME_Item_NuclearFuelRod       Auto
MiscObject Property IME_Item_PowerCircuit         Auto
MiscObject Property IME_Item_SterileNanotubes     Auto
MiscObject Property IME_Item_AldumiteDrillingRig  Auto
MiscObject Property IME_Item_IndiciteWafer        Auto
MiscObject Property IME_Item_RothiciteMagnet      Auto
MiscObject Property IME_Item_SubstrateMoleculeSieve Auto
MiscObject Property IME_Item_TasineSuperconductor Auto
MiscObject Property IME_Item_VerylTreatedManifold Auto
MiscObject Property IME_Item_VytiniumFuelRod      Auto

; Display result globals — terminal reads these after Fulfill() fires
; 0=none, 1=complete, 2=insufficient (zero in inventory), 3=no contract/item, 4=expired, 5=partial accepted
GlobalVariable Property IME_DropoffResultGlobal   Auto

; Display scratch for the result page
String Property IME_DropoffResult_ResourceName    = "" Auto
String Property IME_DropoffResult_Company         = "" Auto
String Property IME_DropoffResult_Payout          = "" Auto
String Property IME_DropoffResult_RepGained       = "" Auto
String Property IME_DropoffResult_PartialProgress = "" Auto  ; e.g. "47 / 200" — shown on partial result page

; ── STATE ─────────────────────────────────────────────────────────────────────

; Active contracts at this settlement — populated on terminal open
; Indices into IME_MainQuestScript.IME_Slots
Int[] IME_LocalContracts
Int   IME_LocalContractCount = 0

; Currently selected contract for fulfillment
Int IME_SelectedContractSlot = -1

; Display properties for the contract list (up to 4 active contracts)
String[] Property IME_Local_ResourceName  Auto  ; [4]
String[] Property IME_Local_Progress      Auto  ; [4]
String[] Property IME_Local_Company       Auto  ; [4]
String[] Property IME_Local_HoursRemaining Auto ; [4]

; Visibility globals for terminal conditional display
GlobalVariable[] Property IME_Local_Visible Auto  ; [4]

; ═══════════════════════════════════════════════════════════════════════════════
; TERMINAL OPEN
; ═══════════════════════════════════════════════════════════════════════════════

Event OnActivate(ObjectReference akActionRef)
    IME_DropoffResultGlobal.SetValue(0.0)
    FindLocalContracts()
    UpdateLocalDisplay()
EndEvent

; ═══════════════════════════════════════════════════════════════════════════════
; CONTRACT DISCOVERY
; ═══════════════════════════════════════════════════════════════════════════════

Function FindLocalContracts()
    IME_LocalContracts = new Int[4]
    IME_LocalContractCount = 0

    Int i = 0
    While i < MainScript.IME_MaxSlots && IME_LocalContractCount < 4
        If MainScript.IME_Slots[i].isAwarded
            If MainScript.IME_Slots[i].settlementIndex == SettlementIndex
                IME_LocalContracts[IME_LocalContractCount] = i
                IME_LocalContractCount += 1
            EndIf
        EndIf
        i += 1
    EndWhile
EndFunction

Function UpdateLocalDisplay()
    Int di = 0
    While di < 4
        If di < IME_LocalContractCount
            Int slotIdx = IME_LocalContracts[di]
            String progress = "? / ?"
            Int hoursRem    = 0

            ; Get progress from contract quest
            Int qi = FindContractQuest(slotIdx)
            If qi >= 0
                IME_ContractQuestScript cs = MainScript.IME_ContractQuests[qi] as IME_ContractQuestScript
                If cs
                    progress = cs.GetProgressString()
                    hoursRem = cs.GetHoursRemaining()
                EndIf
            EndIf

            IME_Local_ResourceName[di]   = MainScript.IME_Slots[slotIdx].resourceName
            IME_Local_Progress[di]       = progress
            IME_Local_Company[di]        = MainScript.IME_Slots[slotIdx].companyName
            IME_Local_HoursRemaining[di] = hoursRem as String
            IME_Local_Visible[di].SetValue(1.0)
        Else
            IME_Local_ResourceName[di]   = ""
            IME_Local_Progress[di]       = ""
            IME_Local_Company[di]        = ""
            IME_Local_HoursRemaining[di] = ""
            IME_Local_Visible[di].SetValue(0.0)
        EndIf
        di += 1
    EndWhile
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; FULFILLMENT — called from terminal menu fragment
; ═══════════════════════════════════════════════════════════════════════════════

; Called when player selects a contract from the list
Function SelectContract(Int aiLocalIndex)
    If aiLocalIndex >= 0 && aiLocalIndex < IME_LocalContractCount
        IME_SelectedContractSlot = IME_LocalContracts[aiLocalIndex]
    Else
        IME_SelectedContractSlot = -1
    EndIf
EndFunction

; Called when player confirms delivery
Function AttemptFulfill()
    If IME_SelectedContractSlot < 0
        IME_DropoffResultGlobal.SetValue(3.0)  ; no contract selected
        Return
    EndIf

    Int slotIdx = IME_SelectedContractSlot
    Actor player = Game.GetPlayer()

    ; Check deadline first
    If Utility.GetCurrentGameTime() > MainScript.IME_Slots[slotIdx].deadlineGameTime
        MainScript.FailContract(slotIdx)
        IME_DropoffResultGlobal.SetValue(4.0)  ; expired
        FindLocalContracts()
        UpdateLocalDisplay()
        Return
    EndIf

    String resName = MainScript.IME_Slots[slotIdx].resourceName
    Int required   = MainScript.IME_Slots[slotIdx].quantity
    MiscObject itemForm = GetItemFormForResource(resName)

    If itemForm == None
        Debug.Trace("IME_DropoffTerminal: No item form found for " + resName)
        IME_DropoffResultGlobal.SetValue(3.0)
        Return
    EndIf

    ; Find contract quest once — reused below
    Int qi = FindContractQuest(slotIdx)
    IME_ContractQuestScript cs = None
    If qi >= 0
        cs = MainScript.IME_ContractQuests[qi] as IME_ContractQuestScript
    EndIf

    Int alreadyDelivered = 0
    If cs
        alreadyDelivered = cs.QuantityDelivered
    EndIf
    Int stillNeeded = required - alreadyDelivered

    ; Reject if player has nothing to deliver
    Int playerHas = player.GetItemCount(itemForm)
    If playerHas <= 0
        IME_DropoffResult_ResourceName = resName
        IME_DropoffResultGlobal.SetValue(2.0)  ; insufficient cargo
        Return
    EndIf

    ; Deliver as much as player has, capped at what's still needed
    Int toDeliver = playerHas
    If toDeliver > stillNeeded
        toDeliver = stillNeeded
    EndIf

    player.RemoveItem(itemForm, toDeliver, True)

    Bool complete = False
    If cs
        complete = cs.AddDelivery(toDeliver)
    EndIf

    IME_DropoffResult_ResourceName = resName
    IME_DropoffResult_Company      = MainScript.IME_Slots[slotIdx].companyName

    If complete
        ; Full delivery — capture payout and rep display, then fulfill
        Int payout = MainScript.IME_Slots[slotIdx].awardedPrice
        IME_DropoffResult_Payout = FormatCredits(payout)

        Int tier      = MainScript.IME_Slots[slotIdx].resourceTier
        Float awarded = MainScript.IME_Slots[slotIdx].awardedGameTime
        Float deadline = MainScript.IME_Slots[slotIdx].deadlineGameTime
        Int flatRep   = MainScript.GetTierRepComplete(tier)
        Float timeRem = (deadline - Utility.GetCurrentGameTime()) * 24.0
        Float totalWindow = (deadline - awarded) * 24.0
        Float earlyFrac = 0.0
        If totalWindow > 0.0
            earlyFrac = timeRem / totalWindow
            If earlyFrac > 1.0
                earlyFrac = 1.0
            EndIf
        EndIf
        Int earlyBonus = (earlyFrac * (flatRep as Float * MainScript.IME_EarlyBonusFraction)) as Int
        IME_DropoffResult_RepGained       = "+" + (flatRep + earlyBonus) as String
        IME_DropoffResult_PartialProgress = ""

        MainScript.FulfillContract(slotIdx, player as ObjectReference)
        IME_DropoffResultGlobal.SetValue(1.0)  ; complete
    Else
        ; Partial delivery accepted — show running total, no payout yet
        Int newDelivered = alreadyDelivered + toDeliver
        IME_DropoffResult_Payout          = ""
        IME_DropoffResult_RepGained       = ""
        IME_DropoffResult_PartialProgress = (newDelivered as String) + " / " + (required as String)
        IME_DropoffResultGlobal.SetValue(5.0)  ; partial accepted
    EndIf

    IME_SelectedContractSlot = -1
    FindLocalContracts()
    UpdateLocalDisplay()
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; ITEM FORM LOOKUP
; Maps resource name string to the wired MiscObject property.
; Papyrus has no dictionary so this is an If/ElseIf chain.
; ═══════════════════════════════════════════════════════════════════════════════

MiscObject Function GetItemFormForResource(String asResourceName)
    ; Inorganic - Tier 1
    If asResourceName == "Aluminum"             ; Return IME_Item_Aluminum
        Return IME_Item_Aluminum
    ElseIf asResourceName == "Argon"
        Return IME_Item_Argon
    ElseIf asResourceName == "Chlorine"
        Return IME_Item_Chlorine
    ElseIf asResourceName == "Copper"
        Return IME_Item_Copper
    ElseIf asResourceName == "Iron"
        Return IME_Item_Iron
    ElseIf asResourceName == "Lead"
        Return IME_Item_Lead
    ElseIf asResourceName == "Nickel"
        Return IME_Item_Nickel
    ElseIf asResourceName == "Uranium"
        Return IME_Item_Uranium
    ElseIf asResourceName == "Water"
        Return IME_Item_Water
    ElseIf asResourceName == "Alkanes"
        Return IME_Item_Alkanes
    ElseIf asResourceName == "Benzene"
        Return IME_Item_Benzene
    ElseIf asResourceName == "Beryllium"
        Return IME_Item_Beryllium
    ElseIf asResourceName == "Chlorosilanes"
        Return IME_Item_Chlorosilanes
    ElseIf asResourceName == "Cobalt"
        Return IME_Item_Cobalt
    ElseIf asResourceName == "Fluorine"
        Return IME_Item_Fluorine
    ElseIf asResourceName == "Helium-3"
        Return IME_Item_Helium3
    ElseIf asResourceName == "Iridium"
        Return IME_Item_Iridium
    ElseIf asResourceName == "Silver"
        Return IME_Item_Silver
    ElseIf asResourceName == "Tungsten"
        Return IME_Item_Tungsten
    ; Inorganic - Tier 2
    ElseIf asResourceName == "Carboxylic Acids"
        Return IME_Item_CarboxylicAcids
    ElseIf asResourceName == "Gold"
        Return IME_Item_Gold
    ElseIf asResourceName == "Lithium"
        Return IME_Item_Lithium
    ElseIf asResourceName == "Mercury"
        Return IME_Item_Mercury
    ElseIf asResourceName == "Neodymium"
        Return IME_Item_Neodymium
    ElseIf asResourceName == "Platinum"
        Return IME_Item_Platinum
    ElseIf asResourceName == "Tantalum"
        Return IME_Item_Tantalum
    ElseIf asResourceName == "Tetrafluorides"
        Return IME_Item_Tetrafluorides
    ElseIf asResourceName == "Titanium"
        Return IME_Item_Titanium
    ElseIf asResourceName == "Vanadium"
        Return IME_Item_Vanadium
    ; Inorganic - Tier 3
    ElseIf asResourceName == "Antimony"
        Return IME_Item_Antimony
    ElseIf asResourceName == "Caesium"
        Return IME_Item_Caesium
    ElseIf asResourceName == "Dysprosium"
        Return IME_Item_Dysprosium
    ElseIf asResourceName == "Europium"
        Return IME_Item_Europium
    ElseIf asResourceName == "Ionic Liquids"
        Return IME_Item_IonicLiquids
    ElseIf asResourceName == "Neon"
        Return IME_Item_Neon
    ElseIf asResourceName == "Palladium"
        Return IME_Item_Palladium
    ElseIf asResourceName == "Plutonium"
        Return IME_Item_Plutonium
    ElseIf asResourceName == "Xenon"
        Return IME_Item_Xenon
    ElseIf asResourceName == "Ytterbium"
        Return IME_Item_Ytterbium
    ; Inorganic - Tier 4/5
    ElseIf asResourceName == "Aldumite"
        Return IME_Item_Aldumite
    ElseIf asResourceName == "Vytinium"
        Return IME_Item_Vytinium
    ; Organic - Tier 1
    ElseIf asResourceName == "Fiber"
        Return IME_Item_Fiber
    ElseIf asResourceName == "Metabolic Agent"
        Return IME_Item_MetabolicAgent
    ElseIf asResourceName == "Nutrient"
        Return IME_Item_Nutrient
    ElseIf asResourceName == "Sealant"
        Return IME_Item_Sealant
    ElseIf asResourceName == "Structural Material"
        Return IME_Item_StructuralMaterial
    ElseIf asResourceName == "Toxin"
        Return IME_Item_Toxin
    ElseIf asResourceName == "Antimicrobial"
        Return IME_Item_Antimicrobial
    ElseIf asResourceName == "Cosmetic"
        Return IME_Item_Cosmetic
    ElseIf asResourceName == "Membrane"
        Return IME_Item_Membrane
    ElseIf asResourceName == "Ornamental Material"
        Return IME_Item_OrnamentalMaterial
    ElseIf asResourceName == "Pigment"
        Return IME_Item_Pigment
    ElseIf asResourceName == "Spice"
        Return IME_Item_Spice
    ; Organic - Tier 2
    ElseIf asResourceName == "Adhesive"
        Return IME_Item_Adhesive
    ElseIf asResourceName == "Amino Acids"
        Return IME_Item_AminoAcids
    ElseIf asResourceName == "Analgesic"
        Return IME_Item_Analgesic
    ElseIf asResourceName == "Aromatic"
        Return IME_Item_Aromatic
    ElseIf asResourceName == "Hallucinogen"
        Return IME_Item_Hallucinogen
    ElseIf asResourceName == "Sedative"
        Return IME_Item_Sedative
    ; Organic - Tier 3
    ElseIf asResourceName == "Biosuppressant"
        Return IME_Item_Biosuppressant
    ElseIf asResourceName == "Hypercatalyst"
        Return IME_Item_Hypercatalyst
    ElseIf asResourceName == "Lubricant"
        Return IME_Item_Lubricant
    ElseIf asResourceName == "Polymer"
        Return IME_Item_Polymer
    ElseIf asResourceName == "Solvent"
        Return IME_Item_Solvent
    ElseIf asResourceName == "Stimulant"
        Return IME_Item_Stimulant
    ; Organic - Tier 4
    ElseIf asResourceName == "Gastronomic Delight"
        Return IME_Item_GastronomicDelight
    ElseIf asResourceName == "High-Tensile Spidroin"
        Return IME_Item_HighTensileSpidroin
    ElseIf asResourceName == "Immunostimulant"
        Return IME_Item_Immunostimulant
    ElseIf asResourceName == "Luxury Textile"
        Return IME_Item_LuxuryTextile
    ElseIf asResourceName == "Memory Substrate"
        Return IME_Item_MemorySubstrate
    ; Manufactured - Tier 2
    ElseIf asResourceName == "Adaptive Frame"
        Return IME_Item_AdaptiveFrame
    ElseIf asResourceName == "Austenitic Manifold"
        Return IME_Item_AustenicManifold
    ElseIf asResourceName == "Comm Relay"
        Return IME_Item_CommRelay
    ElseIf asResourceName == "Isocentered Magnet"
        Return IME_Item_IsocenteredMagnet
    ElseIf asResourceName == "Isotopic Coolant"
        Return IME_Item_IsotopicCoolant
    ElseIf asResourceName == "Mag Pressure Tank"
        Return IME_Item_MagPressureTank
    ElseIf asResourceName == "Monopropellant"
        Return IME_Item_Monopropellant
    ElseIf asResourceName == "Polytextile"
        Return IME_Item_Polytextile
    ElseIf asResourceName == "Reactive Gauge"
        Return IME_Item_ReactiveGauge
    ElseIf asResourceName == "Tau Grade Rheostat"
        Return IME_Item_TauGradeRheostat
    ElseIf asResourceName == "Zero Wire"
        Return IME_Item_ZeroWire
    ; Manufactured - Tier 3
    ElseIf asResourceName == "Drilling Rig"
        Return IME_Item_DrillingRig
    ElseIf asResourceName == "Molecular Sieve"
        Return IME_Item_MolecularSieve
    ElseIf asResourceName == "Paramagnon Conductor"
        Return IME_Item_ParamagnomConductor
    ElseIf asResourceName == "Positron Battery"
        Return IME_Item_PositronBattery
    ElseIf asResourceName == "Semimetal Wafer"
        Return IME_Item_SemimetalWafer
    ElseIf asResourceName == "Supercooled Magnet"
        Return IME_Item_SupercooledMagnet
    ElseIf asResourceName == "Zero-G Gimbal"
        Return IME_Item_ZeroGGimbal
    ; Manufactured - Tier 4
    ElseIf asResourceName == "Control Rod"
        Return IME_Item_ControlRod
    ElseIf asResourceName == "Microsecond Regulator"
        Return IME_Item_MicrosecondRegulator
    ElseIf asResourceName == "Nuclear Fuel Rod"
        Return IME_Item_NuclearFuelRod
    ElseIf asResourceName == "Power Circuit"
        Return IME_Item_PowerCircuit
    ElseIf asResourceName == "Sterile Nanotubes"
        Return IME_Item_SterileNanotubes
    ; Manufactured - Tier 5
    ElseIf asResourceName == "Aldumite Drilling Rig"
        Return IME_Item_AldumiteDrillingRig
    ElseIf asResourceName == "Indicite Wafer"
        Return IME_Item_IndiciteWafer
    ElseIf asResourceName == "Rothicite Magnet"
        Return IME_Item_RothiciteMagnet
    ElseIf asResourceName == "Substrate Molecule Sieve"
        Return IME_Item_SubstrateMoleculeSieve
    ElseIf asResourceName == "Tasine Superconductor"
        Return IME_Item_TasineSuperconductor
    ElseIf asResourceName == "Veryl-Treated Manifold"
        Return IME_Item_VerylTreatedManifold
    ElseIf asResourceName == "Vytinium Fuel Rod"
        Return IME_Item_VytiniumFuelRod
    EndIf

    Return None  ; not found — caller handles gracefully
EndFunction

; ═══════════════════════════════════════════════════════════════════════════════
; HELPERS
; ═══════════════════════════════════════════════════════════════════════════════

Int Function FindContractQuest(Int aiSlotIndex)
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
        Int millions  = aiAmount / 1000000
        Int remainder = (aiAmount - (millions * 1000000)) / 1000
        Return millions + "," + remainder + ",000"
    EndIf
EndFunction
