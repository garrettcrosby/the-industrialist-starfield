; ═══════════════════════════════════════════════════════════════════════════════
; IME_DataInit.psc
; Attached to: IME_MainQuest (same quest as IME_MainQuestScript, as alias script)
; Auto-generated from the_industrialist_mod_v2.xlsx
;
; Populates all resource name/value/type/compcount arrays on the main quest script.
; Split into a companion file to keep IME_MainQuestScript under the byte limit.
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_DataInit Extends Quest

; Reference back to the main script — wire this property in CK
IME_MainQuestScript Property MainScript Auto

Event OnInit()
    InitTier1Data()
    InitTier2Data()
    InitTier3Data()
    InitTier4Data()
    InitTier5Data()
EndEvent

; ── TIER 1 (31 resources) ──────────────────────────────────────────────────
Function InitTier1Data()
    MainScript.IME_Tier1_Names      = new String[31]
    MainScript.IME_Tier1_BaseValue  = new Int[31]
    MainScript.IME_Tier1_Type       = new String[31]
    MainScript.IME_Tier1_CompCount  = new Int[31]

    MainScript.IME_Tier1_Names[ 0]     = "Alkanes"
    MainScript.IME_Tier1_BaseValue[ 0]  = 13
    MainScript.IME_Tier1_Type[ 0]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[ 0]  = 5

    MainScript.IME_Tier1_Names[ 1]     = "Aluminum"
    MainScript.IME_Tier1_BaseValue[ 1]  = 7
    MainScript.IME_Tier1_Type[ 1]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[ 1]  = 27

    MainScript.IME_Tier1_Names[ 2]     = "Antimicrobial"
    MainScript.IME_Tier1_BaseValue[ 2]  = 10
    MainScript.IME_Tier1_Type[ 2]       = "Organic"
    MainScript.IME_Tier1_CompCount[ 2]  = 6

    MainScript.IME_Tier1_Names[ 3]     = "Argon"
    MainScript.IME_Tier1_BaseValue[ 3]  = 5
    MainScript.IME_Tier1_Type[ 3]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[ 3]  = 3

    MainScript.IME_Tier1_Names[ 4]     = "Benzene"
    MainScript.IME_Tier1_BaseValue[ 4]  = 19
    MainScript.IME_Tier1_Type[ 4]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[ 4]  = 2

    MainScript.IME_Tier1_Names[ 5]     = "Beryllium"
    MainScript.IME_Tier1_BaseValue[ 5]  = 12
    MainScript.IME_Tier1_Type[ 5]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[ 5]  = 5

    MainScript.IME_Tier1_Names[ 6]     = "Chlorine"
    MainScript.IME_Tier1_BaseValue[ 6]  = 6
    MainScript.IME_Tier1_Type[ 6]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[ 6]  = 6

    MainScript.IME_Tier1_Names[ 7]     = "Chlorosilanes"
    MainScript.IME_Tier1_BaseValue[ 7]  = 14
    MainScript.IME_Tier1_Type[ 7]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[ 7]  = 5

    MainScript.IME_Tier1_Names[ 8]     = "Cobalt"
    MainScript.IME_Tier1_BaseValue[ 8]  = 12
    MainScript.IME_Tier1_Type[ 8]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[ 8]  = 3

    MainScript.IME_Tier1_Names[ 9]     = "Copper"
    MainScript.IME_Tier1_BaseValue[ 9]  = 10
    MainScript.IME_Tier1_Type[ 9]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[ 9]  = 6

    MainScript.IME_Tier1_Names[10]     = "Cosmetic"
    MainScript.IME_Tier1_BaseValue[10]  = 8
    MainScript.IME_Tier1_Type[10]       = "Organic"
    MainScript.IME_Tier1_CompCount[10]  = 3

    MainScript.IME_Tier1_Names[11]     = "Fiber"
    MainScript.IME_Tier1_BaseValue[11]  = 4
    MainScript.IME_Tier1_Type[11]       = "Organic"
    MainScript.IME_Tier1_CompCount[11]  = 2

    MainScript.IME_Tier1_Names[12]     = "Fluorine"
    MainScript.IME_Tier1_BaseValue[12]  = 12
    MainScript.IME_Tier1_Type[12]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[12]  = 3

    MainScript.IME_Tier1_Names[13]     = "Helium-3"
    MainScript.IME_Tier1_BaseValue[13]  = 5
    MainScript.IME_Tier1_Type[13]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[13]  = 21

    MainScript.IME_Tier1_Names[14]     = "Iridium"
    MainScript.IME_Tier1_BaseValue[14]  = 14
    MainScript.IME_Tier1_Type[14]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[14]  = 24

    MainScript.IME_Tier1_Names[15]     = "Iron"
    MainScript.IME_Tier1_BaseValue[15]  = 8
    MainScript.IME_Tier1_Type[15]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[15]  = 30

    MainScript.IME_Tier1_Names[16]     = "Lead"
    MainScript.IME_Tier1_BaseValue[16]  = 10
    MainScript.IME_Tier1_Type[16]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[16]  = 3

    MainScript.IME_Tier1_Names[17]     = "Membrane"
    MainScript.IME_Tier1_BaseValue[17]  = 9
    MainScript.IME_Tier1_Type[17]       = "Organic"
    MainScript.IME_Tier1_CompCount[17]  = 7

    MainScript.IME_Tier1_Names[18]     = "Metabolic Agent"
    MainScript.IME_Tier1_BaseValue[18]  = 9
    MainScript.IME_Tier1_Type[18]       = "Organic"
    MainScript.IME_Tier1_CompCount[18]  = 2

    MainScript.IME_Tier1_Names[19]     = "Nickel"
    MainScript.IME_Tier1_BaseValue[19]  = 10
    MainScript.IME_Tier1_Type[19]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[19]  = 6

    MainScript.IME_Tier1_Names[20]     = "Nutrient"
    MainScript.IME_Tier1_BaseValue[20]  = 5
    MainScript.IME_Tier1_Type[20]       = "Organic"
    MainScript.IME_Tier1_CompCount[20]  = 5

    MainScript.IME_Tier1_Names[21]     = "Ornamental Material"
    MainScript.IME_Tier1_BaseValue[21]  = 11
    MainScript.IME_Tier1_Type[21]       = "Organic"
    MainScript.IME_Tier1_CompCount[21]  = 3

    MainScript.IME_Tier1_Names[22]     = "Pigment"
    MainScript.IME_Tier1_BaseValue[22]  = 10
    MainScript.IME_Tier1_Type[22]       = "Organic"
    MainScript.IME_Tier1_CompCount[22]  = 3

    MainScript.IME_Tier1_Names[23]     = "Sealant"
    MainScript.IME_Tier1_BaseValue[23]  = 6
    MainScript.IME_Tier1_Type[23]       = "Organic"
    MainScript.IME_Tier1_CompCount[23]  = 27

    MainScript.IME_Tier1_Names[24]     = "Silver"
    MainScript.IME_Tier1_BaseValue[24]  = 20
    MainScript.IME_Tier1_Type[24]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[24]  = 4

    MainScript.IME_Tier1_Names[25]     = "Spice"
    MainScript.IME_Tier1_BaseValue[25]  = 11
    MainScript.IME_Tier1_Type[25]       = "Organic"
    MainScript.IME_Tier1_CompCount[25]  = 5

    MainScript.IME_Tier1_Names[26]     = "Structural Material"
    MainScript.IME_Tier1_BaseValue[26]  = 7
    MainScript.IME_Tier1_Type[26]       = "Organic"
    MainScript.IME_Tier1_CompCount[26]  = 3

    MainScript.IME_Tier1_Names[27]     = "Toxin"
    MainScript.IME_Tier1_BaseValue[27]  = 8
    MainScript.IME_Tier1_Type[27]       = "Organic"
    MainScript.IME_Tier1_CompCount[27]  = 7

    MainScript.IME_Tier1_Names[28]     = "Tungsten"
    MainScript.IME_Tier1_BaseValue[28]  = 16
    MainScript.IME_Tier1_Type[28]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[28]  = 27

    MainScript.IME_Tier1_Names[29]     = "Uranium"
    MainScript.IME_Tier1_BaseValue[29]  = 14
    MainScript.IME_Tier1_Type[29]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[29]  = 22

    MainScript.IME_Tier1_Names[30]     = "Water"
    MainScript.IME_Tier1_BaseValue[30]  = 4
    MainScript.IME_Tier1_Type[30]       = "Inorganic"
    MainScript.IME_Tier1_CompCount[30]  = 32

EndFunction

; ── TIER 2 (27 resources) ──────────────────────────────────────────────────
Function InitTier2Data()
    MainScript.IME_Tier2_Names      = new String[27]
    MainScript.IME_Tier2_BaseValue  = new Int[27]
    MainScript.IME_Tier2_Type       = new String[27]
    MainScript.IME_Tier2_CompCount  = new Int[27]

    MainScript.IME_Tier2_Names[ 0]     = "Adaptive Frame"
    MainScript.IME_Tier2_BaseValue[ 0]  = 24
    MainScript.IME_Tier2_Type[ 0]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[ 0]  = 24

    MainScript.IME_Tier2_Names[ 1]     = "Adhesive"
    MainScript.IME_Tier2_BaseValue[ 1]  = 12
    MainScript.IME_Tier2_Type[ 1]       = "Organic"
    MainScript.IME_Tier2_CompCount[ 1]  = 3

    MainScript.IME_Tier2_Names[ 2]     = "Amino Acids"
    MainScript.IME_Tier2_BaseValue[ 2]  = 10
    MainScript.IME_Tier2_Type[ 2]       = "Organic"
    MainScript.IME_Tier2_CompCount[ 2]  = 2

    MainScript.IME_Tier2_Names[ 3]     = "Analgesic"
    MainScript.IME_Tier2_BaseValue[ 3]  = 12
    MainScript.IME_Tier2_Type[ 3]       = "Organic"
    MainScript.IME_Tier2_CompCount[ 3]  = 3

    MainScript.IME_Tier2_Names[ 4]     = "Aromatic"
    MainScript.IME_Tier2_BaseValue[ 4]  = 11
    MainScript.IME_Tier2_Type[ 4]       = "Organic"
    MainScript.IME_Tier2_CompCount[ 4]  = 1

    MainScript.IME_Tier2_Names[ 5]     = "Austenitic Manifold"
    MainScript.IME_Tier2_BaseValue[ 5]  = 79
    MainScript.IME_Tier2_Type[ 5]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[ 5]  = 24

    MainScript.IME_Tier2_Names[ 6]     = "Carboxylic Acids"
    MainScript.IME_Tier2_BaseValue[ 6]  = 12
    MainScript.IME_Tier2_Type[ 6]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[ 6]  = 2

    MainScript.IME_Tier2_Names[ 7]     = "Comm Relay"
    MainScript.IME_Tier2_BaseValue[ 7]  = 117
    MainScript.IME_Tier2_Type[ 7]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[ 7]  = 21

    MainScript.IME_Tier2_Names[ 8]     = "Gold"
    MainScript.IME_Tier2_BaseValue[ 8]  = 24
    MainScript.IME_Tier2_Type[ 8]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[ 8]  = 4

    MainScript.IME_Tier2_Names[ 9]     = "Hallucinogen"
    MainScript.IME_Tier2_BaseValue[ 9]  = 14
    MainScript.IME_Tier2_Type[ 9]       = "Organic"
    MainScript.IME_Tier2_CompCount[ 9]  = 2

    MainScript.IME_Tier2_Names[10]     = "Isocentered Magnet"
    MainScript.IME_Tier2_BaseValue[10]  = 36
    MainScript.IME_Tier2_Type[10]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[10]  = 24

    MainScript.IME_Tier2_Names[11]     = "Isotopic Coolant"
    MainScript.IME_Tier2_BaseValue[11]  = 25
    MainScript.IME_Tier2_Type[11]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[11]  = 25

    MainScript.IME_Tier2_Names[12]     = "Lithium"
    MainScript.IME_Tier2_BaseValue[12]  = 14
    MainScript.IME_Tier2_Type[12]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[12]  = 25

    MainScript.IME_Tier2_Names[13]     = "Mag Pressure Tank"
    MainScript.IME_Tier2_BaseValue[13]  = 25
    MainScript.IME_Tier2_Type[13]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[13]  = 10

    MainScript.IME_Tier2_Names[14]     = "Mercury"
    MainScript.IME_Tier2_BaseValue[14]  = 22
    MainScript.IME_Tier2_Type[14]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[14]  = 2

    MainScript.IME_Tier2_Names[15]     = "Monopropellant"
    MainScript.IME_Tier2_BaseValue[15]  = 76
    MainScript.IME_Tier2_Type[15]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[15]  = 21

    MainScript.IME_Tier2_Names[16]     = "Neodymium"
    MainScript.IME_Tier2_BaseValue[16]  = 20
    MainScript.IME_Tier2_Type[16]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[16]  = 24

    MainScript.IME_Tier2_Names[17]     = "Platinum"
    MainScript.IME_Tier2_BaseValue[17]  = 24
    MainScript.IME_Tier2_Type[17]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[17]  = 6

    MainScript.IME_Tier2_Names[18]     = "Polytextile"
    MainScript.IME_Tier2_BaseValue[18]  = 25
    MainScript.IME_Tier2_Type[18]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[18]  = 4

    MainScript.IME_Tier2_Names[19]     = "Reactive Gauge"
    MainScript.IME_Tier2_BaseValue[19]  = 25
    MainScript.IME_Tier2_Type[19]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[19]  = 3

    MainScript.IME_Tier2_Names[20]     = "Sedative"
    MainScript.IME_Tier2_BaseValue[20]  = 12
    MainScript.IME_Tier2_Type[20]       = "Organic"
    MainScript.IME_Tier2_CompCount[20]  = 7

    MainScript.IME_Tier2_Names[21]     = "Tantalum"
    MainScript.IME_Tier2_BaseValue[21]  = 23
    MainScript.IME_Tier2_Type[21]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[21]  = 24

    MainScript.IME_Tier2_Names[22]     = "Tau Grade Rheostat"
    MainScript.IME_Tier2_BaseValue[22]  = 82
    MainScript.IME_Tier2_Type[22]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[22]  = 22

    MainScript.IME_Tier2_Names[23]     = "Tetrafluorides"
    MainScript.IME_Tier2_BaseValue[23]  = 18
    MainScript.IME_Tier2_Type[23]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[23]  = 2

    MainScript.IME_Tier2_Names[24]     = "Titanium"
    MainScript.IME_Tier2_BaseValue[24]  = 12
    MainScript.IME_Tier2_Type[24]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[24]  = 30

    MainScript.IME_Tier2_Names[25]     = "Vanadium"
    MainScript.IME_Tier2_BaseValue[25]  = 24
    MainScript.IME_Tier2_Type[25]       = "Inorganic"
    MainScript.IME_Tier2_CompCount[25]  = 6

    MainScript.IME_Tier2_Names[26]     = "Zero Wire"
    MainScript.IME_Tier2_BaseValue[26]  = 52
    MainScript.IME_Tier2_Type[26]       = "Manufactured"
    MainScript.IME_Tier2_CompCount[26]  = 28

EndFunction

; ── TIER 3 (23 resources) ──────────────────────────────────────────────────
Function InitTier3Data()
    MainScript.IME_Tier3_Names      = new String[23]
    MainScript.IME_Tier3_BaseValue  = new Int[23]
    MainScript.IME_Tier3_Type       = new String[23]
    MainScript.IME_Tier3_CompCount  = new Int[23]

    MainScript.IME_Tier3_Names[ 0]     = "Antimony"
    MainScript.IME_Tier3_BaseValue[ 0]  = 30
    MainScript.IME_Tier3_Type[ 0]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[ 0]  = 21

    MainScript.IME_Tier3_Names[ 1]     = "Biosuppressant"
    MainScript.IME_Tier3_BaseValue[ 1]  = 16
    MainScript.IME_Tier3_Type[ 1]       = "Organic"
    MainScript.IME_Tier3_CompCount[ 1]  = 2

    MainScript.IME_Tier3_Names[ 2]     = "Caesium"
    MainScript.IME_Tier3_BaseValue[ 2]  = 25
    MainScript.IME_Tier3_Type[ 2]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[ 2]  = 25

    MainScript.IME_Tier3_Names[ 3]     = "Drilling Rig"
    MainScript.IME_Tier3_BaseValue[ 3]  = 143
    MainScript.IME_Tier3_Type[ 3]       = "Manufactured"
    MainScript.IME_Tier3_CompCount[ 3]  = 3

    MainScript.IME_Tier3_Names[ 4]     = "Dysprosium"
    MainScript.IME_Tier3_BaseValue[ 4]  = 56
    MainScript.IME_Tier3_Type[ 4]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[ 4]  = 4

    MainScript.IME_Tier3_Names[ 5]     = "Europium"
    MainScript.IME_Tier3_BaseValue[ 5]  = 40
    MainScript.IME_Tier3_Type[ 5]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[ 5]  = 21

    MainScript.IME_Tier3_Names[ 6]     = "Hypercatalyst"
    MainScript.IME_Tier3_BaseValue[ 6]  = 18
    MainScript.IME_Tier3_Type[ 6]       = "Organic"
    MainScript.IME_Tier3_CompCount[ 6]  = 2

    MainScript.IME_Tier3_Names[ 7]     = "Ionic Liquids"
    MainScript.IME_Tier3_BaseValue[ 7]  = 23
    MainScript.IME_Tier3_Type[ 7]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[ 7]  = 27

    MainScript.IME_Tier3_Names[ 8]     = "Lubricant"
    MainScript.IME_Tier3_BaseValue[ 8]  = 18
    MainScript.IME_Tier3_Type[ 8]       = "Organic"
    MainScript.IME_Tier3_CompCount[ 8]  = 6

    MainScript.IME_Tier3_Names[ 9]     = "Molecular Sieve"
    MainScript.IME_Tier3_BaseValue[ 9]  = 91
    MainScript.IME_Tier3_Type[ 9]       = "Manufactured"
    MainScript.IME_Tier3_CompCount[ 9]  = 12

    MainScript.IME_Tier3_Names[10]     = "Neon"
    MainScript.IME_Tier3_BaseValue[10]  = 16
    MainScript.IME_Tier3_Type[10]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[10]  = 3

    MainScript.IME_Tier3_Names[11]     = "Palladium"
    MainScript.IME_Tier3_BaseValue[11]  = 25
    MainScript.IME_Tier3_Type[11]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[11]  = 21

    MainScript.IME_Tier3_Names[12]     = "Paramagnon Conductor"
    MainScript.IME_Tier3_BaseValue[12]  = 153
    MainScript.IME_Tier3_Type[12]       = "Manufactured"
    MainScript.IME_Tier3_CompCount[12]  = 22

    MainScript.IME_Tier3_Names[13]     = "Plutonium"
    MainScript.IME_Tier3_BaseValue[13]  = 64
    MainScript.IME_Tier3_Type[13]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[13]  = 6

    MainScript.IME_Tier3_Names[14]     = "Polymer"
    MainScript.IME_Tier3_BaseValue[14]  = 20
    MainScript.IME_Tier3_Type[14]       = "Organic"
    MainScript.IME_Tier3_CompCount[14]  = 7

    MainScript.IME_Tier3_Names[15]     = "Positron Battery"
    MainScript.IME_Tier3_BaseValue[15]  = 133
    MainScript.IME_Tier3_Type[15]       = "Manufactured"
    MainScript.IME_Tier3_CompCount[15]  = 21

    MainScript.IME_Tier3_Names[16]     = "Semimetal Wafer"
    MainScript.IME_Tier3_BaseValue[16]  = 149
    MainScript.IME_Tier3_Type[16]       = "Manufactured"
    MainScript.IME_Tier3_CompCount[16]  = 6

    MainScript.IME_Tier3_Names[17]     = "Solvent"
    MainScript.IME_Tier3_BaseValue[17]  = 19
    MainScript.IME_Tier3_Type[17]       = "Organic"
    MainScript.IME_Tier3_CompCount[17]  = 9

    MainScript.IME_Tier3_Names[18]     = "Stimulant"
    MainScript.IME_Tier3_BaseValue[18]  = 20
    MainScript.IME_Tier3_Type[18]       = "Organic"
    MainScript.IME_Tier3_CompCount[18]  = 7

    MainScript.IME_Tier3_Names[19]     = "Supercooled Magnet"
    MainScript.IME_Tier3_BaseValue[19]  = 111
    MainScript.IME_Tier3_Type[19]       = "Manufactured"
    MainScript.IME_Tier3_CompCount[19]  = 22

    MainScript.IME_Tier3_Names[20]     = "Xenon"
    MainScript.IME_Tier3_BaseValue[20]  = 27
    MainScript.IME_Tier3_Type[20]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[20]  = 3

    MainScript.IME_Tier3_Names[21]     = "Ytterbium"
    MainScript.IME_Tier3_BaseValue[21]  = 38
    MainScript.IME_Tier3_Type[21]       = "Inorganic"
    MainScript.IME_Tier3_CompCount[21]  = 21

    MainScript.IME_Tier3_Names[22]     = "Zero-G Gimbal"
    MainScript.IME_Tier3_BaseValue[22]  = 93
    MainScript.IME_Tier3_Type[22]       = "Manufactured"
    MainScript.IME_Tier3_CompCount[22]  = 21

EndFunction

; ── TIER 4 (14 resources) ──────────────────────────────────────────────────
Function InitTier4Data()
    MainScript.IME_Tier4_Names      = new String[14]
    MainScript.IME_Tier4_BaseValue  = new Int[14]
    MainScript.IME_Tier4_Type       = new String[14]
    MainScript.IME_Tier4_CompCount  = new Int[14]

    MainScript.IME_Tier4_Names[ 0]     = "Aldumite"
    MainScript.IME_Tier4_BaseValue[ 0]  = 84
    MainScript.IME_Tier4_Type[ 0]       = "Inorganic"
    MainScript.IME_Tier4_CompCount[ 0]  = 3

    MainScript.IME_Tier4_Names[ 1]     = "Control Rod"
    MainScript.IME_Tier4_BaseValue[ 1]  = 180
    MainScript.IME_Tier4_Type[ 1]       = "Manufactured"
    MainScript.IME_Tier4_CompCount[ 1]  = 28

    MainScript.IME_Tier4_Names[ 2]     = "Gastronomic Delight"
    MainScript.IME_Tier4_BaseValue[ 2]  = 66
    MainScript.IME_Tier4_Type[ 2]       = "Organic"
    MainScript.IME_Tier4_CompCount[ 2]  = 5

    MainScript.IME_Tier4_Names[ 3]     = "High-Tensile Spidroin"
    MainScript.IME_Tier4_BaseValue[ 3]  = 62
    MainScript.IME_Tier4_Type[ 3]       = "Organic"
    MainScript.IME_Tier4_CompCount[ 3]  = 2

    MainScript.IME_Tier4_Names[ 4]     = "Immunostimulant"
    MainScript.IME_Tier4_BaseValue[ 4]  = 58
    MainScript.IME_Tier4_Type[ 4]       = "Organic"
    MainScript.IME_Tier4_CompCount[ 4]  = 2

    MainScript.IME_Tier4_Names[ 5]     = "Luxury Textile"
    MainScript.IME_Tier4_BaseValue[ 5]  = 58
    MainScript.IME_Tier4_Type[ 5]       = "Organic"
    MainScript.IME_Tier4_CompCount[ 5]  = 2

    MainScript.IME_Tier4_Names[ 6]     = "Memory Substrate"
    MainScript.IME_Tier4_BaseValue[ 6]  = 65
    MainScript.IME_Tier4_Type[ 6]       = "Organic"
    MainScript.IME_Tier4_CompCount[ 6]  = 6

    MainScript.IME_Tier4_Names[ 7]     = "Microsecond Regulator"
    MainScript.IME_Tier4_BaseValue[ 7]  = 212
    MainScript.IME_Tier4_Type[ 7]       = "Manufactured"
    MainScript.IME_Tier4_CompCount[ 7]  = 8

    MainScript.IME_Tier4_Names[ 8]     = "Neurologic"
    MainScript.IME_Tier4_BaseValue[ 8]  = 67
    MainScript.IME_Tier4_Type[ 8]       = "Organic"
    MainScript.IME_Tier4_CompCount[ 8]  = 6

    MainScript.IME_Tier4_Names[ 9]     = "Nuclear Fuel Rod"
    MainScript.IME_Tier4_BaseValue[ 9]  = 225
    MainScript.IME_Tier4_Type[ 9]       = "Manufactured"
    MainScript.IME_Tier4_CompCount[ 9]  = 1

    MainScript.IME_Tier4_Names[10]     = "Power Circuit"
    MainScript.IME_Tier4_BaseValue[10]  = 195
    MainScript.IME_Tier4_Type[10]       = "Manufactured"
    MainScript.IME_Tier4_CompCount[10]  = 1

    MainScript.IME_Tier4_Names[11]     = "Quark-Degenerate Tissues"
    MainScript.IME_Tier4_BaseValue[11]  = 240
    MainScript.IME_Tier4_Type[11]       = "Organic"
    MainScript.IME_Tier4_CompCount[11]  = 5

    MainScript.IME_Tier4_Names[12]     = "Sterile Nanotubes"
    MainScript.IME_Tier4_BaseValue[12]  = 130
    MainScript.IME_Tier4_Type[12]       = "Manufactured"
    MainScript.IME_Tier4_CompCount[12]  = 21

    MainScript.IME_Tier4_Names[13]     = "Vytinium"
    MainScript.IME_Tier4_BaseValue[13]  = 116
    MainScript.IME_Tier4_Type[13]       = "Inorganic"
    MainScript.IME_Tier4_CompCount[13]  = 1

EndFunction

; ── TIER 5 (7 resources) ──────────────────────────────────────────────────
Function InitTier5Data()
    MainScript.IME_Tier5_Names      = new String[7]
    MainScript.IME_Tier5_BaseValue  = new Int[7]
    MainScript.IME_Tier5_Type       = new String[7]
    MainScript.IME_Tier5_CompCount  = new Int[7]

    MainScript.IME_Tier5_Names[ 0]     = "Aldumite Drilling Rig"
    MainScript.IME_Tier5_BaseValue[ 0]  = 421
    MainScript.IME_Tier5_Type[ 0]       = "Manufactured"
    MainScript.IME_Tier5_CompCount[ 0]  = 3

    MainScript.IME_Tier5_Names[ 1]     = "Indicite Wafer"
    MainScript.IME_Tier5_BaseValue[ 1]  = 243
    MainScript.IME_Tier5_Type[ 1]       = "Manufactured"
    MainScript.IME_Tier5_CompCount[ 1]  = 8

    MainScript.IME_Tier5_Names[ 2]     = "Rothicite Magnet"
    MainScript.IME_Tier5_BaseValue[ 2]  = 295
    MainScript.IME_Tier5_Type[ 2]       = "Manufactured"
    MainScript.IME_Tier5_CompCount[ 2]  = 1

    MainScript.IME_Tier5_Names[ 3]     = "Substrate Molecule Sieve"
    MainScript.IME_Tier5_BaseValue[ 3]  = 274
    MainScript.IME_Tier5_Type[ 3]       = "Manufactured"
    MainScript.IME_Tier5_CompCount[ 3]  = 6

    MainScript.IME_Tier5_Names[ 4]     = "Tasine Superconductor"
    MainScript.IME_Tier5_BaseValue[ 4]  = 299
    MainScript.IME_Tier5_Type[ 4]       = "Manufactured"
    MainScript.IME_Tier5_CompCount[ 4]  = 1

    MainScript.IME_Tier5_Names[ 5]     = "Veryl-Treated Manifold"
    MainScript.IME_Tier5_BaseValue[ 5]  = 295
    MainScript.IME_Tier5_Type[ 5]       = "Manufactured"
    MainScript.IME_Tier5_CompCount[ 5]  = 24

    MainScript.IME_Tier5_Names[ 6]     = "Vytinium Fuel Rod"
    MainScript.IME_Tier5_BaseValue[ 6]  = 836
    MainScript.IME_Tier5_Type[ 6]       = "Manufactured"
    MainScript.IME_Tier5_CompCount[ 6]  = 22

EndFunction
