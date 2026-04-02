; ═══════════════════════════════════════════════════════════════════════════════
; IME_DataInit.psc
; Attached to: IME_MainQuest (as a second quest script alongside IME_MainQuestScript)
; Auto-generated from rfp_master_list.csv
;
; Populates all static job pool arrays and company data on the main quest script.
; The JobTemplate struct is defined in IME_MainQuestScript.
; Call InitAll() from IME_MainQuestScript.OnInit() before PopulateSlots().
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_DataInit Extends Quest

; Reference to main script — wire in CK
IME_MainQuestScript Property MainScript Auto

Event OnInit()
    ; Called automatically — but main script also calls InitAll() explicitly
    ; to guarantee ordering. No-op if already initialized.
EndEvent

Function InitAll()
    InitCompanyData()
    InitTier1Jobs()
    InitTier2Jobs()
    InitTier3Jobs()
    InitTier4Jobs()
    InitTier5Jobs()
EndFunction

; ── COMPANY DATA (49 companies) ────────────────────────────────────────────────
Function InitCompanyData()
    MainScript.IME_CompanyCount = 49
    MainScript.IME_CompanyNames      = new String[49]
    MainScript.IME_CompanySettlement = new Int[49]

    MainScript.IME_CompanyNames[ 0]      = "Aboron"
    MainScript.IME_CompanySettlement[ 0] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[ 1]      = "Advanced Nutrition"
    MainScript.IME_CompanySettlement[ 1] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[ 2]      = "Allied Armaments"
    MainScript.IME_CompanySettlement[ 2] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[ 3]      = "Amun Dunn"
    MainScript.IME_CompanySettlement[ 3] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[ 4]      = "Arc Might"
    MainScript.IME_CompanySettlement[ 4] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[ 5]      = "Argos Extractors"
    MainScript.IME_CompanySettlement[ 5] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[ 6]      = "Armco"
    MainScript.IME_CompanySettlement[ 6] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[ 7]      = "Axion Energy"
    MainScript.IME_CompanySettlement[ 7] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[ 8]      = "Ballistics Solutions"
    MainScript.IME_CompanySettlement[ 8] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[ 9]      = "Celtcorp"
    MainScript.IME_CompanySettlement[ 9] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[10]      = "Centauri Mills"
    MainScript.IME_CompanySettlement[10] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[11]      = "Chandra Vineyards"
    MainScript.IME_CompanySettlement[11] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[12]      = "Chunks"
    MainScript.IME_CompanySettlement[12] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[13]      = "Combatech"
    MainScript.IME_CompanySettlement[13] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[14]      = "Consolidated Mining"
    MainScript.IME_CompanySettlement[14] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[15]      = "Deep Core"
    MainScript.IME_CompanySettlement[15] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[16]      = "Deimos Staryards"
    MainScript.IME_CompanySettlement[16] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[17]      = "Dogstar"
    MainScript.IME_CompanySettlement[17] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[18]      = "Eit Clothiers"
    MainScript.IME_CompanySettlement[18] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[19]      = "Enhance"
    MainScript.IME_CompanySettlement[19] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[20]      = "Filburn Agriculture"
    MainScript.IME_CompanySettlement[20] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[21]      = "Galbank"
    MainScript.IME_CompanySettlement[21] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[22]      = "Generdyne Industries"
    MainScript.IME_CompanySettlement[22] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[23]      = "Hopetech"
    MainScript.IME_CompanySettlement[23] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[24]      = "Horizon Defence"
    MainScript.IME_CompanySettlement[24] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[25]      = "Infinity Ltd"
    MainScript.IME_CompanySettlement[25] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[26]      = "Kore Kinetics"
    MainScript.IME_CompanySettlement[26] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[27]      = "Laredo"
    MainScript.IME_CompanySettlement[27] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[28]      = "Light Scythe"
    MainScript.IME_CompanySettlement[28] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[29]      = "Lunar Robotics"
    MainScript.IME_CompanySettlement[29] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[30]      = "Muybridge Pharmaceuticals"
    MainScript.IME_CompanySettlement[30] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[31]      = "Nautilus"
    MainScript.IME_CompanySettlement[31] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[32]      = "Nova Galactic"
    MainScript.IME_CompanySettlement[32] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[33]      = "Panoptes"
    MainScript.IME_CompanySettlement[33] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[34]      = "Protectorate Systems"
    MainScript.IME_CompanySettlement[34] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[35]      = "Reladyne"
    MainScript.IME_CompanySettlement[35] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[36]      = "Reliant Medical"
    MainScript.IME_CompanySettlement[36] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[37]      = "Ryujin"
    MainScript.IME_CompanySettlement[37] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[38]      = "Sextant Shield Systems"
    MainScript.IME_CompanySettlement[38] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[39]      = "Shinigami"
    MainScript.IME_CompanySettlement[39] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[40]      = "Six Sisters"
    MainScript.IME_CompanySettlement[40] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[41]      = "Slayton Aerospace"
    MainScript.IME_CompanySettlement[41] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[42]      = "Son"
    MainScript.IME_CompanySettlement[42] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[43]      = "Stroud Eklund"
    MainScript.IME_CompanySettlement[43] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[44]      = "Taiyo Astroneering"
    MainScript.IME_CompanySettlement[44] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[45]      = "Trident Luxury Lines"
    MainScript.IME_CompanySettlement[45] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[46]      = "Vanguard"
    MainScript.IME_CompanySettlement[46] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[47]      = "Xenofresh Fisheries"
    MainScript.IME_CompanySettlement[47] = 0  ; New Atlantis (single dropoff terminal)

    MainScript.IME_CompanyNames[48]      = "Xiang"
    MainScript.IME_CompanySettlement[48] = 0  ; New Atlantis (single dropoff terminal)

EndFunction

; ── TIER 1 (128 jobs | TCV 375 - 3,000) ──────────────────────────────────────────
Function InitTier1Jobs()
    MainScript.IME_Tier1_JobCount = 128
    MainScript.IME_JobPool_T1 = new IME_MainQuestScript:JobTemplate[128]

    ; [  0] Nautilus — Helium-3 x75  TCV=375  168h
    MainScript.IME_JobPool_T1[0] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[0].resourceName  = "Helium-3"
    MainScript.IME_JobPool_T1[0].companyName   = "Nautilus"
    MainScript.IME_JobPool_T1[0].companyIndex  = 31
    MainScript.IME_JobPool_T1[0].quantity      = 75
    MainScript.IME_JobPool_T1[0].baseValue     = 5
    MainScript.IME_JobPool_T1[0].deadlineHours = 168
    MainScript.IME_JobPool_T1[0].rarity        = "Uncommon"

    ; [  1] Ryujin — Biosuppressant x25  TCV=400  294h
    MainScript.IME_JobPool_T1[1] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[1].resourceName  = "Biosuppressant"
    MainScript.IME_JobPool_T1[1].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[1].companyIndex  = 37
    MainScript.IME_JobPool_T1[1].quantity      = 25
    MainScript.IME_JobPool_T1[1].baseValue     = 16
    MainScript.IME_JobPool_T1[1].deadlineHours = 294
    MainScript.IME_JobPool_T1[1].rarity        = "Exotic"

    ; [  2] Eit Clothiers — Fiber x100  TCV=400  126h
    MainScript.IME_JobPool_T1[2] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[2].resourceName  = "Fiber"
    MainScript.IME_JobPool_T1[2].companyName   = "Eit Clothiers"
    MainScript.IME_JobPool_T1[2].companyIndex  = 18
    MainScript.IME_JobPool_T1[2].quantity      = 100
    MainScript.IME_JobPool_T1[2].baseValue     = 4
    MainScript.IME_JobPool_T1[2].deadlineHours = 126
    MainScript.IME_JobPool_T1[2].rarity        = "Common"

    ; [  3] Armco — Water x100  TCV=400  126h
    MainScript.IME_JobPool_T1[3] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[3].resourceName  = "Water"
    MainScript.IME_JobPool_T1[3].companyName   = "Armco"
    MainScript.IME_JobPool_T1[3].companyIndex  = 6
    MainScript.IME_JobPool_T1[3].quantity      = 100
    MainScript.IME_JobPool_T1[3].baseValue     = 4
    MainScript.IME_JobPool_T1[3].deadlineHours = 126
    MainScript.IME_JobPool_T1[3].rarity        = "Common"

    ; [  4] Centauri Mills — Water x100  TCV=400  126h
    MainScript.IME_JobPool_T1[4] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[4].resourceName  = "Water"
    MainScript.IME_JobPool_T1[4].companyName   = "Centauri Mills"
    MainScript.IME_JobPool_T1[4].companyIndex  = 10
    MainScript.IME_JobPool_T1[4].quantity      = 100
    MainScript.IME_JobPool_T1[4].baseValue     = 4
    MainScript.IME_JobPool_T1[4].deadlineHours = 126
    MainScript.IME_JobPool_T1[4].rarity        = "Common"

    ; [  5] Filburn Agriculture — Water x100  TCV=400  126h
    MainScript.IME_JobPool_T1[5] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[5].resourceName  = "Water"
    MainScript.IME_JobPool_T1[5].companyName   = "Filburn Agriculture"
    MainScript.IME_JobPool_T1[5].companyIndex  = 20
    MainScript.IME_JobPool_T1[5].quantity      = 100
    MainScript.IME_JobPool_T1[5].baseValue     = 4
    MainScript.IME_JobPool_T1[5].deadlineHours = 126
    MainScript.IME_JobPool_T1[5].rarity        = "Common"

    ; [  6] Kore Kinetics — Lubricant x25  TCV=450  294h
    MainScript.IME_JobPool_T1[6] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[6].resourceName  = "Lubricant"
    MainScript.IME_JobPool_T1[6].companyName   = "Kore Kinetics"
    MainScript.IME_JobPool_T1[6].companyIndex  = 26
    MainScript.IME_JobPool_T1[6].quantity      = 25
    MainScript.IME_JobPool_T1[6].baseValue     = 18
    MainScript.IME_JobPool_T1[6].deadlineHours = 294
    MainScript.IME_JobPool_T1[6].rarity        = "Exotic"

    ; [  7] Laredo — Lubricant x25  TCV=450  294h
    MainScript.IME_JobPool_T1[7] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[7].resourceName  = "Lubricant"
    MainScript.IME_JobPool_T1[7].companyName   = "Laredo"
    MainScript.IME_JobPool_T1[7].companyIndex  = 27
    MainScript.IME_JobPool_T1[7].quantity      = 25
    MainScript.IME_JobPool_T1[7].baseValue     = 18
    MainScript.IME_JobPool_T1[7].deadlineHours = 294
    MainScript.IME_JobPool_T1[7].rarity        = "Exotic"

    ; [  8] Celtcorp — Solvent x25  TCV=475  294h
    MainScript.IME_JobPool_T1[8] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[8].resourceName  = "Solvent"
    MainScript.IME_JobPool_T1[8].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[8].companyIndex  = 9
    MainScript.IME_JobPool_T1[8].quantity      = 25
    MainScript.IME_JobPool_T1[8].baseValue     = 19
    MainScript.IME_JobPool_T1[8].deadlineHours = 294
    MainScript.IME_JobPool_T1[8].rarity        = "Exotic"

    ; [  9] Armco — Argon x100  TCV=500  126h
    MainScript.IME_JobPool_T1[9] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[9].resourceName  = "Argon"
    MainScript.IME_JobPool_T1[9].companyName   = "Armco"
    MainScript.IME_JobPool_T1[9].companyIndex  = 6
    MainScript.IME_JobPool_T1[9].quantity      = 100
    MainScript.IME_JobPool_T1[9].baseValue     = 5
    MainScript.IME_JobPool_T1[9].deadlineHours = 126
    MainScript.IME_JobPool_T1[9].rarity        = "Common"

    ; [ 10] Celtcorp — Argon x100  TCV=500  126h
    MainScript.IME_JobPool_T1[10] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[10].resourceName  = "Argon"
    MainScript.IME_JobPool_T1[10].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[10].companyIndex  = 9
    MainScript.IME_JobPool_T1[10].quantity      = 100
    MainScript.IME_JobPool_T1[10].baseValue     = 5
    MainScript.IME_JobPool_T1[10].deadlineHours = 126
    MainScript.IME_JobPool_T1[10].rarity        = "Common"

    ; [ 11] Chandra Vineyards — Nutrient x100  TCV=500  126h
    MainScript.IME_JobPool_T1[11] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[11].resourceName  = "Nutrient"
    MainScript.IME_JobPool_T1[11].companyName   = "Chandra Vineyards"
    MainScript.IME_JobPool_T1[11].companyIndex  = 11
    MainScript.IME_JobPool_T1[11].quantity      = 100
    MainScript.IME_JobPool_T1[11].baseValue     = 5
    MainScript.IME_JobPool_T1[11].deadlineHours = 126
    MainScript.IME_JobPool_T1[11].rarity        = "Common"

    ; [ 12] Filburn Agriculture — Nutrient x100  TCV=500  126h
    MainScript.IME_JobPool_T1[12] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[12].resourceName  = "Nutrient"
    MainScript.IME_JobPool_T1[12].companyName   = "Filburn Agriculture"
    MainScript.IME_JobPool_T1[12].companyIndex  = 20
    MainScript.IME_JobPool_T1[12].quantity      = 100
    MainScript.IME_JobPool_T1[12].baseValue     = 5
    MainScript.IME_JobPool_T1[12].deadlineHours = 126
    MainScript.IME_JobPool_T1[12].rarity        = "Common"

    ; [ 13] Aboron — Polymer x25  TCV=500  294h
    MainScript.IME_JobPool_T1[13] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[13].resourceName  = "Polymer"
    MainScript.IME_JobPool_T1[13].companyName   = "Aboron"
    MainScript.IME_JobPool_T1[13].companyIndex  = 0
    MainScript.IME_JobPool_T1[13].quantity      = 25
    MainScript.IME_JobPool_T1[13].baseValue     = 20
    MainScript.IME_JobPool_T1[13].deadlineHours = 294
    MainScript.IME_JobPool_T1[13].rarity        = "Exotic"

    ; [ 14] Celtcorp — Polymer x25  TCV=500  294h
    MainScript.IME_JobPool_T1[14] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[14].resourceName  = "Polymer"
    MainScript.IME_JobPool_T1[14].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[14].companyIndex  = 9
    MainScript.IME_JobPool_T1[14].quantity      = 25
    MainScript.IME_JobPool_T1[14].baseValue     = 20
    MainScript.IME_JobPool_T1[14].deadlineHours = 294
    MainScript.IME_JobPool_T1[14].rarity        = "Exotic"

    ; [ 15] Celtcorp — Ionic Liquids x25  TCV=575  294h
    MainScript.IME_JobPool_T1[15] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[15].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T1[15].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[15].companyIndex  = 9
    MainScript.IME_JobPool_T1[15].quantity      = 25
    MainScript.IME_JobPool_T1[15].baseValue     = 23
    MainScript.IME_JobPool_T1[15].deadlineHours = 294
    MainScript.IME_JobPool_T1[15].rarity        = "Exotic"

    ; [ 16] Lunar Robotics — Ionic Liquids x25  TCV=575  294h
    MainScript.IME_JobPool_T1[16] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[16].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T1[16].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[16].companyIndex  = 29
    MainScript.IME_JobPool_T1[16].quantity      = 25
    MainScript.IME_JobPool_T1[16].baseValue     = 23
    MainScript.IME_JobPool_T1[16].deadlineHours = 294
    MainScript.IME_JobPool_T1[16].rarity        = "Exotic"

    ; [ 17] Reliant Medical — Ionic Liquids x25  TCV=575  294h
    MainScript.IME_JobPool_T1[17] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[17].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T1[17].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T1[17].companyIndex  = 36
    MainScript.IME_JobPool_T1[17].quantity      = 25
    MainScript.IME_JobPool_T1[17].baseValue     = 23
    MainScript.IME_JobPool_T1[17].deadlineHours = 294
    MainScript.IME_JobPool_T1[17].rarity        = "Exotic"

    ; [ 18] Son — Ionic Liquids x25  TCV=575  294h
    MainScript.IME_JobPool_T1[18] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[18].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T1[18].companyName   = "Son"
    MainScript.IME_JobPool_T1[18].companyIndex  = 42
    MainScript.IME_JobPool_T1[18].quantity      = 25
    MainScript.IME_JobPool_T1[18].baseValue     = 23
    MainScript.IME_JobPool_T1[18].deadlineHours = 294
    MainScript.IME_JobPool_T1[18].rarity        = "Exotic"

    ; [ 19] Muybridge Pharmaceuticals — Analgesic x50  TCV=600  210h
    MainScript.IME_JobPool_T1[19] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[19].resourceName  = "Analgesic"
    MainScript.IME_JobPool_T1[19].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T1[19].companyIndex  = 30
    MainScript.IME_JobPool_T1[19].quantity      = 50
    MainScript.IME_JobPool_T1[19].baseValue     = 12
    MainScript.IME_JobPool_T1[19].deadlineHours = 210
    MainScript.IME_JobPool_T1[19].rarity        = "Rare"

    ; [ 20] Ryujin — Carboxylic Acids x50  TCV=600  210h
    MainScript.IME_JobPool_T1[20] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[20].resourceName  = "Carboxylic Acids"
    MainScript.IME_JobPool_T1[20].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[20].companyIndex  = 37
    MainScript.IME_JobPool_T1[20].quantity      = 50
    MainScript.IME_JobPool_T1[20].baseValue     = 12
    MainScript.IME_JobPool_T1[20].deadlineHours = 210
    MainScript.IME_JobPool_T1[20].rarity        = "Rare"

    ; [ 21] Celtcorp — Chlorine x100  TCV=600  126h
    MainScript.IME_JobPool_T1[21] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[21].resourceName  = "Chlorine"
    MainScript.IME_JobPool_T1[21].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[21].companyIndex  = 9
    MainScript.IME_JobPool_T1[21].quantity      = 100
    MainScript.IME_JobPool_T1[21].baseValue     = 6
    MainScript.IME_JobPool_T1[21].deadlineHours = 126
    MainScript.IME_JobPool_T1[21].rarity        = "Common"

    ; [ 22] Lunar Robotics — Chlorine x100  TCV=600  126h
    MainScript.IME_JobPool_T1[22] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[22].resourceName  = "Chlorine"
    MainScript.IME_JobPool_T1[22].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[22].companyIndex  = 29
    MainScript.IME_JobPool_T1[22].quantity      = 100
    MainScript.IME_JobPool_T1[22].baseValue     = 6
    MainScript.IME_JobPool_T1[22].deadlineHours = 126
    MainScript.IME_JobPool_T1[22].rarity        = "Common"

    ; [ 23] Son — Chlorine x100  TCV=600  126h
    MainScript.IME_JobPool_T1[23] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[23].resourceName  = "Chlorine"
    MainScript.IME_JobPool_T1[23].companyName   = "Son"
    MainScript.IME_JobPool_T1[23].companyIndex  = 42
    MainScript.IME_JobPool_T1[23].quantity      = 100
    MainScript.IME_JobPool_T1[23].baseValue     = 6
    MainScript.IME_JobPool_T1[23].deadlineHours = 126
    MainScript.IME_JobPool_T1[23].rarity        = "Common"

    ; [ 24] Eit Clothiers — Cosmetic x75  TCV=600  168h
    MainScript.IME_JobPool_T1[24] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[24].resourceName  = "Cosmetic"
    MainScript.IME_JobPool_T1[24].companyName   = "Eit Clothiers"
    MainScript.IME_JobPool_T1[24].companyIndex  = 18
    MainScript.IME_JobPool_T1[24].quantity      = 75
    MainScript.IME_JobPool_T1[24].baseValue     = 8
    MainScript.IME_JobPool_T1[24].deadlineHours = 168
    MainScript.IME_JobPool_T1[24].rarity        = "Uncommon"

    ; [ 25] Allied Armaments — Sealant x100  TCV=600  126h
    MainScript.IME_JobPool_T1[25] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[25].resourceName  = "Sealant"
    MainScript.IME_JobPool_T1[25].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T1[25].companyIndex  = 2
    MainScript.IME_JobPool_T1[25].quantity      = 100
    MainScript.IME_JobPool_T1[25].baseValue     = 6
    MainScript.IME_JobPool_T1[25].deadlineHours = 126
    MainScript.IME_JobPool_T1[25].rarity        = "Common"

    ; [ 26] Armco — Sealant x100  TCV=600  126h
    MainScript.IME_JobPool_T1[26] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[26].resourceName  = "Sealant"
    MainScript.IME_JobPool_T1[26].companyName   = "Armco"
    MainScript.IME_JobPool_T1[26].companyIndex  = 6
    MainScript.IME_JobPool_T1[26].quantity      = 100
    MainScript.IME_JobPool_T1[26].baseValue     = 6
    MainScript.IME_JobPool_T1[26].deadlineHours = 126
    MainScript.IME_JobPool_T1[26].rarity        = "Common"

    ; [ 27] Combatech — Sealant x100  TCV=600  126h
    MainScript.IME_JobPool_T1[27] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[27].resourceName  = "Sealant"
    MainScript.IME_JobPool_T1[27].companyName   = "Combatech"
    MainScript.IME_JobPool_T1[27].companyIndex  = 13
    MainScript.IME_JobPool_T1[27].quantity      = 100
    MainScript.IME_JobPool_T1[27].baseValue     = 6
    MainScript.IME_JobPool_T1[27].deadlineHours = 126
    MainScript.IME_JobPool_T1[27].rarity        = "Common"

    ; [ 28] Combatech — Titanium x50  TCV=600  210h
    MainScript.IME_JobPool_T1[28] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[28].resourceName  = "Titanium"
    MainScript.IME_JobPool_T1[28].companyName   = "Combatech"
    MainScript.IME_JobPool_T1[28].companyIndex  = 13
    MainScript.IME_JobPool_T1[28].quantity      = 50
    MainScript.IME_JobPool_T1[28].baseValue     = 12
    MainScript.IME_JobPool_T1[28].deadlineHours = 210
    MainScript.IME_JobPool_T1[28].rarity        = "Rare"

    ; [ 29] Argos Extractors — Caesium x25  TCV=625  294h
    MainScript.IME_JobPool_T1[29] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[29].resourceName  = "Caesium"
    MainScript.IME_JobPool_T1[29].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T1[29].companyIndex  = 5
    MainScript.IME_JobPool_T1[29].quantity      = 25
    MainScript.IME_JobPool_T1[29].baseValue     = 25
    MainScript.IME_JobPool_T1[29].deadlineHours = 294
    MainScript.IME_JobPool_T1[29].rarity        = "Exotic"

    ; [ 30] Lunar Robotics — Memory Substrate x10  TCV=650  420h
    MainScript.IME_JobPool_T1[30] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[30].resourceName  = "Memory Substrate"
    MainScript.IME_JobPool_T1[30].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[30].companyIndex  = 29
    MainScript.IME_JobPool_T1[30].quantity      = 10
    MainScript.IME_JobPool_T1[30].baseValue     = 65
    MainScript.IME_JobPool_T1[30].deadlineHours = 420
    MainScript.IME_JobPool_T1[30].rarity        = "Unique"

    ; [ 31] Advanced Nutrition — Gastronomic Delight x10  TCV=660  420h
    MainScript.IME_JobPool_T1[31] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[31].resourceName  = "Gastronomic Delight"
    MainScript.IME_JobPool_T1[31].companyName   = "Advanced Nutrition"
    MainScript.IME_JobPool_T1[31].companyIndex  = 1
    MainScript.IME_JobPool_T1[31].quantity      = 10
    MainScript.IME_JobPool_T1[31].baseValue     = 66
    MainScript.IME_JobPool_T1[31].deadlineHours = 420
    MainScript.IME_JobPool_T1[31].rarity        = "Unique"

    ; [ 32] Centauri Mills — Membrane x75  TCV=675  168h
    MainScript.IME_JobPool_T1[32] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[32].resourceName  = "Membrane"
    MainScript.IME_JobPool_T1[32].companyName   = "Centauri Mills"
    MainScript.IME_JobPool_T1[32].companyIndex  = 10
    MainScript.IME_JobPool_T1[32].quantity      = 75
    MainScript.IME_JobPool_T1[32].baseValue     = 9
    MainScript.IME_JobPool_T1[32].deadlineHours = 168
    MainScript.IME_JobPool_T1[32].rarity        = "Uncommon"

    ; [ 33] Chandra Vineyards — Membrane x75  TCV=675  168h
    MainScript.IME_JobPool_T1[33] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[33].resourceName  = "Membrane"
    MainScript.IME_JobPool_T1[33].companyName   = "Chandra Vineyards"
    MainScript.IME_JobPool_T1[33].companyIndex  = 11
    MainScript.IME_JobPool_T1[33].quantity      = 75
    MainScript.IME_JobPool_T1[33].baseValue     = 9
    MainScript.IME_JobPool_T1[33].deadlineHours = 168
    MainScript.IME_JobPool_T1[33].rarity        = "Uncommon"

    ; [ 34] Xenofresh Fisheries — Membrane x75  TCV=675  168h
    MainScript.IME_JobPool_T1[34] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[34].resourceName  = "Membrane"
    MainScript.IME_JobPool_T1[34].companyName   = "Xenofresh Fisheries"
    MainScript.IME_JobPool_T1[34].companyIndex  = 47
    MainScript.IME_JobPool_T1[34].quantity      = 75
    MainScript.IME_JobPool_T1[34].baseValue     = 9
    MainScript.IME_JobPool_T1[34].deadlineHours = 168
    MainScript.IME_JobPool_T1[34].rarity        = "Uncommon"

    ; [ 35] Celtcorp — Xenon x25  TCV=675  294h
    MainScript.IME_JobPool_T1[35] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[35].resourceName  = "Xenon"
    MainScript.IME_JobPool_T1[35].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[35].companyIndex  = 9
    MainScript.IME_JobPool_T1[35].quantity      = 25
    MainScript.IME_JobPool_T1[35].baseValue     = 27
    MainScript.IME_JobPool_T1[35].deadlineHours = 294
    MainScript.IME_JobPool_T1[35].rarity        = "Exotic"

    ; [ 36] Celtcorp — Aluminum x100  TCV=700  126h
    MainScript.IME_JobPool_T1[36] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[36].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T1[36].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[36].companyIndex  = 9
    MainScript.IME_JobPool_T1[36].quantity      = 100
    MainScript.IME_JobPool_T1[36].baseValue     = 7
    MainScript.IME_JobPool_T1[36].deadlineHours = 126
    MainScript.IME_JobPool_T1[36].rarity        = "Common"

    ; [ 37] Laredo — Aluminum x100  TCV=700  126h
    MainScript.IME_JobPool_T1[37] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[37].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T1[37].companyName   = "Laredo"
    MainScript.IME_JobPool_T1[37].companyIndex  = 27
    MainScript.IME_JobPool_T1[37].quantity      = 100
    MainScript.IME_JobPool_T1[37].baseValue     = 7
    MainScript.IME_JobPool_T1[37].deadlineHours = 126
    MainScript.IME_JobPool_T1[37].rarity        = "Common"

    ; [ 38] Muybridge Pharmaceuticals — Lithium x50  TCV=700  210h
    MainScript.IME_JobPool_T1[38] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[38].resourceName  = "Lithium"
    MainScript.IME_JobPool_T1[38].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T1[38].companyIndex  = 30
    MainScript.IME_JobPool_T1[38].quantity      = 50
    MainScript.IME_JobPool_T1[38].baseValue     = 14
    MainScript.IME_JobPool_T1[38].deadlineHours = 210
    MainScript.IME_JobPool_T1[38].rarity        = "Rare"

    ; [ 39] Reliant Medical — Lithium x50  TCV=700  210h
    MainScript.IME_JobPool_T1[39] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[39].resourceName  = "Lithium"
    MainScript.IME_JobPool_T1[39].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T1[39].companyIndex  = 36
    MainScript.IME_JobPool_T1[39].quantity      = 50
    MainScript.IME_JobPool_T1[39].baseValue     = 14
    MainScript.IME_JobPool_T1[39].deadlineHours = 210
    MainScript.IME_JobPool_T1[39].rarity        = "Rare"

    ; [ 40] Axion Energy — Structural Material x100  TCV=700  126h
    MainScript.IME_JobPool_T1[40] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[40].resourceName  = "Structural Material"
    MainScript.IME_JobPool_T1[40].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T1[40].companyIndex  = 7
    MainScript.IME_JobPool_T1[40].quantity      = 100
    MainScript.IME_JobPool_T1[40].baseValue     = 7
    MainScript.IME_JobPool_T1[40].deadlineHours = 126
    MainScript.IME_JobPool_T1[40].rarity        = "Common"

    ; [ 41] Celtcorp — Antimicrobial x75  TCV=750  168h
    MainScript.IME_JobPool_T1[41] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[41].resourceName  = "Antimicrobial"
    MainScript.IME_JobPool_T1[41].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[41].companyIndex  = 9
    MainScript.IME_JobPool_T1[41].quantity      = 75
    MainScript.IME_JobPool_T1[41].baseValue     = 10
    MainScript.IME_JobPool_T1[41].deadlineHours = 168
    MainScript.IME_JobPool_T1[41].rarity        = "Uncommon"

    ; [ 42] Lunar Robotics — Antimicrobial x75  TCV=750  168h
    MainScript.IME_JobPool_T1[42] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[42].resourceName  = "Antimicrobial"
    MainScript.IME_JobPool_T1[42].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[42].companyIndex  = 29
    MainScript.IME_JobPool_T1[42].quantity      = 75
    MainScript.IME_JobPool_T1[42].baseValue     = 10
    MainScript.IME_JobPool_T1[42].deadlineHours = 168
    MainScript.IME_JobPool_T1[42].rarity        = "Uncommon"

    ; [ 43] Ryujin — Pigment x75  TCV=750  168h
    MainScript.IME_JobPool_T1[43] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[43].resourceName  = "Pigment"
    MainScript.IME_JobPool_T1[43].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[43].companyIndex  = 37
    MainScript.IME_JobPool_T1[43].quantity      = 75
    MainScript.IME_JobPool_T1[43].baseValue     = 10
    MainScript.IME_JobPool_T1[43].deadlineHours = 168
    MainScript.IME_JobPool_T1[43].rarity        = "Uncommon"

    ; [ 44] Kore Kinetics — Iron x100  TCV=800  126h
    MainScript.IME_JobPool_T1[44] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[44].resourceName  = "Iron"
    MainScript.IME_JobPool_T1[44].companyName   = "Kore Kinetics"
    MainScript.IME_JobPool_T1[44].companyIndex  = 26
    MainScript.IME_JobPool_T1[44].quantity      = 100
    MainScript.IME_JobPool_T1[44].baseValue     = 8
    MainScript.IME_JobPool_T1[44].deadlineHours = 126
    MainScript.IME_JobPool_T1[44].rarity        = "Common"

    ; [ 45] Laredo — Iron x100  TCV=800  126h
    MainScript.IME_JobPool_T1[45] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[45].resourceName  = "Iron"
    MainScript.IME_JobPool_T1[45].companyName   = "Laredo"
    MainScript.IME_JobPool_T1[45].companyIndex  = 27
    MainScript.IME_JobPool_T1[45].quantity      = 100
    MainScript.IME_JobPool_T1[45].baseValue     = 8
    MainScript.IME_JobPool_T1[45].deadlineHours = 126
    MainScript.IME_JobPool_T1[45].rarity        = "Common"

    ; [ 46] Xenofresh Fisheries — Toxin x100  TCV=800  126h
    MainScript.IME_JobPool_T1[46] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[46].resourceName  = "Toxin"
    MainScript.IME_JobPool_T1[46].companyName   = "Xenofresh Fisheries"
    MainScript.IME_JobPool_T1[46].companyIndex  = 47
    MainScript.IME_JobPool_T1[46].quantity      = 100
    MainScript.IME_JobPool_T1[46].baseValue     = 8
    MainScript.IME_JobPool_T1[46].deadlineHours = 126
    MainScript.IME_JobPool_T1[46].rarity        = "Common"

    ; [ 47] Ryujin — Ornamental Material x75  TCV=825  168h
    MainScript.IME_JobPool_T1[47] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[47].resourceName  = "Ornamental Material"
    MainScript.IME_JobPool_T1[47].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[47].companyIndex  = 37
    MainScript.IME_JobPool_T1[47].quantity      = 75
    MainScript.IME_JobPool_T1[47].baseValue     = 11
    MainScript.IME_JobPool_T1[47].deadlineHours = 168
    MainScript.IME_JobPool_T1[47].rarity        = "Uncommon"

    ; [ 48] Centauri Mills — Spice x75  TCV=825  168h
    MainScript.IME_JobPool_T1[48] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[48].resourceName  = "Spice"
    MainScript.IME_JobPool_T1[48].companyName   = "Centauri Mills"
    MainScript.IME_JobPool_T1[48].companyIndex  = 10
    MainScript.IME_JobPool_T1[48].quantity      = 75
    MainScript.IME_JobPool_T1[48].baseValue     = 11
    MainScript.IME_JobPool_T1[48].deadlineHours = 168
    MainScript.IME_JobPool_T1[48].rarity        = "Uncommon"

    ; [ 49] Chandra Vineyards — Spice x75  TCV=825  168h
    MainScript.IME_JobPool_T1[49] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[49].resourceName  = "Spice"
    MainScript.IME_JobPool_T1[49].companyName   = "Chandra Vineyards"
    MainScript.IME_JobPool_T1[49].companyIndex  = 11
    MainScript.IME_JobPool_T1[49].quantity      = 75
    MainScript.IME_JobPool_T1[49].baseValue     = 11
    MainScript.IME_JobPool_T1[49].deadlineHours = 168
    MainScript.IME_JobPool_T1[49].rarity        = "Uncommon"

    ; [ 50] Xenofresh Fisheries — Spice x75  TCV=825  168h
    MainScript.IME_JobPool_T1[50] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[50].resourceName  = "Spice"
    MainScript.IME_JobPool_T1[50].companyName   = "Xenofresh Fisheries"
    MainScript.IME_JobPool_T1[50].companyIndex  = 47
    MainScript.IME_JobPool_T1[50].quantity      = 75
    MainScript.IME_JobPool_T1[50].baseValue     = 11
    MainScript.IME_JobPool_T1[50].deadlineHours = 168
    MainScript.IME_JobPool_T1[50].rarity        = "Uncommon"

    ; [ 51] Consolidated Mining — Aldumite x10  TCV=840  420h
    MainScript.IME_JobPool_T1[51] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[51].resourceName  = "Aldumite"
    MainScript.IME_JobPool_T1[51].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T1[51].companyIndex  = 14
    MainScript.IME_JobPool_T1[51].quantity      = 10
    MainScript.IME_JobPool_T1[51].baseValue     = 84
    MainScript.IME_JobPool_T1[51].deadlineHours = 420
    MainScript.IME_JobPool_T1[51].rarity        = "Unique"

    ; [ 52] Celtcorp — Beryllium x75  TCV=900  168h
    MainScript.IME_JobPool_T1[52] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[52].resourceName  = "Beryllium"
    MainScript.IME_JobPool_T1[52].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[52].companyIndex  = 9
    MainScript.IME_JobPool_T1[52].quantity      = 75
    MainScript.IME_JobPool_T1[52].baseValue     = 12
    MainScript.IME_JobPool_T1[52].deadlineHours = 168
    MainScript.IME_JobPool_T1[52].rarity        = "Uncommon"

    ; [ 53] Lunar Robotics — Beryllium x75  TCV=900  168h
    MainScript.IME_JobPool_T1[53] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[53].resourceName  = "Beryllium"
    MainScript.IME_JobPool_T1[53].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[53].companyIndex  = 29
    MainScript.IME_JobPool_T1[53].quantity      = 75
    MainScript.IME_JobPool_T1[53].baseValue     = 12
    MainScript.IME_JobPool_T1[53].deadlineHours = 168
    MainScript.IME_JobPool_T1[53].rarity        = "Uncommon"

    ; [ 54] Son — Beryllium x75  TCV=900  168h
    MainScript.IME_JobPool_T1[54] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[54].resourceName  = "Beryllium"
    MainScript.IME_JobPool_T1[54].companyName   = "Son"
    MainScript.IME_JobPool_T1[54].companyIndex  = 42
    MainScript.IME_JobPool_T1[54].quantity      = 75
    MainScript.IME_JobPool_T1[54].baseValue     = 12
    MainScript.IME_JobPool_T1[54].deadlineHours = 168
    MainScript.IME_JobPool_T1[54].rarity        = "Uncommon"

    ; [ 55] Allied Armaments — Cobalt x75  TCV=900  168h
    MainScript.IME_JobPool_T1[55] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[55].resourceName  = "Cobalt"
    MainScript.IME_JobPool_T1[55].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T1[55].companyIndex  = 2
    MainScript.IME_JobPool_T1[55].quantity      = 75
    MainScript.IME_JobPool_T1[55].baseValue     = 12
    MainScript.IME_JobPool_T1[55].deadlineHours = 168
    MainScript.IME_JobPool_T1[55].rarity        = "Uncommon"

    ; [ 56] Combatech — Cobalt x75  TCV=900  168h
    MainScript.IME_JobPool_T1[56] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[56].resourceName  = "Cobalt"
    MainScript.IME_JobPool_T1[56].companyName   = "Combatech"
    MainScript.IME_JobPool_T1[56].companyIndex  = 13
    MainScript.IME_JobPool_T1[56].quantity      = 75
    MainScript.IME_JobPool_T1[56].baseValue     = 12
    MainScript.IME_JobPool_T1[56].deadlineHours = 168
    MainScript.IME_JobPool_T1[56].rarity        = "Uncommon"

    ; [ 57] Armco — Fluorine x75  TCV=900  168h
    MainScript.IME_JobPool_T1[57] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[57].resourceName  = "Fluorine"
    MainScript.IME_JobPool_T1[57].companyName   = "Armco"
    MainScript.IME_JobPool_T1[57].companyIndex  = 6
    MainScript.IME_JobPool_T1[57].quantity      = 75
    MainScript.IME_JobPool_T1[57].baseValue     = 12
    MainScript.IME_JobPool_T1[57].deadlineHours = 168
    MainScript.IME_JobPool_T1[57].rarity        = "Uncommon"

    ; [ 58] Axion Energy — Fluorine x75  TCV=900  168h
    MainScript.IME_JobPool_T1[58] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[58].resourceName  = "Fluorine"
    MainScript.IME_JobPool_T1[58].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T1[58].companyIndex  = 7
    MainScript.IME_JobPool_T1[58].quantity      = 75
    MainScript.IME_JobPool_T1[58].baseValue     = 12
    MainScript.IME_JobPool_T1[58].deadlineHours = 168
    MainScript.IME_JobPool_T1[58].rarity        = "Uncommon"

    ; [ 59] Centauri Mills — Alkanes x75  TCV=975  168h
    MainScript.IME_JobPool_T1[59] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[59].resourceName  = "Alkanes"
    MainScript.IME_JobPool_T1[59].companyName   = "Centauri Mills"
    MainScript.IME_JobPool_T1[59].companyIndex  = 10
    MainScript.IME_JobPool_T1[59].quantity      = 75
    MainScript.IME_JobPool_T1[59].baseValue     = 13
    MainScript.IME_JobPool_T1[59].deadlineHours = 168
    MainScript.IME_JobPool_T1[59].rarity        = "Uncommon"

    ; [ 60] Chandra Vineyards — Alkanes x75  TCV=975  168h
    MainScript.IME_JobPool_T1[60] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[60].resourceName  = "Alkanes"
    MainScript.IME_JobPool_T1[60].companyName   = "Chandra Vineyards"
    MainScript.IME_JobPool_T1[60].companyIndex  = 11
    MainScript.IME_JobPool_T1[60].quantity      = 75
    MainScript.IME_JobPool_T1[60].baseValue     = 13
    MainScript.IME_JobPool_T1[60].deadlineHours = 168
    MainScript.IME_JobPool_T1[60].rarity        = "Uncommon"

    ; [ 61] Filburn Agriculture — Alkanes x75  TCV=975  168h
    MainScript.IME_JobPool_T1[61] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[61].resourceName  = "Alkanes"
    MainScript.IME_JobPool_T1[61].companyName   = "Filburn Agriculture"
    MainScript.IME_JobPool_T1[61].companyIndex  = 20
    MainScript.IME_JobPool_T1[61].quantity      = 75
    MainScript.IME_JobPool_T1[61].baseValue     = 13
    MainScript.IME_JobPool_T1[61].deadlineHours = 168
    MainScript.IME_JobPool_T1[61].rarity        = "Uncommon"

    ; [ 62] Armco — Copper x100  TCV=1,000  126h
    MainScript.IME_JobPool_T1[62] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[62].resourceName  = "Copper"
    MainScript.IME_JobPool_T1[62].companyName   = "Armco"
    MainScript.IME_JobPool_T1[62].companyIndex  = 6
    MainScript.IME_JobPool_T1[62].quantity      = 100
    MainScript.IME_JobPool_T1[62].baseValue     = 10
    MainScript.IME_JobPool_T1[62].deadlineHours = 126
    MainScript.IME_JobPool_T1[62].rarity        = "Common"

    ; [ 63] Laredo — Copper x100  TCV=1,000  126h
    MainScript.IME_JobPool_T1[63] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[63].resourceName  = "Copper"
    MainScript.IME_JobPool_T1[63].companyName   = "Laredo"
    MainScript.IME_JobPool_T1[63].companyIndex  = 27
    MainScript.IME_JobPool_T1[63].quantity      = 100
    MainScript.IME_JobPool_T1[63].baseValue     = 10
    MainScript.IME_JobPool_T1[63].deadlineHours = 126
    MainScript.IME_JobPool_T1[63].rarity        = "Common"

    ; [ 64] Laredo — Lead x100  TCV=1,000  126h
    MainScript.IME_JobPool_T1[64] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[64].resourceName  = "Lead"
    MainScript.IME_JobPool_T1[64].companyName   = "Laredo"
    MainScript.IME_JobPool_T1[64].companyIndex  = 27
    MainScript.IME_JobPool_T1[64].quantity      = 100
    MainScript.IME_JobPool_T1[64].baseValue     = 10
    MainScript.IME_JobPool_T1[64].deadlineHours = 126
    MainScript.IME_JobPool_T1[64].rarity        = "Common"

    ; [ 65] Celtcorp — Neodymium x50  TCV=1,000  210h
    MainScript.IME_JobPool_T1[65] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[65].resourceName  = "Neodymium"
    MainScript.IME_JobPool_T1[65].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[65].companyIndex  = 9
    MainScript.IME_JobPool_T1[65].quantity      = 50
    MainScript.IME_JobPool_T1[65].baseValue     = 20
    MainScript.IME_JobPool_T1[65].deadlineHours = 210
    MainScript.IME_JobPool_T1[65].rarity        = "Rare"

    ; [ 66] Allied Armaments — Nickel x100  TCV=1,000  126h
    MainScript.IME_JobPool_T1[66] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[66].resourceName  = "Nickel"
    MainScript.IME_JobPool_T1[66].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T1[66].companyIndex  = 2
    MainScript.IME_JobPool_T1[66].quantity      = 100
    MainScript.IME_JobPool_T1[66].baseValue     = 10
    MainScript.IME_JobPool_T1[66].deadlineHours = 126
    MainScript.IME_JobPool_T1[66].rarity        = "Common"

    ; [ 67] Lunar Robotics — Chlorosilanes x75  TCV=1,050  168h
    MainScript.IME_JobPool_T1[67] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[67].resourceName  = "Chlorosilanes"
    MainScript.IME_JobPool_T1[67].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[67].companyIndex  = 29
    MainScript.IME_JobPool_T1[67].quantity      = 75
    MainScript.IME_JobPool_T1[67].baseValue     = 14
    MainScript.IME_JobPool_T1[67].deadlineHours = 168
    MainScript.IME_JobPool_T1[67].rarity        = "Uncommon"

    ; [ 68] Aboron — Iridium x75  TCV=1,050  168h
    MainScript.IME_JobPool_T1[68] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[68].resourceName  = "Iridium"
    MainScript.IME_JobPool_T1[68].companyName   = "Aboron"
    MainScript.IME_JobPool_T1[68].companyIndex  = 0
    MainScript.IME_JobPool_T1[68].quantity      = 75
    MainScript.IME_JobPool_T1[68].baseValue     = 14
    MainScript.IME_JobPool_T1[68].deadlineHours = 168
    MainScript.IME_JobPool_T1[68].rarity        = "Uncommon"

    ; [ 69] Allied Armaments — Iridium x75  TCV=1,050  168h
    MainScript.IME_JobPool_T1[69] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[69].resourceName  = "Iridium"
    MainScript.IME_JobPool_T1[69].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T1[69].companyIndex  = 2
    MainScript.IME_JobPool_T1[69].quantity      = 75
    MainScript.IME_JobPool_T1[69].baseValue     = 14
    MainScript.IME_JobPool_T1[69].deadlineHours = 168
    MainScript.IME_JobPool_T1[69].rarity        = "Uncommon"

    ; [ 70] Combatech — Iridium x75  TCV=1,050  168h
    MainScript.IME_JobPool_T1[70] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[70].resourceName  = "Iridium"
    MainScript.IME_JobPool_T1[70].companyName   = "Combatech"
    MainScript.IME_JobPool_T1[70].companyIndex  = 13
    MainScript.IME_JobPool_T1[70].quantity      = 75
    MainScript.IME_JobPool_T1[70].baseValue     = 14
    MainScript.IME_JobPool_T1[70].deadlineHours = 168
    MainScript.IME_JobPool_T1[70].rarity        = "Uncommon"

    ; [ 71] Muybridge Pharmaceuticals — Mercury x50  TCV=1,100  210h
    MainScript.IME_JobPool_T1[71] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[71].resourceName  = "Mercury"
    MainScript.IME_JobPool_T1[71].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T1[71].companyIndex  = 30
    MainScript.IME_JobPool_T1[71].quantity      = 50
    MainScript.IME_JobPool_T1[71].baseValue     = 22
    MainScript.IME_JobPool_T1[71].deadlineHours = 210
    MainScript.IME_JobPool_T1[71].rarity        = "Rare"

    ; [ 72] Consolidated Mining — Tantalum x50  TCV=1,150  210h
    MainScript.IME_JobPool_T1[72] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[72].resourceName  = "Tantalum"
    MainScript.IME_JobPool_T1[72].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T1[72].companyIndex  = 14
    MainScript.IME_JobPool_T1[72].quantity      = 50
    MainScript.IME_JobPool_T1[72].baseValue     = 23
    MainScript.IME_JobPool_T1[72].deadlineHours = 210
    MainScript.IME_JobPool_T1[72].rarity        = "Rare"

    ; [ 73] Six Sisters — Tantalum x50  TCV=1,150  210h
    MainScript.IME_JobPool_T1[73] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[73].resourceName  = "Tantalum"
    MainScript.IME_JobPool_T1[73].companyName   = "Six Sisters"
    MainScript.IME_JobPool_T1[73].companyIndex  = 40
    MainScript.IME_JobPool_T1[73].quantity      = 50
    MainScript.IME_JobPool_T1[73].baseValue     = 23
    MainScript.IME_JobPool_T1[73].deadlineHours = 210
    MainScript.IME_JobPool_T1[73].rarity        = "Rare"

    ; [ 74] Arc Might — Gold x50  TCV=1,200  210h
    MainScript.IME_JobPool_T1[74] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[74].resourceName  = "Gold"
    MainScript.IME_JobPool_T1[74].companyName   = "Arc Might"
    MainScript.IME_JobPool_T1[74].companyIndex  = 4
    MainScript.IME_JobPool_T1[74].quantity      = 50
    MainScript.IME_JobPool_T1[74].baseValue     = 24
    MainScript.IME_JobPool_T1[74].deadlineHours = 210
    MainScript.IME_JobPool_T1[74].rarity        = "Rare"

    ; [ 75] Celtcorp — Gold x50  TCV=1,200  210h
    MainScript.IME_JobPool_T1[75] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[75].resourceName  = "Gold"
    MainScript.IME_JobPool_T1[75].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[75].companyIndex  = 9
    MainScript.IME_JobPool_T1[75].quantity      = 50
    MainScript.IME_JobPool_T1[75].baseValue     = 24
    MainScript.IME_JobPool_T1[75].deadlineHours = 210
    MainScript.IME_JobPool_T1[75].rarity        = "Rare"

    ; [ 76] Celtcorp — Platinum x50  TCV=1,200  210h
    MainScript.IME_JobPool_T1[76] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[76].resourceName  = "Platinum"
    MainScript.IME_JobPool_T1[76].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[76].companyIndex  = 9
    MainScript.IME_JobPool_T1[76].quantity      = 50
    MainScript.IME_JobPool_T1[76].baseValue     = 24
    MainScript.IME_JobPool_T1[76].deadlineHours = 210
    MainScript.IME_JobPool_T1[76].rarity        = "Rare"

    ; [ 77] Lunar Robotics — Platinum x50  TCV=1,200  210h
    MainScript.IME_JobPool_T1[77] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[77].resourceName  = "Platinum"
    MainScript.IME_JobPool_T1[77].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[77].companyIndex  = 29
    MainScript.IME_JobPool_T1[77].quantity      = 50
    MainScript.IME_JobPool_T1[77].baseValue     = 24
    MainScript.IME_JobPool_T1[77].deadlineHours = 210
    MainScript.IME_JobPool_T1[77].rarity        = "Rare"

    ; [ 78] Armco — Tungsten x75  TCV=1,200  168h
    MainScript.IME_JobPool_T1[78] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[78].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T1[78].companyName   = "Armco"
    MainScript.IME_JobPool_T1[78].companyIndex  = 6
    MainScript.IME_JobPool_T1[78].quantity      = 75
    MainScript.IME_JobPool_T1[78].baseValue     = 16
    MainScript.IME_JobPool_T1[78].deadlineHours = 168
    MainScript.IME_JobPool_T1[78].rarity        = "Uncommon"

    ; [ 79] Six Sisters — Tungsten x75  TCV=1,200  168h
    MainScript.IME_JobPool_T1[79] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[79].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T1[79].companyName   = "Six Sisters"
    MainScript.IME_JobPool_T1[79].companyIndex  = 40
    MainScript.IME_JobPool_T1[79].quantity      = 75
    MainScript.IME_JobPool_T1[79].baseValue     = 16
    MainScript.IME_JobPool_T1[79].deadlineHours = 168
    MainScript.IME_JobPool_T1[79].rarity        = "Uncommon"

    ; [ 80] Allied Armaments — Vanadium x50  TCV=1,200  210h
    MainScript.IME_JobPool_T1[80] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[80].resourceName  = "Vanadium"
    MainScript.IME_JobPool_T1[80].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T1[80].companyIndex  = 2
    MainScript.IME_JobPool_T1[80].quantity      = 50
    MainScript.IME_JobPool_T1[80].baseValue     = 24
    MainScript.IME_JobPool_T1[80].deadlineHours = 210
    MainScript.IME_JobPool_T1[80].rarity        = "Rare"

    ; [ 81] Combatech — Vanadium x50  TCV=1,200  210h
    MainScript.IME_JobPool_T1[81] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[81].resourceName  = "Vanadium"
    MainScript.IME_JobPool_T1[81].companyName   = "Combatech"
    MainScript.IME_JobPool_T1[81].companyIndex  = 13
    MainScript.IME_JobPool_T1[81].quantity      = 50
    MainScript.IME_JobPool_T1[81].baseValue     = 24
    MainScript.IME_JobPool_T1[81].deadlineHours = 210
    MainScript.IME_JobPool_T1[81].rarity        = "Rare"

    ; [ 82] Celtcorp — Dysprosium x25  TCV=1,400  294h
    MainScript.IME_JobPool_T1[82] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[82].resourceName  = "Dysprosium"
    MainScript.IME_JobPool_T1[82].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[82].companyIndex  = 9
    MainScript.IME_JobPool_T1[82].quantity      = 25
    MainScript.IME_JobPool_T1[82].baseValue     = 56
    MainScript.IME_JobPool_T1[82].deadlineHours = 294
    MainScript.IME_JobPool_T1[82].rarity        = "Exotic"

    ; [ 83] Ryujin — Dysprosium x25  TCV=1,400  294h
    MainScript.IME_JobPool_T1[83] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[83].resourceName  = "Dysprosium"
    MainScript.IME_JobPool_T1[83].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[83].companyIndex  = 37
    MainScript.IME_JobPool_T1[83].quantity      = 25
    MainScript.IME_JobPool_T1[83].baseValue     = 56
    MainScript.IME_JobPool_T1[83].deadlineHours = 294
    MainScript.IME_JobPool_T1[83].rarity        = "Exotic"

    ; [ 84] Ryujin — Benzene x75  TCV=1,425  168h
    MainScript.IME_JobPool_T1[84] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[84].resourceName  = "Benzene"
    MainScript.IME_JobPool_T1[84].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[84].companyIndex  = 37
    MainScript.IME_JobPool_T1[84].quantity      = 75
    MainScript.IME_JobPool_T1[84].baseValue     = 19
    MainScript.IME_JobPool_T1[84].deadlineHours = 168
    MainScript.IME_JobPool_T1[84].rarity        = "Uncommon"

    ; [ 85] Armco — Silver x75  TCV=1,500  168h
    MainScript.IME_JobPool_T1[85] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[85].resourceName  = "Silver"
    MainScript.IME_JobPool_T1[85].companyName   = "Armco"
    MainScript.IME_JobPool_T1[85].companyIndex  = 6
    MainScript.IME_JobPool_T1[85].quantity      = 75
    MainScript.IME_JobPool_T1[85].baseValue     = 20
    MainScript.IME_JobPool_T1[85].deadlineHours = 168
    MainScript.IME_JobPool_T1[85].rarity        = "Uncommon"

    ; [ 86] Infinity Ltd — Plutonium x25  TCV=1,600  294h
    MainScript.IME_JobPool_T1[86] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[86].resourceName  = "Plutonium"
    MainScript.IME_JobPool_T1[86].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T1[86].companyIndex  = 25
    MainScript.IME_JobPool_T1[86].quantity      = 25
    MainScript.IME_JobPool_T1[86].baseValue     = 64
    MainScript.IME_JobPool_T1[86].deadlineHours = 294
    MainScript.IME_JobPool_T1[86].rarity        = "Exotic"

    ; [ 87] Ryujin — Plutonium x25  TCV=1,600  294h
    MainScript.IME_JobPool_T1[87] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[87].resourceName  = "Plutonium"
    MainScript.IME_JobPool_T1[87].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[87].companyIndex  = 37
    MainScript.IME_JobPool_T1[87].quantity      = 25
    MainScript.IME_JobPool_T1[87].baseValue     = 64
    MainScript.IME_JobPool_T1[87].deadlineHours = 294
    MainScript.IME_JobPool_T1[87].rarity        = "Exotic"

    ; [ 88] Ballistics Solutions — Helium-3 x375  TCV=1,875  168h
    MainScript.IME_JobPool_T1[88] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[88].resourceName  = "Helium-3"
    MainScript.IME_JobPool_T1[88].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T1[88].companyIndex  = 8
    MainScript.IME_JobPool_T1[88].quantity      = 375
    MainScript.IME_JobPool_T1[88].baseValue     = 5
    MainScript.IME_JobPool_T1[88].deadlineHours = 168
    MainScript.IME_JobPool_T1[88].rarity        = "Uncommon"

    ; [ 89] Lunar Robotics — Mag Pressure Tank x75  TCV=1,875  168h
    MainScript.IME_JobPool_T1[89] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[89].resourceName  = "Mag Pressure Tank"
    MainScript.IME_JobPool_T1[89].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[89].companyIndex  = 29
    MainScript.IME_JobPool_T1[89].quantity      = 75
    MainScript.IME_JobPool_T1[89].baseValue     = 25
    MainScript.IME_JobPool_T1[89].deadlineHours = 168
    MainScript.IME_JobPool_T1[89].rarity        = "Uncommon"

    ; [ 90] Son — Mag Pressure Tank x75  TCV=1,875  168h
    MainScript.IME_JobPool_T1[90] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[90].resourceName  = "Mag Pressure Tank"
    MainScript.IME_JobPool_T1[90].companyName   = "Son"
    MainScript.IME_JobPool_T1[90].companyIndex  = 42
    MainScript.IME_JobPool_T1[90].quantity      = 75
    MainScript.IME_JobPool_T1[90].baseValue     = 25
    MainScript.IME_JobPool_T1[90].deadlineHours = 168
    MainScript.IME_JobPool_T1[90].rarity        = "Uncommon"

    ; [ 91] Xenofresh Fisheries — Mag Pressure Tank x75  TCV=1,875  168h
    MainScript.IME_JobPool_T1[91] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[91].resourceName  = "Mag Pressure Tank"
    MainScript.IME_JobPool_T1[91].companyName   = "Xenofresh Fisheries"
    MainScript.IME_JobPool_T1[91].companyIndex  = 47
    MainScript.IME_JobPool_T1[91].quantity      = 75
    MainScript.IME_JobPool_T1[91].baseValue     = 25
    MainScript.IME_JobPool_T1[91].deadlineHours = 168
    MainScript.IME_JobPool_T1[91].rarity        = "Uncommon"

    ; [ 92] Armco — Polytextile x75  TCV=1,875  168h
    MainScript.IME_JobPool_T1[92] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[92].resourceName  = "Polytextile"
    MainScript.IME_JobPool_T1[92].companyName   = "Armco"
    MainScript.IME_JobPool_T1[92].companyIndex  = 6
    MainScript.IME_JobPool_T1[92].quantity      = 75
    MainScript.IME_JobPool_T1[92].baseValue     = 25
    MainScript.IME_JobPool_T1[92].deadlineHours = 168
    MainScript.IME_JobPool_T1[92].rarity        = "Uncommon"

    ; [ 93] Celtcorp — Polytextile x75  TCV=1,875  168h
    MainScript.IME_JobPool_T1[93] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[93].resourceName  = "Polytextile"
    MainScript.IME_JobPool_T1[93].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[93].companyIndex  = 9
    MainScript.IME_JobPool_T1[93].quantity      = 75
    MainScript.IME_JobPool_T1[93].baseValue     = 25
    MainScript.IME_JobPool_T1[93].deadlineHours = 168
    MainScript.IME_JobPool_T1[93].rarity        = "Uncommon"

    ; [ 94] Axion Energy — Water x500  TCV=2,000  126h
    MainScript.IME_JobPool_T1[94] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[94].resourceName  = "Water"
    MainScript.IME_JobPool_T1[94].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T1[94].companyIndex  = 7
    MainScript.IME_JobPool_T1[94].quantity      = 500
    MainScript.IME_JobPool_T1[94].baseValue     = 4
    MainScript.IME_JobPool_T1[94].deadlineHours = 126
    MainScript.IME_JobPool_T1[94].rarity        = "Common"

    ; [ 95] Ryujin — Hypercatalyst x125  TCV=2,250  294h
    MainScript.IME_JobPool_T1[95] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[95].resourceName  = "Hypercatalyst"
    MainScript.IME_JobPool_T1[95].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[95].companyIndex  = 37
    MainScript.IME_JobPool_T1[95].quantity      = 125
    MainScript.IME_JobPool_T1[95].baseValue     = 18
    MainScript.IME_JobPool_T1[95].deadlineHours = 294
    MainScript.IME_JobPool_T1[95].rarity        = "Exotic"

    ; [ 96] Celtcorp — Lubricant x125  TCV=2,250  294h
    MainScript.IME_JobPool_T1[96] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[96].resourceName  = "Lubricant"
    MainScript.IME_JobPool_T1[96].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[96].companyIndex  = 9
    MainScript.IME_JobPool_T1[96].quantity      = 125
    MainScript.IME_JobPool_T1[96].baseValue     = 18
    MainScript.IME_JobPool_T1[96].deadlineHours = 294
    MainScript.IME_JobPool_T1[96].rarity        = "Exotic"

    ; [ 97] Arc Might — Solvent x125  TCV=2,375  294h
    MainScript.IME_JobPool_T1[97] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[97].resourceName  = "Solvent"
    MainScript.IME_JobPool_T1[97].companyName   = "Arc Might"
    MainScript.IME_JobPool_T1[97].companyIndex  = 4
    MainScript.IME_JobPool_T1[97].quantity      = 125
    MainScript.IME_JobPool_T1[97].baseValue     = 19
    MainScript.IME_JobPool_T1[97].deadlineHours = 294
    MainScript.IME_JobPool_T1[97].rarity        = "Exotic"

    ; [ 98] Infinity Ltd — Solvent x125  TCV=2,375  294h
    MainScript.IME_JobPool_T1[98] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[98].resourceName  = "Solvent"
    MainScript.IME_JobPool_T1[98].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T1[98].companyIndex  = 25
    MainScript.IME_JobPool_T1[98].quantity      = 125
    MainScript.IME_JobPool_T1[98].baseValue     = 19
    MainScript.IME_JobPool_T1[98].deadlineHours = 294
    MainScript.IME_JobPool_T1[98].rarity        = "Exotic"

    ; [ 99] Armco — Adaptive Frame x100  TCV=2,400  126h
    MainScript.IME_JobPool_T1[99] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[99].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T1[99].companyName   = "Armco"
    MainScript.IME_JobPool_T1[99].companyIndex  = 6
    MainScript.IME_JobPool_T1[99].quantity      = 100
    MainScript.IME_JobPool_T1[99].baseValue     = 24
    MainScript.IME_JobPool_T1[99].deadlineHours = 126
    MainScript.IME_JobPool_T1[99].rarity        = "Common"

    ; [100] Celtcorp — Adaptive Frame x100  TCV=2,400  126h
    MainScript.IME_JobPool_T1[100] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[100].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T1[100].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[100].companyIndex  = 9
    MainScript.IME_JobPool_T1[100].quantity      = 100
    MainScript.IME_JobPool_T1[100].baseValue     = 24
    MainScript.IME_JobPool_T1[100].deadlineHours = 126
    MainScript.IME_JobPool_T1[100].rarity        = "Common"

    ; [101] Argos Extractors — Indicite Wafer x10  TCV=2,430  420h
    MainScript.IME_JobPool_T1[101] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[101].resourceName  = "Indicite Wafer"
    MainScript.IME_JobPool_T1[101].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T1[101].companyIndex  = 5
    MainScript.IME_JobPool_T1[101].quantity      = 10
    MainScript.IME_JobPool_T1[101].baseValue     = 243
    MainScript.IME_JobPool_T1[101].deadlineHours = 420
    MainScript.IME_JobPool_T1[101].rarity        = "Unique"

    ; [102] Lunar Robotics — Indicite Wafer x10  TCV=2,430  420h
    MainScript.IME_JobPool_T1[102] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[102].resourceName  = "Indicite Wafer"
    MainScript.IME_JobPool_T1[102].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[102].companyIndex  = 29
    MainScript.IME_JobPool_T1[102].quantity      = 10
    MainScript.IME_JobPool_T1[102].baseValue     = 243
    MainScript.IME_JobPool_T1[102].deadlineHours = 420
    MainScript.IME_JobPool_T1[102].rarity        = "Unique"

    ; [103] Son — Indicite Wafer x10  TCV=2,430  420h
    MainScript.IME_JobPool_T1[103] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[103].resourceName  = "Indicite Wafer"
    MainScript.IME_JobPool_T1[103].companyName   = "Son"
    MainScript.IME_JobPool_T1[103].companyIndex  = 42
    MainScript.IME_JobPool_T1[103].quantity      = 10
    MainScript.IME_JobPool_T1[103].baseValue     = 243
    MainScript.IME_JobPool_T1[103].deadlineHours = 420
    MainScript.IME_JobPool_T1[103].rarity        = "Unique"

    ; [104] Ryujin — Amino Acids x250  TCV=2,500  210h
    MainScript.IME_JobPool_T1[104] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[104].resourceName  = "Amino Acids"
    MainScript.IME_JobPool_T1[104].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[104].companyIndex  = 37
    MainScript.IME_JobPool_T1[104].quantity      = 250
    MainScript.IME_JobPool_T1[104].baseValue     = 10
    MainScript.IME_JobPool_T1[104].deadlineHours = 210
    MainScript.IME_JobPool_T1[104].rarity        = "Rare"

    ; [105] Axion Energy — Argon x500  TCV=2,500  126h
    MainScript.IME_JobPool_T1[105] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[105].resourceName  = "Argon"
    MainScript.IME_JobPool_T1[105].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T1[105].companyIndex  = 7
    MainScript.IME_JobPool_T1[105].quantity      = 500
    MainScript.IME_JobPool_T1[105].baseValue     = 5
    MainScript.IME_JobPool_T1[105].deadlineHours = 126
    MainScript.IME_JobPool_T1[105].rarity        = "Common"

    ; [106] Six Sisters — Isotopic Coolant x100  TCV=2,500  126h
    MainScript.IME_JobPool_T1[106] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[106].resourceName  = "Isotopic Coolant"
    MainScript.IME_JobPool_T1[106].companyName   = "Six Sisters"
    MainScript.IME_JobPool_T1[106].companyIndex  = 40
    MainScript.IME_JobPool_T1[106].quantity      = 100
    MainScript.IME_JobPool_T1[106].baseValue     = 25
    MainScript.IME_JobPool_T1[106].deadlineHours = 126
    MainScript.IME_JobPool_T1[106].rarity        = "Common"

    ; [107] Centauri Mills — Nutrient x500  TCV=2,500  126h
    MainScript.IME_JobPool_T1[107] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[107].resourceName  = "Nutrient"
    MainScript.IME_JobPool_T1[107].companyName   = "Centauri Mills"
    MainScript.IME_JobPool_T1[107].companyIndex  = 10
    MainScript.IME_JobPool_T1[107].quantity      = 500
    MainScript.IME_JobPool_T1[107].baseValue     = 5
    MainScript.IME_JobPool_T1[107].deadlineHours = 126
    MainScript.IME_JobPool_T1[107].rarity        = "Common"

    ; [108] Allied Armaments — Polymer x125  TCV=2,500  294h
    MainScript.IME_JobPool_T1[108] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[108].resourceName  = "Polymer"
    MainScript.IME_JobPool_T1[108].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T1[108].companyIndex  = 2
    MainScript.IME_JobPool_T1[108].quantity      = 125
    MainScript.IME_JobPool_T1[108].baseValue     = 20
    MainScript.IME_JobPool_T1[108].deadlineHours = 294
    MainScript.IME_JobPool_T1[108].rarity        = "Exotic"

    ; [109] Axion Energy — Polymer x125  TCV=2,500  294h
    MainScript.IME_JobPool_T1[109] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[109].resourceName  = "Polymer"
    MainScript.IME_JobPool_T1[109].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T1[109].companyIndex  = 7
    MainScript.IME_JobPool_T1[109].quantity      = 125
    MainScript.IME_JobPool_T1[109].baseValue     = 20
    MainScript.IME_JobPool_T1[109].deadlineHours = 294
    MainScript.IME_JobPool_T1[109].rarity        = "Exotic"

    ; [110] Combatech — Polymer x125  TCV=2,500  294h
    MainScript.IME_JobPool_T1[110] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[110].resourceName  = "Polymer"
    MainScript.IME_JobPool_T1[110].companyName   = "Combatech"
    MainScript.IME_JobPool_T1[110].companyIndex  = 13
    MainScript.IME_JobPool_T1[110].quantity      = 125
    MainScript.IME_JobPool_T1[110].baseValue     = 20
    MainScript.IME_JobPool_T1[110].deadlineHours = 294
    MainScript.IME_JobPool_T1[110].rarity        = "Exotic"

    ; [111] Armco — Reactive Gauge x100  TCV=2,500  126h
    MainScript.IME_JobPool_T1[111] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[111].resourceName  = "Reactive Gauge"
    MainScript.IME_JobPool_T1[111].companyName   = "Armco"
    MainScript.IME_JobPool_T1[111].companyIndex  = 6
    MainScript.IME_JobPool_T1[111].quantity      = 100
    MainScript.IME_JobPool_T1[111].baseValue     = 25
    MainScript.IME_JobPool_T1[111].deadlineHours = 126
    MainScript.IME_JobPool_T1[111].rarity        = "Common"

    ; [112] Ryujin — Stimulant x125  TCV=2,500  294h
    MainScript.IME_JobPool_T1[112] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[112].resourceName  = "Stimulant"
    MainScript.IME_JobPool_T1[112].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[112].companyIndex  = 37
    MainScript.IME_JobPool_T1[112].quantity      = 125
    MainScript.IME_JobPool_T1[112].baseValue     = 20
    MainScript.IME_JobPool_T1[112].deadlineHours = 294
    MainScript.IME_JobPool_T1[112].rarity        = "Exotic"

    ; [113] Celtcorp — Substrate Molecule Sieve x10  TCV=2,740  420h
    MainScript.IME_JobPool_T1[113] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[113].resourceName  = "Substrate Molecule Sieve"
    MainScript.IME_JobPool_T1[113].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[113].companyIndex  = 9
    MainScript.IME_JobPool_T1[113].quantity      = 10
    MainScript.IME_JobPool_T1[113].baseValue     = 274
    MainScript.IME_JobPool_T1[113].deadlineHours = 420
    MainScript.IME_JobPool_T1[113].rarity        = "Unique"

    ; [114] Lunar Robotics — Substrate Molecule Sieve x10  TCV=2,740  420h
    MainScript.IME_JobPool_T1[114] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[114].resourceName  = "Substrate Molecule Sieve"
    MainScript.IME_JobPool_T1[114].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T1[114].companyIndex  = 29
    MainScript.IME_JobPool_T1[114].quantity      = 10
    MainScript.IME_JobPool_T1[114].baseValue     = 274
    MainScript.IME_JobPool_T1[114].deadlineHours = 420
    MainScript.IME_JobPool_T1[114].rarity        = "Unique"

    ; [115] Infinity Ltd — Ionic Liquids x125  TCV=2,875  294h
    MainScript.IME_JobPool_T1[115] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[115].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T1[115].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T1[115].companyIndex  = 25
    MainScript.IME_JobPool_T1[115].quantity      = 125
    MainScript.IME_JobPool_T1[115].baseValue     = 23
    MainScript.IME_JobPool_T1[115].deadlineHours = 294
    MainScript.IME_JobPool_T1[115].rarity        = "Exotic"

    ; [116] Ryujin — Ionic Liquids x125  TCV=2,875  294h
    MainScript.IME_JobPool_T1[116] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[116].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T1[116].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[116].companyIndex  = 37
    MainScript.IME_JobPool_T1[116].quantity      = 125
    MainScript.IME_JobPool_T1[116].baseValue     = 23
    MainScript.IME_JobPool_T1[116].deadlineHours = 294
    MainScript.IME_JobPool_T1[116].rarity        = "Exotic"

    ; [117] Ryujin — Immunostimulant x50  TCV=2,900  420h
    MainScript.IME_JobPool_T1[117] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[117].resourceName  = "Immunostimulant"
    MainScript.IME_JobPool_T1[117].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[117].companyIndex  = 37
    MainScript.IME_JobPool_T1[117].quantity      = 50
    MainScript.IME_JobPool_T1[117].baseValue     = 58
    MainScript.IME_JobPool_T1[117].deadlineHours = 420
    MainScript.IME_JobPool_T1[117].rarity        = "Unique"

    ; [118] Ryujin — Luxury Textile x50  TCV=2,900  420h
    MainScript.IME_JobPool_T1[118] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[118].resourceName  = "Luxury Textile"
    MainScript.IME_JobPool_T1[118].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[118].companyIndex  = 37
    MainScript.IME_JobPool_T1[118].quantity      = 50
    MainScript.IME_JobPool_T1[118].baseValue     = 58
    MainScript.IME_JobPool_T1[118].deadlineHours = 420
    MainScript.IME_JobPool_T1[118].rarity        = "Unique"

    ; [119] Axion Energy — Adhesive x250  TCV=3,000  210h
    MainScript.IME_JobPool_T1[119] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[119].resourceName  = "Adhesive"
    MainScript.IME_JobPool_T1[119].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T1[119].companyIndex  = 7
    MainScript.IME_JobPool_T1[119].quantity      = 250
    MainScript.IME_JobPool_T1[119].baseValue     = 12
    MainScript.IME_JobPool_T1[119].deadlineHours = 210
    MainScript.IME_JobPool_T1[119].rarity        = "Rare"

    ; [120] Celtcorp — Adhesive x250  TCV=3,000  210h
    MainScript.IME_JobPool_T1[120] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[120].resourceName  = "Adhesive"
    MainScript.IME_JobPool_T1[120].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T1[120].companyIndex  = 9
    MainScript.IME_JobPool_T1[120].quantity      = 250
    MainScript.IME_JobPool_T1[120].baseValue     = 12
    MainScript.IME_JobPool_T1[120].deadlineHours = 210
    MainScript.IME_JobPool_T1[120].rarity        = "Rare"

    ; [121] Ryujin — Analgesic x250  TCV=3,000  210h
    MainScript.IME_JobPool_T1[121] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[121].resourceName  = "Analgesic"
    MainScript.IME_JobPool_T1[121].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[121].companyIndex  = 37
    MainScript.IME_JobPool_T1[121].quantity      = 250
    MainScript.IME_JobPool_T1[121].baseValue     = 12
    MainScript.IME_JobPool_T1[121].deadlineHours = 210
    MainScript.IME_JobPool_T1[121].rarity        = "Rare"

    ; [122] Infinity Ltd — Chlorine x500  TCV=3,000  126h
    MainScript.IME_JobPool_T1[122] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[122].resourceName  = "Chlorine"
    MainScript.IME_JobPool_T1[122].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T1[122].companyIndex  = 25
    MainScript.IME_JobPool_T1[122].quantity      = 500
    MainScript.IME_JobPool_T1[122].baseValue     = 6
    MainScript.IME_JobPool_T1[122].deadlineHours = 126
    MainScript.IME_JobPool_T1[122].rarity        = "Common"

    ; [123] Ryujin — Chlorine x500  TCV=3,000  126h
    MainScript.IME_JobPool_T1[123] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[123].resourceName  = "Chlorine"
    MainScript.IME_JobPool_T1[123].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[123].companyIndex  = 37
    MainScript.IME_JobPool_T1[123].quantity      = 500
    MainScript.IME_JobPool_T1[123].baseValue     = 6
    MainScript.IME_JobPool_T1[123].deadlineHours = 126
    MainScript.IME_JobPool_T1[123].rarity        = "Common"

    ; [124] Enhance — Cosmetic x375  TCV=3,000  168h
    MainScript.IME_JobPool_T1[124] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[124].resourceName  = "Cosmetic"
    MainScript.IME_JobPool_T1[124].companyName   = "Enhance"
    MainScript.IME_JobPool_T1[124].companyIndex  = 19
    MainScript.IME_JobPool_T1[124].quantity      = 375
    MainScript.IME_JobPool_T1[124].baseValue     = 8
    MainScript.IME_JobPool_T1[124].deadlineHours = 168
    MainScript.IME_JobPool_T1[124].rarity        = "Uncommon"

    ; [125] Ryujin — Cosmetic x375  TCV=3,000  168h
    MainScript.IME_JobPool_T1[125] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[125].resourceName  = "Cosmetic"
    MainScript.IME_JobPool_T1[125].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[125].companyIndex  = 37
    MainScript.IME_JobPool_T1[125].quantity      = 375
    MainScript.IME_JobPool_T1[125].baseValue     = 8
    MainScript.IME_JobPool_T1[125].deadlineHours = 168
    MainScript.IME_JobPool_T1[125].rarity        = "Uncommon"

    ; [126] Arc Might — Sealant x500  TCV=3,000  126h
    MainScript.IME_JobPool_T1[126] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[126].resourceName  = "Sealant"
    MainScript.IME_JobPool_T1[126].companyName   = "Arc Might"
    MainScript.IME_JobPool_T1[126].companyIndex  = 4
    MainScript.IME_JobPool_T1[126].quantity      = 500
    MainScript.IME_JobPool_T1[126].baseValue     = 6
    MainScript.IME_JobPool_T1[126].deadlineHours = 126
    MainScript.IME_JobPool_T1[126].rarity        = "Common"

    ; [127] Ryujin — Sealant x500  TCV=3,000  126h
    MainScript.IME_JobPool_T1[127] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T1[127].resourceName  = "Sealant"
    MainScript.IME_JobPool_T1[127].companyName   = "Ryujin"
    MainScript.IME_JobPool_T1[127].companyIndex  = 37
    MainScript.IME_JobPool_T1[127].quantity      = 500
    MainScript.IME_JobPool_T1[127].baseValue     = 6
    MainScript.IME_JobPool_T1[127].deadlineHours = 126
    MainScript.IME_JobPool_T1[127].rarity        = "Common"

EndFunction

; ── TIER 2 (128 jobs | TCV 3,100 - 7,000) ──────────────────────────────────────────
Function InitTier2Jobs()
    MainScript.IME_Tier2_JobCount = 128
    MainScript.IME_JobPool_T2 = new IME_MainQuestScript:JobTemplate[128]

    ; [  0] Eit Clothiers — High-Tensile Spidroin x50  TCV=3,100  420h
    MainScript.IME_JobPool_T2[0] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[0].resourceName  = "High-Tensile Spidroin"
    MainScript.IME_JobPool_T2[0].companyName   = "Eit Clothiers"
    MainScript.IME_JobPool_T2[0].companyIndex  = 18
    MainScript.IME_JobPool_T2[0].quantity      = 50
    MainScript.IME_JobPool_T2[0].baseValue     = 62
    MainScript.IME_JobPool_T2[0].deadlineHours = 420
    MainScript.IME_JobPool_T2[0].rarity        = "Unique"

    ; [  1] Consolidated Mining — Caesium x125  TCV=3,125  294h
    MainScript.IME_JobPool_T2[1] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[1].resourceName  = "Caesium"
    MainScript.IME_JobPool_T2[1].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T2[1].companyIndex  = 14
    MainScript.IME_JobPool_T2[1].quantity      = 125
    MainScript.IME_JobPool_T2[1].baseValue     = 25
    MainScript.IME_JobPool_T2[1].deadlineHours = 294
    MainScript.IME_JobPool_T2[1].rarity        = "Exotic"

    ; [  2] Vanguard — Caesium x125  TCV=3,125  294h
    MainScript.IME_JobPool_T2[2] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[2].resourceName  = "Caesium"
    MainScript.IME_JobPool_T2[2].companyName   = "Vanguard"
    MainScript.IME_JobPool_T2[2].companyIndex  = 46
    MainScript.IME_JobPool_T2[2].quantity      = 125
    MainScript.IME_JobPool_T2[2].baseValue     = 25
    MainScript.IME_JobPool_T2[2].deadlineHours = 294
    MainScript.IME_JobPool_T2[2].rarity        = "Exotic"

    ; [  3] Celtcorp — Memory Substrate x50  TCV=3,250  420h
    MainScript.IME_JobPool_T2[3] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[3].resourceName  = "Memory Substrate"
    MainScript.IME_JobPool_T2[3].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T2[3].companyIndex  = 9
    MainScript.IME_JobPool_T2[3].quantity      = 50
    MainScript.IME_JobPool_T2[3].baseValue     = 65
    MainScript.IME_JobPool_T2[3].deadlineHours = 420
    MainScript.IME_JobPool_T2[3].rarity        = "Unique"

    ; [  4] Reliant Medical — Memory Substrate x50  TCV=3,250  420h
    MainScript.IME_JobPool_T2[4] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[4].resourceName  = "Memory Substrate"
    MainScript.IME_JobPool_T2[4].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T2[4].companyIndex  = 36
    MainScript.IME_JobPool_T2[4].quantity      = 50
    MainScript.IME_JobPool_T2[4].baseValue     = 65
    MainScript.IME_JobPool_T2[4].deadlineHours = 420
    MainScript.IME_JobPool_T2[4].rarity        = "Unique"

    ; [  5] Allied Armaments — Titanium x275  TCV=3,300  210h
    MainScript.IME_JobPool_T2[5] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[5].resourceName  = "Titanium"
    MainScript.IME_JobPool_T2[5].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T2[5].companyIndex  = 2
    MainScript.IME_JobPool_T2[5].quantity      = 275
    MainScript.IME_JobPool_T2[5].baseValue     = 12
    MainScript.IME_JobPool_T2[5].deadlineHours = 210
    MainScript.IME_JobPool_T2[5].rarity        = "Rare"

    ; [  6] Axion Energy — Titanium x275  TCV=3,300  210h
    MainScript.IME_JobPool_T2[6] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[6].resourceName  = "Titanium"
    MainScript.IME_JobPool_T2[6].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[6].companyIndex  = 7
    MainScript.IME_JobPool_T2[6].quantity      = 275
    MainScript.IME_JobPool_T2[6].baseValue     = 12
    MainScript.IME_JobPool_T2[6].deadlineHours = 210
    MainScript.IME_JobPool_T2[6].rarity        = "Rare"

    ; [  7] Consolidated Mining — Titanium x275  TCV=3,300  210h
    MainScript.IME_JobPool_T2[7] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[7].resourceName  = "Titanium"
    MainScript.IME_JobPool_T2[7].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T2[7].companyIndex  = 14
    MainScript.IME_JobPool_T2[7].quantity      = 275
    MainScript.IME_JobPool_T2[7].baseValue     = 12
    MainScript.IME_JobPool_T2[7].deadlineHours = 210
    MainScript.IME_JobPool_T2[7].rarity        = "Rare"

    ; [  8] Filburn Agriculture — Membrane x375  TCV=3,375  168h
    MainScript.IME_JobPool_T2[8] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[8].resourceName  = "Membrane"
    MainScript.IME_JobPool_T2[8].companyName   = "Filburn Agriculture"
    MainScript.IME_JobPool_T2[8].companyIndex  = 20
    MainScript.IME_JobPool_T2[8].quantity      = 375
    MainScript.IME_JobPool_T2[8].baseValue     = 9
    MainScript.IME_JobPool_T2[8].deadlineHours = 168
    MainScript.IME_JobPool_T2[8].rarity        = "Uncommon"

    ; [  9] Ryujin — Membrane x375  TCV=3,375  168h
    MainScript.IME_JobPool_T2[9] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[9].resourceName  = "Membrane"
    MainScript.IME_JobPool_T2[9].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[9].companyIndex  = 37
    MainScript.IME_JobPool_T2[9].quantity      = 375
    MainScript.IME_JobPool_T2[9].baseValue     = 9
    MainScript.IME_JobPool_T2[9].deadlineHours = 168
    MainScript.IME_JobPool_T2[9].rarity        = "Uncommon"

    ; [ 10] Axion Energy — Xenon x125  TCV=3,375  294h
    MainScript.IME_JobPool_T2[10] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[10].resourceName  = "Xenon"
    MainScript.IME_JobPool_T2[10].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[10].companyIndex  = 7
    MainScript.IME_JobPool_T2[10].quantity      = 125
    MainScript.IME_JobPool_T2[10].baseValue     = 27
    MainScript.IME_JobPool_T2[10].deadlineHours = 294
    MainScript.IME_JobPool_T2[10].rarity        = "Exotic"

    ; [ 11] Allied Armaments — Aluminum x500  TCV=3,500  126h
    MainScript.IME_JobPool_T2[11] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[11].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[11].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T2[11].companyIndex  = 2
    MainScript.IME_JobPool_T2[11].quantity      = 500
    MainScript.IME_JobPool_T2[11].baseValue     = 7
    MainScript.IME_JobPool_T2[11].deadlineHours = 126
    MainScript.IME_JobPool_T2[11].rarity        = "Common"

    ; [ 12] Armco — Aluminum x500  TCV=3,500  126h
    MainScript.IME_JobPool_T2[12] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[12].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[12].companyName   = "Armco"
    MainScript.IME_JobPool_T2[12].companyIndex  = 6
    MainScript.IME_JobPool_T2[12].quantity      = 500
    MainScript.IME_JobPool_T2[12].baseValue     = 7
    MainScript.IME_JobPool_T2[12].deadlineHours = 126
    MainScript.IME_JobPool_T2[12].rarity        = "Common"

    ; [ 13] Axion Energy — Aluminum x500  TCV=3,500  126h
    MainScript.IME_JobPool_T2[13] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[13].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[13].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[13].companyIndex  = 7
    MainScript.IME_JobPool_T2[13].quantity      = 500
    MainScript.IME_JobPool_T2[13].baseValue     = 7
    MainScript.IME_JobPool_T2[13].deadlineHours = 126
    MainScript.IME_JobPool_T2[13].rarity        = "Common"

    ; [ 14] Combatech — Aluminum x500  TCV=3,500  126h
    MainScript.IME_JobPool_T2[14] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[14].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[14].companyName   = "Combatech"
    MainScript.IME_JobPool_T2[14].companyIndex  = 13
    MainScript.IME_JobPool_T2[14].quantity      = 500
    MainScript.IME_JobPool_T2[14].baseValue     = 7
    MainScript.IME_JobPool_T2[14].deadlineHours = 126
    MainScript.IME_JobPool_T2[14].rarity        = "Common"

    ; [ 15] Kore Kinetics — Aluminum x500  TCV=3,500  126h
    MainScript.IME_JobPool_T2[15] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[15].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[15].companyName   = "Kore Kinetics"
    MainScript.IME_JobPool_T2[15].companyIndex  = 26
    MainScript.IME_JobPool_T2[15].quantity      = 500
    MainScript.IME_JobPool_T2[15].baseValue     = 7
    MainScript.IME_JobPool_T2[15].deadlineHours = 126
    MainScript.IME_JobPool_T2[15].rarity        = "Common"

    ; [ 16] Ryujin — Aluminum x500  TCV=3,500  126h
    MainScript.IME_JobPool_T2[16] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[16].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[16].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[16].companyIndex  = 37
    MainScript.IME_JobPool_T2[16].quantity      = 500
    MainScript.IME_JobPool_T2[16].baseValue     = 7
    MainScript.IME_JobPool_T2[16].deadlineHours = 126
    MainScript.IME_JobPool_T2[16].rarity        = "Common"

    ; [ 17] Ryujin — Hallucinogen x250  TCV=3,500  210h
    MainScript.IME_JobPool_T2[17] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[17].resourceName  = "Hallucinogen"
    MainScript.IME_JobPool_T2[17].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[17].companyIndex  = 37
    MainScript.IME_JobPool_T2[17].quantity      = 250
    MainScript.IME_JobPool_T2[17].baseValue     = 14
    MainScript.IME_JobPool_T2[17].deadlineHours = 210
    MainScript.IME_JobPool_T2[17].rarity        = "Rare"

    ; [ 18] Axion Energy — Lithium x250  TCV=3,500  210h
    MainScript.IME_JobPool_T2[18] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[18].resourceName  = "Lithium"
    MainScript.IME_JobPool_T2[18].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[18].companyIndex  = 7
    MainScript.IME_JobPool_T2[18].quantity      = 250
    MainScript.IME_JobPool_T2[18].baseValue     = 14
    MainScript.IME_JobPool_T2[18].deadlineHours = 210
    MainScript.IME_JobPool_T2[18].rarity        = "Rare"

    ; [ 19] Nova Galactic — Lithium x250  TCV=3,500  210h
    MainScript.IME_JobPool_T2[19] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[19].resourceName  = "Lithium"
    MainScript.IME_JobPool_T2[19].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T2[19].companyIndex  = 32
    MainScript.IME_JobPool_T2[19].quantity      = 250
    MainScript.IME_JobPool_T2[19].baseValue     = 14
    MainScript.IME_JobPool_T2[19].deadlineHours = 210
    MainScript.IME_JobPool_T2[19].rarity        = "Rare"

    ; [ 20] Armco — Structural Material x500  TCV=3,500  126h
    MainScript.IME_JobPool_T2[20] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[20].resourceName  = "Structural Material"
    MainScript.IME_JobPool_T2[20].companyName   = "Armco"
    MainScript.IME_JobPool_T2[20].companyIndex  = 6
    MainScript.IME_JobPool_T2[20].quantity      = 500
    MainScript.IME_JobPool_T2[20].baseValue     = 7
    MainScript.IME_JobPool_T2[20].deadlineHours = 126
    MainScript.IME_JobPool_T2[20].rarity        = "Common"

    ; [ 21] Argos Extractors — Titanium x300  TCV=3,600  210h
    MainScript.IME_JobPool_T2[21] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[21].resourceName  = "Titanium"
    MainScript.IME_JobPool_T2[21].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T2[21].companyIndex  = 5
    MainScript.IME_JobPool_T2[21].quantity      = 300
    MainScript.IME_JobPool_T2[21].baseValue     = 12
    MainScript.IME_JobPool_T2[21].deadlineHours = 210
    MainScript.IME_JobPool_T2[21].rarity        = "Rare"

    ; [ 22] Allied Armaments — Isocentered Magnet x100  TCV=3,600  126h
    MainScript.IME_JobPool_T2[22] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[22].resourceName  = "Isocentered Magnet"
    MainScript.IME_JobPool_T2[22].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T2[22].companyIndex  = 2
    MainScript.IME_JobPool_T2[22].quantity      = 100
    MainScript.IME_JobPool_T2[22].baseValue     = 36
    MainScript.IME_JobPool_T2[22].deadlineHours = 126
    MainScript.IME_JobPool_T2[22].rarity        = "Common"

    ; [ 23] Infinity Ltd — Antimicrobial x375  TCV=3,750  168h
    MainScript.IME_JobPool_T2[23] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[23].resourceName  = "Antimicrobial"
    MainScript.IME_JobPool_T2[23].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T2[23].companyIndex  = 25
    MainScript.IME_JobPool_T2[23].quantity      = 375
    MainScript.IME_JobPool_T2[23].baseValue     = 10
    MainScript.IME_JobPool_T2[23].deadlineHours = 168
    MainScript.IME_JobPool_T2[23].rarity        = "Uncommon"

    ; [ 24] Son — Antimicrobial x375  TCV=3,750  168h
    MainScript.IME_JobPool_T2[24] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[24].resourceName  = "Antimicrobial"
    MainScript.IME_JobPool_T2[24].companyName   = "Son"
    MainScript.IME_JobPool_T2[24].companyIndex  = 42
    MainScript.IME_JobPool_T2[24].quantity      = 375
    MainScript.IME_JobPool_T2[24].baseValue     = 10
    MainScript.IME_JobPool_T2[24].deadlineHours = 168
    MainScript.IME_JobPool_T2[24].rarity        = "Uncommon"

    ; [ 25] Protectorate Systems — Antimony x125  TCV=3,750  294h
    MainScript.IME_JobPool_T2[25] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[25].resourceName  = "Antimony"
    MainScript.IME_JobPool_T2[25].companyName   = "Protectorate Systems"
    MainScript.IME_JobPool_T2[25].companyIndex  = 34
    MainScript.IME_JobPool_T2[25].quantity      = 125
    MainScript.IME_JobPool_T2[25].baseValue     = 30
    MainScript.IME_JobPool_T2[25].deadlineHours = 294
    MainScript.IME_JobPool_T2[25].rarity        = "Exotic"

    ; [ 26] Dogstar — Helium-3 x750  TCV=3,750  202h
    MainScript.IME_JobPool_T2[26] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[26].resourceName  = "Helium-3"
    MainScript.IME_JobPool_T2[26].companyName   = "Dogstar"
    MainScript.IME_JobPool_T2[26].companyIndex  = 17
    MainScript.IME_JobPool_T2[26].quantity      = 750
    MainScript.IME_JobPool_T2[26].baseValue     = 5
    MainScript.IME_JobPool_T2[26].deadlineHours = 202
    MainScript.IME_JobPool_T2[26].rarity        = "Uncommon"

    ; [ 27] Enhance — Pigment x375  TCV=3,750  168h
    MainScript.IME_JobPool_T2[27] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[27].resourceName  = "Pigment"
    MainScript.IME_JobPool_T2[27].companyName   = "Enhance"
    MainScript.IME_JobPool_T2[27].companyIndex  = 19
    MainScript.IME_JobPool_T2[27].quantity      = 375
    MainScript.IME_JobPool_T2[27].baseValue     = 10
    MainScript.IME_JobPool_T2[27].deadlineHours = 168
    MainScript.IME_JobPool_T2[27].rarity        = "Uncommon"

    ; [ 28] Muybridge Pharmaceuticals — Biosuppressant x250  TCV=4,000  353h
    MainScript.IME_JobPool_T2[28] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[28].resourceName  = "Biosuppressant"
    MainScript.IME_JobPool_T2[28].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T2[28].companyIndex  = 30
    MainScript.IME_JobPool_T2[28].quantity      = 250
    MainScript.IME_JobPool_T2[28].baseValue     = 16
    MainScript.IME_JobPool_T2[28].deadlineHours = 353
    MainScript.IME_JobPool_T2[28].rarity        = "Exotic"

    ; [ 29] Ryujin — Fiber x1000  TCV=4,000  151h
    MainScript.IME_JobPool_T2[29] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[29].resourceName  = "Fiber"
    MainScript.IME_JobPool_T2[29].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[29].companyIndex  = 37
    MainScript.IME_JobPool_T2[29].quantity      = 1000
    MainScript.IME_JobPool_T2[29].baseValue     = 4
    MainScript.IME_JobPool_T2[29].deadlineHours = 151
    MainScript.IME_JobPool_T2[29].rarity        = "Common"

    ; [ 30] Celtcorp — Iron x500  TCV=4,000  126h
    MainScript.IME_JobPool_T2[30] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[30].resourceName  = "Iron"
    MainScript.IME_JobPool_T2[30].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T2[30].companyIndex  = 9
    MainScript.IME_JobPool_T2[30].quantity      = 500
    MainScript.IME_JobPool_T2[30].baseValue     = 8
    MainScript.IME_JobPool_T2[30].deadlineHours = 126
    MainScript.IME_JobPool_T2[30].rarity        = "Common"

    ; [ 31] Aboron — Neon x250  TCV=4,000  353h
    MainScript.IME_JobPool_T2[31] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[31].resourceName  = "Neon"
    MainScript.IME_JobPool_T2[31].companyName   = "Aboron"
    MainScript.IME_JobPool_T2[31].companyIndex  = 0
    MainScript.IME_JobPool_T2[31].quantity      = 250
    MainScript.IME_JobPool_T2[31].baseValue     = 16
    MainScript.IME_JobPool_T2[31].deadlineHours = 353
    MainScript.IME_JobPool_T2[31].rarity        = "Exotic"

    ; [ 32] Reliant Medical — Toxin x500  TCV=4,000  126h
    MainScript.IME_JobPool_T2[32] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[32].resourceName  = "Toxin"
    MainScript.IME_JobPool_T2[32].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T2[32].companyIndex  = 36
    MainScript.IME_JobPool_T2[32].quantity      = 500
    MainScript.IME_JobPool_T2[32].baseValue     = 8
    MainScript.IME_JobPool_T2[32].deadlineHours = 126
    MainScript.IME_JobPool_T2[32].rarity        = "Common"

    ; [ 33] Advanced Nutrition — Water x1000  TCV=4,000  151h
    MainScript.IME_JobPool_T2[33] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[33].resourceName  = "Water"
    MainScript.IME_JobPool_T2[33].companyName   = "Advanced Nutrition"
    MainScript.IME_JobPool_T2[33].companyIndex  = 1
    MainScript.IME_JobPool_T2[33].quantity      = 1000
    MainScript.IME_JobPool_T2[33].baseValue     = 4
    MainScript.IME_JobPool_T2[33].deadlineHours = 151
    MainScript.IME_JobPool_T2[33].rarity        = "Common"

    ; [ 34] Chandra Vineyards — Water x1000  TCV=4,000  151h
    MainScript.IME_JobPool_T2[34] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[34].resourceName  = "Water"
    MainScript.IME_JobPool_T2[34].companyName   = "Chandra Vineyards"
    MainScript.IME_JobPool_T2[34].companyIndex  = 11
    MainScript.IME_JobPool_T2[34].quantity      = 1000
    MainScript.IME_JobPool_T2[34].baseValue     = 4
    MainScript.IME_JobPool_T2[34].deadlineHours = 151
    MainScript.IME_JobPool_T2[34].rarity        = "Common"

    ; [ 35] Xenofresh Fisheries — Water x1000  TCV=4,000  151h
    MainScript.IME_JobPool_T2[35] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[35].resourceName  = "Water"
    MainScript.IME_JobPool_T2[35].companyName   = "Xenofresh Fisheries"
    MainScript.IME_JobPool_T2[35].companyIndex  = 47
    MainScript.IME_JobPool_T2[35].quantity      = 1000
    MainScript.IME_JobPool_T2[35].baseValue     = 4
    MainScript.IME_JobPool_T2[35].deadlineHours = 151
    MainScript.IME_JobPool_T2[35].rarity        = "Common"

    ; [ 36] Filburn Agriculture — Spice x375  TCV=4,125  168h
    MainScript.IME_JobPool_T2[36] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[36].resourceName  = "Spice"
    MainScript.IME_JobPool_T2[36].companyName   = "Filburn Agriculture"
    MainScript.IME_JobPool_T2[36].companyIndex  = 20
    MainScript.IME_JobPool_T2[36].quantity      = 375
    MainScript.IME_JobPool_T2[36].baseValue     = 11
    MainScript.IME_JobPool_T2[36].deadlineHours = 168
    MainScript.IME_JobPool_T2[36].rarity        = "Uncommon"

    ; [ 37] Six Sisters — Aldumite Drilling Rig x10  TCV=4,210  420h
    MainScript.IME_JobPool_T2[37] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[37].resourceName  = "Aldumite Drilling Rig"
    MainScript.IME_JobPool_T2[37].companyName   = "Six Sisters"
    MainScript.IME_JobPool_T2[37].companyIndex  = 40
    MainScript.IME_JobPool_T2[37].quantity      = 10
    MainScript.IME_JobPool_T2[37].baseValue     = 421
    MainScript.IME_JobPool_T2[37].deadlineHours = 420
    MainScript.IME_JobPool_T2[37].rarity        = "Unique"

    ; [ 38] Infinity Ltd — Beryllium x375  TCV=4,500  168h
    MainScript.IME_JobPool_T2[38] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[38].resourceName  = "Beryllium"
    MainScript.IME_JobPool_T2[38].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T2[38].companyIndex  = 25
    MainScript.IME_JobPool_T2[38].quantity      = 375
    MainScript.IME_JobPool_T2[38].baseValue     = 12
    MainScript.IME_JobPool_T2[38].deadlineHours = 168
    MainScript.IME_JobPool_T2[38].rarity        = "Uncommon"

    ; [ 39] Arc Might — Control Rod x25  TCV=4,500  294h
    MainScript.IME_JobPool_T2[39] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[39].resourceName  = "Control Rod"
    MainScript.IME_JobPool_T2[39].companyName   = "Arc Might"
    MainScript.IME_JobPool_T2[39].companyIndex  = 4
    MainScript.IME_JobPool_T2[39].quantity      = 25
    MainScript.IME_JobPool_T2[39].baseValue     = 180
    MainScript.IME_JobPool_T2[39].deadlineHours = 294
    MainScript.IME_JobPool_T2[39].rarity        = "Exotic"

    ; [ 40] Arc Might — Fluorine x375  TCV=4,500  168h
    MainScript.IME_JobPool_T2[40] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[40].resourceName  = "Fluorine"
    MainScript.IME_JobPool_T2[40].companyName   = "Arc Might"
    MainScript.IME_JobPool_T2[40].companyIndex  = 4
    MainScript.IME_JobPool_T2[40].quantity      = 375
    MainScript.IME_JobPool_T2[40].baseValue     = 12
    MainScript.IME_JobPool_T2[40].deadlineHours = 168
    MainScript.IME_JobPool_T2[40].rarity        = "Uncommon"

    ; [ 41] Ryujin — Fluorine x375  TCV=4,500  168h
    MainScript.IME_JobPool_T2[41] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[41].resourceName  = "Fluorine"
    MainScript.IME_JobPool_T2[41].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[41].companyIndex  = 37
    MainScript.IME_JobPool_T2[41].quantity      = 375
    MainScript.IME_JobPool_T2[41].baseValue     = 12
    MainScript.IME_JobPool_T2[41].deadlineHours = 168
    MainScript.IME_JobPool_T2[41].rarity        = "Uncommon"

    ; [ 42] Muybridge Pharmaceuticals — Hypercatalyst x250  TCV=4,500  353h
    MainScript.IME_JobPool_T2[42] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[42].resourceName  = "Hypercatalyst"
    MainScript.IME_JobPool_T2[42].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T2[42].companyIndex  = 30
    MainScript.IME_JobPool_T2[42].quantity      = 250
    MainScript.IME_JobPool_T2[42].baseValue     = 18
    MainScript.IME_JobPool_T2[42].deadlineHours = 353
    MainScript.IME_JobPool_T2[42].rarity        = "Exotic"

    ; [ 43] Axion Energy — Lubricant x250  TCV=4,500  353h
    MainScript.IME_JobPool_T2[43] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[43].resourceName  = "Lubricant"
    MainScript.IME_JobPool_T2[43].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[43].companyIndex  = 7
    MainScript.IME_JobPool_T2[43].quantity      = 250
    MainScript.IME_JobPool_T2[43].baseValue     = 18
    MainScript.IME_JobPool_T2[43].deadlineHours = 353
    MainScript.IME_JobPool_T2[43].rarity        = "Exotic"

    ; [ 44] Ryujin — Metabolic Agent x500  TCV=4,500  126h
    MainScript.IME_JobPool_T2[44] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[44].resourceName  = "Metabolic Agent"
    MainScript.IME_JobPool_T2[44].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[44].companyIndex  = 37
    MainScript.IME_JobPool_T2[44].quantity      = 500
    MainScript.IME_JobPool_T2[44].baseValue     = 9
    MainScript.IME_JobPool_T2[44].deadlineHours = 126
    MainScript.IME_JobPool_T2[44].rarity        = "Common"

    ; [ 45] Ryujin — Tetrafluorides x250  TCV=4,500  210h
    MainScript.IME_JobPool_T2[45] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[45].resourceName  = "Tetrafluorides"
    MainScript.IME_JobPool_T2[45].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[45].companyIndex  = 37
    MainScript.IME_JobPool_T2[45].quantity      = 250
    MainScript.IME_JobPool_T2[45].baseValue     = 18
    MainScript.IME_JobPool_T2[45].deadlineHours = 210
    MainScript.IME_JobPool_T2[45].rarity        = "Rare"

    ; [ 46] Arc Might — Molecular Sieve x50  TCV=4,550  210h
    MainScript.IME_JobPool_T2[46] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[46].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T2[46].companyName   = "Arc Might"
    MainScript.IME_JobPool_T2[46].companyIndex  = 4
    MainScript.IME_JobPool_T2[46].quantity      = 50
    MainScript.IME_JobPool_T2[46].baseValue     = 91
    MainScript.IME_JobPool_T2[46].deadlineHours = 210
    MainScript.IME_JobPool_T2[46].rarity        = "Rare"

    ; [ 47] Celtcorp — Molecular Sieve x50  TCV=4,550  210h
    MainScript.IME_JobPool_T2[47] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[47].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T2[47].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T2[47].companyIndex  = 9
    MainScript.IME_JobPool_T2[47].quantity      = 50
    MainScript.IME_JobPool_T2[47].baseValue     = 91
    MainScript.IME_JobPool_T2[47].deadlineHours = 210
    MainScript.IME_JobPool_T2[47].rarity        = "Rare"

    ; [ 48] Axion Energy — Solvent x250  TCV=4,750  353h
    MainScript.IME_JobPool_T2[48] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[48].resourceName  = "Solvent"
    MainScript.IME_JobPool_T2[48].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[48].companyIndex  = 7
    MainScript.IME_JobPool_T2[48].quantity      = 250
    MainScript.IME_JobPool_T2[48].baseValue     = 19
    MainScript.IME_JobPool_T2[48].deadlineHours = 353
    MainScript.IME_JobPool_T2[48].rarity        = "Exotic"

    ; [ 49] Nova Galactic — Ytterbium x125  TCV=4,750  294h
    MainScript.IME_JobPool_T2[49] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[49].resourceName  = "Ytterbium"
    MainScript.IME_JobPool_T2[49].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T2[49].companyIndex  = 32
    MainScript.IME_JobPool_T2[49].quantity      = 125
    MainScript.IME_JobPool_T2[49].baseValue     = 38
    MainScript.IME_JobPool_T2[49].deadlineHours = 294
    MainScript.IME_JobPool_T2[49].rarity        = "Exotic"

    ; [ 50] Advanced Nutrition — Alkanes x375  TCV=4,875  168h
    MainScript.IME_JobPool_T2[50] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[50].resourceName  = "Alkanes"
    MainScript.IME_JobPool_T2[50].companyName   = "Advanced Nutrition"
    MainScript.IME_JobPool_T2[50].companyIndex  = 1
    MainScript.IME_JobPool_T2[50].quantity      = 375
    MainScript.IME_JobPool_T2[50].baseValue     = 13
    MainScript.IME_JobPool_T2[50].deadlineHours = 168
    MainScript.IME_JobPool_T2[50].rarity        = "Uncommon"

    ; [ 51] Xenofresh Fisheries — Alkanes x375  TCV=4,875  168h
    MainScript.IME_JobPool_T2[51] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[51].resourceName  = "Alkanes"
    MainScript.IME_JobPool_T2[51].companyName   = "Xenofresh Fisheries"
    MainScript.IME_JobPool_T2[51].companyIndex  = 47
    MainScript.IME_JobPool_T2[51].quantity      = 375
    MainScript.IME_JobPool_T2[51].baseValue     = 13
    MainScript.IME_JobPool_T2[51].deadlineHours = 168
    MainScript.IME_JobPool_T2[51].rarity        = "Uncommon"

    ; [ 52] Reliant Medical — Amino Acids x500  TCV=5,000  252h
    MainScript.IME_JobPool_T2[52] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[52].resourceName  = "Amino Acids"
    MainScript.IME_JobPool_T2[52].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T2[52].companyIndex  = 36
    MainScript.IME_JobPool_T2[52].quantity      = 500
    MainScript.IME_JobPool_T2[52].baseValue     = 10
    MainScript.IME_JobPool_T2[52].deadlineHours = 252
    MainScript.IME_JobPool_T2[52].rarity        = "Rare"

    ; [ 53] Ryujin — Argon x1000  TCV=5,000  151h
    MainScript.IME_JobPool_T2[53] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[53].resourceName  = "Argon"
    MainScript.IME_JobPool_T2[53].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[53].companyIndex  = 37
    MainScript.IME_JobPool_T2[53].quantity      = 1000
    MainScript.IME_JobPool_T2[53].baseValue     = 5
    MainScript.IME_JobPool_T2[53].deadlineHours = 151
    MainScript.IME_JobPool_T2[53].rarity        = "Common"

    ; [ 54] Allied Armaments — Copper x500  TCV=5,000  126h
    MainScript.IME_JobPool_T2[54] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[54].resourceName  = "Copper"
    MainScript.IME_JobPool_T2[54].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T2[54].companyIndex  = 2
    MainScript.IME_JobPool_T2[54].quantity      = 500
    MainScript.IME_JobPool_T2[54].baseValue     = 10
    MainScript.IME_JobPool_T2[54].deadlineHours = 126
    MainScript.IME_JobPool_T2[54].rarity        = "Common"

    ; [ 55] Axion Energy — Copper x500  TCV=5,000  126h
    MainScript.IME_JobPool_T2[55] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[55].resourceName  = "Copper"
    MainScript.IME_JobPool_T2[55].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[55].companyIndex  = 7
    MainScript.IME_JobPool_T2[55].quantity      = 500
    MainScript.IME_JobPool_T2[55].baseValue     = 10
    MainScript.IME_JobPool_T2[55].deadlineHours = 126
    MainScript.IME_JobPool_T2[55].rarity        = "Common"

    ; [ 56] Combatech — Copper x500  TCV=5,000  126h
    MainScript.IME_JobPool_T2[56] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[56].resourceName  = "Copper"
    MainScript.IME_JobPool_T2[56].companyName   = "Combatech"
    MainScript.IME_JobPool_T2[56].companyIndex  = 13
    MainScript.IME_JobPool_T2[56].quantity      = 500
    MainScript.IME_JobPool_T2[56].baseValue     = 10
    MainScript.IME_JobPool_T2[56].deadlineHours = 126
    MainScript.IME_JobPool_T2[56].rarity        = "Common"

    ; [ 57] Kore Kinetics — Copper x500  TCV=5,000  126h
    MainScript.IME_JobPool_T2[57] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[57].resourceName  = "Copper"
    MainScript.IME_JobPool_T2[57].companyName   = "Kore Kinetics"
    MainScript.IME_JobPool_T2[57].companyIndex  = 26
    MainScript.IME_JobPool_T2[57].quantity      = 500
    MainScript.IME_JobPool_T2[57].baseValue     = 10
    MainScript.IME_JobPool_T2[57].deadlineHours = 126
    MainScript.IME_JobPool_T2[57].rarity        = "Common"

    ; [ 58] Ryujin — Copper x500  TCV=5,000  126h
    MainScript.IME_JobPool_T2[58] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[58].resourceName  = "Copper"
    MainScript.IME_JobPool_T2[58].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[58].companyIndex  = 37
    MainScript.IME_JobPool_T2[58].quantity      = 500
    MainScript.IME_JobPool_T2[58].baseValue     = 10
    MainScript.IME_JobPool_T2[58].deadlineHours = 126
    MainScript.IME_JobPool_T2[58].rarity        = "Common"

    ; [ 59] Nova Galactic — Europium x125  TCV=5,000  294h
    MainScript.IME_JobPool_T2[59] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[59].resourceName  = "Europium"
    MainScript.IME_JobPool_T2[59].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T2[59].companyIndex  = 32
    MainScript.IME_JobPool_T2[59].quantity      = 125
    MainScript.IME_JobPool_T2[59].baseValue     = 40
    MainScript.IME_JobPool_T2[59].deadlineHours = 294
    MainScript.IME_JobPool_T2[59].rarity        = "Exotic"

    ; [ 60] Reladyne — Europium x125  TCV=5,000  294h
    MainScript.IME_JobPool_T2[60] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[60].resourceName  = "Europium"
    MainScript.IME_JobPool_T2[60].companyName   = "Reladyne"
    MainScript.IME_JobPool_T2[60].companyIndex  = 35
    MainScript.IME_JobPool_T2[60].quantity      = 125
    MainScript.IME_JobPool_T2[60].baseValue     = 40
    MainScript.IME_JobPool_T2[60].deadlineHours = 294
    MainScript.IME_JobPool_T2[60].rarity        = "Exotic"

    ; [ 61] Vanguard — Europium x125  TCV=5,000  294h
    MainScript.IME_JobPool_T2[61] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[61].resourceName  = "Europium"
    MainScript.IME_JobPool_T2[61].companyName   = "Vanguard"
    MainScript.IME_JobPool_T2[61].companyIndex  = 46
    MainScript.IME_JobPool_T2[61].quantity      = 125
    MainScript.IME_JobPool_T2[61].baseValue     = 40
    MainScript.IME_JobPool_T2[61].deadlineHours = 294
    MainScript.IME_JobPool_T2[61].rarity        = "Exotic"

    ; [ 62] Allied Armaments — Lead x500  TCV=5,000  126h
    MainScript.IME_JobPool_T2[62] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[62].resourceName  = "Lead"
    MainScript.IME_JobPool_T2[62].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T2[62].companyIndex  = 2
    MainScript.IME_JobPool_T2[62].quantity      = 500
    MainScript.IME_JobPool_T2[62].baseValue     = 10
    MainScript.IME_JobPool_T2[62].deadlineHours = 126
    MainScript.IME_JobPool_T2[62].rarity        = "Common"

    ; [ 63] Combatech — Lead x500  TCV=5,000  126h
    MainScript.IME_JobPool_T2[63] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[63].resourceName  = "Lead"
    MainScript.IME_JobPool_T2[63].companyName   = "Combatech"
    MainScript.IME_JobPool_T2[63].companyIndex  = 13
    MainScript.IME_JobPool_T2[63].quantity      = 500
    MainScript.IME_JobPool_T2[63].baseValue     = 10
    MainScript.IME_JobPool_T2[63].deadlineHours = 126
    MainScript.IME_JobPool_T2[63].rarity        = "Common"

    ; [ 64] Axion Energy — Neodymium x250  TCV=5,000  210h
    MainScript.IME_JobPool_T2[64] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[64].resourceName  = "Neodymium"
    MainScript.IME_JobPool_T2[64].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[64].companyIndex  = 7
    MainScript.IME_JobPool_T2[64].quantity      = 250
    MainScript.IME_JobPool_T2[64].baseValue     = 20
    MainScript.IME_JobPool_T2[64].deadlineHours = 210
    MainScript.IME_JobPool_T2[64].rarity        = "Rare"

    ; [ 65] Ryujin — Neodymium x250  TCV=5,000  210h
    MainScript.IME_JobPool_T2[65] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[65].resourceName  = "Neodymium"
    MainScript.IME_JobPool_T2[65].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[65].companyIndex  = 37
    MainScript.IME_JobPool_T2[65].quantity      = 250
    MainScript.IME_JobPool_T2[65].baseValue     = 20
    MainScript.IME_JobPool_T2[65].deadlineHours = 210
    MainScript.IME_JobPool_T2[65].rarity        = "Rare"

    ; [ 66] Combatech — Nickel x500  TCV=5,000  126h
    MainScript.IME_JobPool_T2[66] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[66].resourceName  = "Nickel"
    MainScript.IME_JobPool_T2[66].companyName   = "Combatech"
    MainScript.IME_JobPool_T2[66].companyIndex  = 13
    MainScript.IME_JobPool_T2[66].quantity      = 500
    MainScript.IME_JobPool_T2[66].baseValue     = 10
    MainScript.IME_JobPool_T2[66].deadlineHours = 126
    MainScript.IME_JobPool_T2[66].rarity        = "Common"

    ; [ 67] Advanced Nutrition — Nutrient x1000  TCV=5,000  151h
    MainScript.IME_JobPool_T2[67] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[67].resourceName  = "Nutrient"
    MainScript.IME_JobPool_T2[67].companyName   = "Advanced Nutrition"
    MainScript.IME_JobPool_T2[67].companyIndex  = 1
    MainScript.IME_JobPool_T2[67].quantity      = 1000
    MainScript.IME_JobPool_T2[67].baseValue     = 5
    MainScript.IME_JobPool_T2[67].deadlineHours = 151
    MainScript.IME_JobPool_T2[67].rarity        = "Common"

    ; [ 68] Arc Might — Polymer x250  TCV=5,000  353h
    MainScript.IME_JobPool_T2[68] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[68].resourceName  = "Polymer"
    MainScript.IME_JobPool_T2[68].companyName   = "Arc Might"
    MainScript.IME_JobPool_T2[68].companyIndex  = 4
    MainScript.IME_JobPool_T2[68].quantity      = 250
    MainScript.IME_JobPool_T2[68].baseValue     = 20
    MainScript.IME_JobPool_T2[68].deadlineHours = 353
    MainScript.IME_JobPool_T2[68].rarity        = "Exotic"

    ; [ 69] Advanced Nutrition — Stimulant x250  TCV=5,000  353h
    MainScript.IME_JobPool_T2[69] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[69].resourceName  = "Stimulant"
    MainScript.IME_JobPool_T2[69].companyName   = "Advanced Nutrition"
    MainScript.IME_JobPool_T2[69].companyIndex  = 1
    MainScript.IME_JobPool_T2[69].quantity      = 250
    MainScript.IME_JobPool_T2[69].baseValue     = 20
    MainScript.IME_JobPool_T2[69].deadlineHours = 353
    MainScript.IME_JobPool_T2[69].rarity        = "Exotic"

    ; [ 70] Reliant Medical — Stimulant x250  TCV=5,000  353h
    MainScript.IME_JobPool_T2[70] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[70].resourceName  = "Stimulant"
    MainScript.IME_JobPool_T2[70].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T2[70].companyIndex  = 36
    MainScript.IME_JobPool_T2[70].quantity      = 250
    MainScript.IME_JobPool_T2[70].baseValue     = 20
    MainScript.IME_JobPool_T2[70].deadlineHours = 353
    MainScript.IME_JobPool_T2[70].rarity        = "Exotic"

    ; [ 71] Celtcorp — Zero Wire x100  TCV=5,200  126h
    MainScript.IME_JobPool_T2[71] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[71].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T2[71].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T2[71].companyIndex  = 9
    MainScript.IME_JobPool_T2[71].quantity      = 100
    MainScript.IME_JobPool_T2[71].baseValue     = 52
    MainScript.IME_JobPool_T2[71].deadlineHours = 126
    MainScript.IME_JobPool_T2[71].rarity        = "Common"

    ; [ 72] Combatech — Zero Wire x100  TCV=5,200  126h
    MainScript.IME_JobPool_T2[72] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[72].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T2[72].companyName   = "Combatech"
    MainScript.IME_JobPool_T2[72].companyIndex  = 13
    MainScript.IME_JobPool_T2[72].quantity      = 100
    MainScript.IME_JobPool_T2[72].baseValue     = 52
    MainScript.IME_JobPool_T2[72].deadlineHours = 126
    MainScript.IME_JobPool_T2[72].rarity        = "Common"

    ; [ 73] Ryujin — Zero Wire x100  TCV=5,200  126h
    MainScript.IME_JobPool_T2[73] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[73].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T2[73].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[73].companyIndex  = 37
    MainScript.IME_JobPool_T2[73].quantity      = 100
    MainScript.IME_JobPool_T2[73].baseValue     = 52
    MainScript.IME_JobPool_T2[73].deadlineHours = 126
    MainScript.IME_JobPool_T2[73].rarity        = "Common"

    ; [ 74] Celtcorp — Chlorosilanes x375  TCV=5,250  168h
    MainScript.IME_JobPool_T2[74] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[74].resourceName  = "Chlorosilanes"
    MainScript.IME_JobPool_T2[74].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T2[74].companyIndex  = 9
    MainScript.IME_JobPool_T2[74].quantity      = 375
    MainScript.IME_JobPool_T2[74].baseValue     = 14
    MainScript.IME_JobPool_T2[74].deadlineHours = 168
    MainScript.IME_JobPool_T2[74].rarity        = "Uncommon"

    ; [ 75] Son — Chlorosilanes x375  TCV=5,250  168h
    MainScript.IME_JobPool_T2[75] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[75].resourceName  = "Chlorosilanes"
    MainScript.IME_JobPool_T2[75].companyName   = "Son"
    MainScript.IME_JobPool_T2[75].companyIndex  = 42
    MainScript.IME_JobPool_T2[75].quantity      = 375
    MainScript.IME_JobPool_T2[75].baseValue     = 14
    MainScript.IME_JobPool_T2[75].deadlineHours = 168
    MainScript.IME_JobPool_T2[75].rarity        = "Uncommon"

    ; [ 76] Ballistics Solutions — Iridium x375  TCV=5,250  168h
    MainScript.IME_JobPool_T2[76] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[76].resourceName  = "Iridium"
    MainScript.IME_JobPool_T2[76].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T2[76].companyIndex  = 8
    MainScript.IME_JobPool_T2[76].quantity      = 375
    MainScript.IME_JobPool_T2[76].baseValue     = 14
    MainScript.IME_JobPool_T2[76].deadlineHours = 168
    MainScript.IME_JobPool_T2[76].rarity        = "Uncommon"

    ; [ 77] Allied Armaments — Microsecond Regulator x25  TCV=5,300  294h
    MainScript.IME_JobPool_T2[77] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[77].resourceName  = "Microsecond Regulator"
    MainScript.IME_JobPool_T2[77].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T2[77].companyIndex  = 2
    MainScript.IME_JobPool_T2[77].quantity      = 25
    MainScript.IME_JobPool_T2[77].baseValue     = 212
    MainScript.IME_JobPool_T2[77].deadlineHours = 294
    MainScript.IME_JobPool_T2[77].rarity        = "Exotic"

    ; [ 78] Combatech — Microsecond Regulator x25  TCV=5,300  294h
    MainScript.IME_JobPool_T2[78] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[78].resourceName  = "Microsecond Regulator"
    MainScript.IME_JobPool_T2[78].companyName   = "Combatech"
    MainScript.IME_JobPool_T2[78].companyIndex  = 13
    MainScript.IME_JobPool_T2[78].quantity      = 25
    MainScript.IME_JobPool_T2[78].baseValue     = 212
    MainScript.IME_JobPool_T2[78].deadlineHours = 294
    MainScript.IME_JobPool_T2[78].rarity        = "Exotic"

    ; [ 79] Enhance — Aromatic x500  TCV=5,500  252h
    MainScript.IME_JobPool_T2[79] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[79].resourceName  = "Aromatic"
    MainScript.IME_JobPool_T2[79].companyName   = "Enhance"
    MainScript.IME_JobPool_T2[79].companyIndex  = 19
    MainScript.IME_JobPool_T2[79].quantity      = 500
    MainScript.IME_JobPool_T2[79].baseValue     = 11
    MainScript.IME_JobPool_T2[79].deadlineHours = 252
    MainScript.IME_JobPool_T2[79].rarity        = "Rare"

    ; [ 80] Reliant Medical — Mercury x250  TCV=5,500  210h
    MainScript.IME_JobPool_T2[80] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[80].resourceName  = "Mercury"
    MainScript.IME_JobPool_T2[80].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T2[80].companyIndex  = 36
    MainScript.IME_JobPool_T2[80].quantity      = 250
    MainScript.IME_JobPool_T2[80].baseValue     = 22
    MainScript.IME_JobPool_T2[80].deadlineHours = 210
    MainScript.IME_JobPool_T2[80].rarity        = "Rare"

    ; [ 81] Vanguard — Monopropellant x75  TCV=5,700  168h
    MainScript.IME_JobPool_T2[81] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[81].resourceName  = "Monopropellant"
    MainScript.IME_JobPool_T2[81].companyName   = "Vanguard"
    MainScript.IME_JobPool_T2[81].companyIndex  = 46
    MainScript.IME_JobPool_T2[81].quantity      = 75
    MainScript.IME_JobPool_T2[81].baseValue     = 76
    MainScript.IME_JobPool_T2[81].deadlineHours = 168
    MainScript.IME_JobPool_T2[81].rarity        = "Uncommon"

    ; [ 82] Panoptes — Ionic Liquids x250  TCV=5,750  353h
    MainScript.IME_JobPool_T2[82] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[82].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T2[82].companyName   = "Panoptes"
    MainScript.IME_JobPool_T2[82].companyIndex  = 33
    MainScript.IME_JobPool_T2[82].quantity      = 250
    MainScript.IME_JobPool_T2[82].baseValue     = 23
    MainScript.IME_JobPool_T2[82].deadlineHours = 353
    MainScript.IME_JobPool_T2[82].rarity        = "Exotic"

    ; [ 83] Argos Extractors — Tantalum x250  TCV=5,750  210h
    MainScript.IME_JobPool_T2[83] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[83].resourceName  = "Tantalum"
    MainScript.IME_JobPool_T2[83].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T2[83].companyIndex  = 5
    MainScript.IME_JobPool_T2[83].quantity      = 250
    MainScript.IME_JobPool_T2[83].baseValue     = 23
    MainScript.IME_JobPool_T2[83].deadlineHours = 210
    MainScript.IME_JobPool_T2[83].rarity        = "Rare"

    ; [ 84] Muybridge Pharmaceuticals — Immunostimulant x100  TCV=5,800  504h
    MainScript.IME_JobPool_T2[84] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[84].resourceName  = "Immunostimulant"
    MainScript.IME_JobPool_T2[84].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T2[84].companyIndex  = 30
    MainScript.IME_JobPool_T2[84].quantity      = 100
    MainScript.IME_JobPool_T2[84].baseValue     = 58
    MainScript.IME_JobPool_T2[84].deadlineHours = 504
    MainScript.IME_JobPool_T2[84].rarity        = "Unique"

    ; [ 85] Eit Clothiers — Luxury Textile x100  TCV=5,800  504h
    MainScript.IME_JobPool_T2[85] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[85].resourceName  = "Luxury Textile"
    MainScript.IME_JobPool_T2[85].companyName   = "Eit Clothiers"
    MainScript.IME_JobPool_T2[85].companyIndex  = 18
    MainScript.IME_JobPool_T2[85].quantity      = 100
    MainScript.IME_JobPool_T2[85].baseValue     = 58
    MainScript.IME_JobPool_T2[85].deadlineHours = 504
    MainScript.IME_JobPool_T2[85].rarity        = "Unique"

    ; [ 86] Generdyne Industries — Vytinium x50  TCV=5,800  420h
    MainScript.IME_JobPool_T2[86] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[86].resourceName  = "Vytinium"
    MainScript.IME_JobPool_T2[86].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T2[86].companyIndex  = 22
    MainScript.IME_JobPool_T2[86].quantity      = 50
    MainScript.IME_JobPool_T2[86].baseValue     = 116
    MainScript.IME_JobPool_T2[86].deadlineHours = 420
    MainScript.IME_JobPool_T2[86].rarity        = "Unique"

    ; [ 87] Six Sisters — Austenitic Manifold x75  TCV=5,925  168h
    MainScript.IME_JobPool_T2[87] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[87].resourceName  = "Austenitic Manifold"
    MainScript.IME_JobPool_T2[87].companyName   = "Six Sisters"
    MainScript.IME_JobPool_T2[87].companyIndex  = 40
    MainScript.IME_JobPool_T2[87].quantity      = 75
    MainScript.IME_JobPool_T2[87].baseValue     = 79
    MainScript.IME_JobPool_T2[87].deadlineHours = 168
    MainScript.IME_JobPool_T2[87].rarity        = "Uncommon"

    ; [ 88] Ryujin — Adhesive x500  TCV=6,000  252h
    MainScript.IME_JobPool_T2[88] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[88].resourceName  = "Adhesive"
    MainScript.IME_JobPool_T2[88].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[88].companyIndex  = 37
    MainScript.IME_JobPool_T2[88].quantity      = 500
    MainScript.IME_JobPool_T2[88].baseValue     = 12
    MainScript.IME_JobPool_T2[88].deadlineHours = 252
    MainScript.IME_JobPool_T2[88].rarity        = "Rare"

    ; [ 89] Enhance — Analgesic x500  TCV=6,000  252h
    MainScript.IME_JobPool_T2[89] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[89].resourceName  = "Analgesic"
    MainScript.IME_JobPool_T2[89].companyName   = "Enhance"
    MainScript.IME_JobPool_T2[89].companyIndex  = 19
    MainScript.IME_JobPool_T2[89].quantity      = 500
    MainScript.IME_JobPool_T2[89].baseValue     = 12
    MainScript.IME_JobPool_T2[89].deadlineHours = 252
    MainScript.IME_JobPool_T2[89].rarity        = "Rare"

    ; [ 90] Muybridge Pharmaceuticals — Carboxylic Acids x500  TCV=6,000  252h
    MainScript.IME_JobPool_T2[90] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[90].resourceName  = "Carboxylic Acids"
    MainScript.IME_JobPool_T2[90].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T2[90].companyIndex  = 30
    MainScript.IME_JobPool_T2[90].quantity      = 500
    MainScript.IME_JobPool_T2[90].baseValue     = 12
    MainScript.IME_JobPool_T2[90].deadlineHours = 252
    MainScript.IME_JobPool_T2[90].rarity        = "Rare"

    ; [ 91] Muybridge Pharmaceuticals — Chlorine x1000  TCV=6,000  151h
    MainScript.IME_JobPool_T2[91] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[91].resourceName  = "Chlorine"
    MainScript.IME_JobPool_T2[91].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T2[91].companyIndex  = 30
    MainScript.IME_JobPool_T2[91].quantity      = 1000
    MainScript.IME_JobPool_T2[91].baseValue     = 6
    MainScript.IME_JobPool_T2[91].deadlineHours = 151
    MainScript.IME_JobPool_T2[91].rarity        = "Common"

    ; [ 92] Axion Energy — Gold x250  TCV=6,000  210h
    MainScript.IME_JobPool_T2[92] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[92].resourceName  = "Gold"
    MainScript.IME_JobPool_T2[92].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[92].companyIndex  = 7
    MainScript.IME_JobPool_T2[92].quantity      = 250
    MainScript.IME_JobPool_T2[92].baseValue     = 24
    MainScript.IME_JobPool_T2[92].deadlineHours = 210
    MainScript.IME_JobPool_T2[92].rarity        = "Rare"

    ; [ 93] Ryujin — Platinum x250  TCV=6,000  210h
    MainScript.IME_JobPool_T2[93] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[93].resourceName  = "Platinum"
    MainScript.IME_JobPool_T2[93].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[93].companyIndex  = 37
    MainScript.IME_JobPool_T2[93].quantity      = 250
    MainScript.IME_JobPool_T2[93].baseValue     = 24
    MainScript.IME_JobPool_T2[93].deadlineHours = 210
    MainScript.IME_JobPool_T2[93].rarity        = "Rare"

    ; [ 94] Nova Galactic — Sealant x1000  TCV=6,000  151h
    MainScript.IME_JobPool_T2[94] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[94].resourceName  = "Sealant"
    MainScript.IME_JobPool_T2[94].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T2[94].companyIndex  = 32
    MainScript.IME_JobPool_T2[94].quantity      = 1000
    MainScript.IME_JobPool_T2[94].baseValue     = 6
    MainScript.IME_JobPool_T2[94].deadlineHours = 151
    MainScript.IME_JobPool_T2[94].rarity        = "Common"

    ; [ 95] Advanced Nutrition — Sedative x500  TCV=6,000  252h
    MainScript.IME_JobPool_T2[95] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[95].resourceName  = "Sedative"
    MainScript.IME_JobPool_T2[95].companyName   = "Advanced Nutrition"
    MainScript.IME_JobPool_T2[95].companyIndex  = 1
    MainScript.IME_JobPool_T2[95].quantity      = 500
    MainScript.IME_JobPool_T2[95].baseValue     = 12
    MainScript.IME_JobPool_T2[95].deadlineHours = 252
    MainScript.IME_JobPool_T2[95].rarity        = "Rare"

    ; [ 96] Hopetech — Titanium x500  TCV=6,000  252h
    MainScript.IME_JobPool_T2[96] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[96].resourceName  = "Titanium"
    MainScript.IME_JobPool_T2[96].companyName   = "Hopetech"
    MainScript.IME_JobPool_T2[96].companyIndex  = 23
    MainScript.IME_JobPool_T2[96].quantity      = 500
    MainScript.IME_JobPool_T2[96].baseValue     = 12
    MainScript.IME_JobPool_T2[96].deadlineHours = 252
    MainScript.IME_JobPool_T2[96].rarity        = "Rare"

    ; [ 97] Nova Galactic — Titanium x500  TCV=6,000  252h
    MainScript.IME_JobPool_T2[97] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[97].resourceName  = "Titanium"
    MainScript.IME_JobPool_T2[97].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T2[97].companyIndex  = 32
    MainScript.IME_JobPool_T2[97].quantity      = 500
    MainScript.IME_JobPool_T2[97].baseValue     = 12
    MainScript.IME_JobPool_T2[97].deadlineHours = 252
    MainScript.IME_JobPool_T2[97].rarity        = "Rare"

    ; [ 98] Trident Luxury Lines — Titanium x500  TCV=6,000  252h
    MainScript.IME_JobPool_T2[98] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[98].resourceName  = "Titanium"
    MainScript.IME_JobPool_T2[98].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T2[98].companyIndex  = 45
    MainScript.IME_JobPool_T2[98].quantity      = 500
    MainScript.IME_JobPool_T2[98].baseValue     = 12
    MainScript.IME_JobPool_T2[98].deadlineHours = 252
    MainScript.IME_JobPool_T2[98].rarity        = "Rare"

    ; [ 99] Arc Might — Tungsten x375  TCV=6,000  168h
    MainScript.IME_JobPool_T2[99] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[99].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T2[99].companyName   = "Arc Might"
    MainScript.IME_JobPool_T2[99].companyIndex  = 4
    MainScript.IME_JobPool_T2[99].quantity      = 375
    MainScript.IME_JobPool_T2[99].baseValue     = 16
    MainScript.IME_JobPool_T2[99].deadlineHours = 168
    MainScript.IME_JobPool_T2[99].rarity        = "Uncommon"

    ; [100] Argos Extractors — Tungsten x375  TCV=6,000  168h
    MainScript.IME_JobPool_T2[100] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[100].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T2[100].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T2[100].companyIndex  = 5
    MainScript.IME_JobPool_T2[100].quantity      = 375
    MainScript.IME_JobPool_T2[100].baseValue     = 16
    MainScript.IME_JobPool_T2[100].deadlineHours = 168
    MainScript.IME_JobPool_T2[100].rarity        = "Uncommon"

    ; [101] Axion Energy — Tungsten x375  TCV=6,000  168h
    MainScript.IME_JobPool_T2[101] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[101].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T2[101].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[101].companyIndex  = 7
    MainScript.IME_JobPool_T2[101].quantity      = 375
    MainScript.IME_JobPool_T2[101].baseValue     = 16
    MainScript.IME_JobPool_T2[101].deadlineHours = 168
    MainScript.IME_JobPool_T2[101].rarity        = "Uncommon"

    ; [102] Consolidated Mining — Tungsten x375  TCV=6,000  168h
    MainScript.IME_JobPool_T2[102] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[102].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T2[102].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T2[102].companyIndex  = 14
    MainScript.IME_JobPool_T2[102].quantity      = 375
    MainScript.IME_JobPool_T2[102].baseValue     = 16
    MainScript.IME_JobPool_T2[102].deadlineHours = 168
    MainScript.IME_JobPool_T2[102].rarity        = "Uncommon"

    ; [103] Nova Galactic — Tungsten x375  TCV=6,000  168h
    MainScript.IME_JobPool_T2[103] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[103].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T2[103].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T2[103].companyIndex  = 32
    MainScript.IME_JobPool_T2[103].quantity      = 375
    MainScript.IME_JobPool_T2[103].baseValue     = 16
    MainScript.IME_JobPool_T2[103].deadlineHours = 168
    MainScript.IME_JobPool_T2[103].rarity        = "Uncommon"

    ; [104] Shinigami — Tungsten x375  TCV=6,000  168h
    MainScript.IME_JobPool_T2[104] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[104].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T2[104].companyName   = "Shinigami"
    MainScript.IME_JobPool_T2[104].companyIndex  = 39
    MainScript.IME_JobPool_T2[104].quantity      = 375
    MainScript.IME_JobPool_T2[104].baseValue     = 16
    MainScript.IME_JobPool_T2[104].deadlineHours = 168
    MainScript.IME_JobPool_T2[104].rarity        = "Uncommon"

    ; [105] Consolidated Mining — Vanadium x250  TCV=6,000  210h
    MainScript.IME_JobPool_T2[105] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[105].resourceName  = "Vanadium"
    MainScript.IME_JobPool_T2[105].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T2[105].companyIndex  = 14
    MainScript.IME_JobPool_T2[105].quantity      = 250
    MainScript.IME_JobPool_T2[105].baseValue     = 24
    MainScript.IME_JobPool_T2[105].deadlineHours = 210
    MainScript.IME_JobPool_T2[105].rarity        = "Rare"

    ; [106] Xiang — Tau Grade Rheostat x75  TCV=6,150  168h
    MainScript.IME_JobPool_T2[106] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[106].resourceName  = "Tau Grade Rheostat"
    MainScript.IME_JobPool_T2[106].companyName   = "Xiang"
    MainScript.IME_JobPool_T2[106].companyIndex  = 48
    MainScript.IME_JobPool_T2[106].quantity      = 75
    MainScript.IME_JobPool_T2[106].baseValue     = 82
    MainScript.IME_JobPool_T2[106].deadlineHours = 168
    MainScript.IME_JobPool_T2[106].rarity        = "Uncommon"

    ; [107] Ballistics Solutions — Caesium x250  TCV=6,250  353h
    MainScript.IME_JobPool_T2[107] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[107].resourceName  = "Caesium"
    MainScript.IME_JobPool_T2[107].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T2[107].companyIndex  = 8
    MainScript.IME_JobPool_T2[107].quantity      = 250
    MainScript.IME_JobPool_T2[107].baseValue     = 25
    MainScript.IME_JobPool_T2[107].deadlineHours = 353
    MainScript.IME_JobPool_T2[107].rarity        = "Exotic"

    ; [108] Shinigami — Caesium x250  TCV=6,250  353h
    MainScript.IME_JobPool_T2[108] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[108].resourceName  = "Caesium"
    MainScript.IME_JobPool_T2[108].companyName   = "Shinigami"
    MainScript.IME_JobPool_T2[108].companyIndex  = 39
    MainScript.IME_JobPool_T2[108].quantity      = 250
    MainScript.IME_JobPool_T2[108].baseValue     = 25
    MainScript.IME_JobPool_T2[108].deadlineHours = 353
    MainScript.IME_JobPool_T2[108].rarity        = "Exotic"

    ; [109] Vanguard — Palladium x250  TCV=6,250  353h
    MainScript.IME_JobPool_T2[109] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[109].resourceName  = "Palladium"
    MainScript.IME_JobPool_T2[109].companyName   = "Vanguard"
    MainScript.IME_JobPool_T2[109].companyIndex  = 46
    MainScript.IME_JobPool_T2[109].quantity      = 250
    MainScript.IME_JobPool_T2[109].baseValue     = 25
    MainScript.IME_JobPool_T2[109].deadlineHours = 353
    MainScript.IME_JobPool_T2[109].rarity        = "Exotic"

    ; [110] Muybridge Pharmaceuticals — Memory Substrate x100  TCV=6,500  504h
    MainScript.IME_JobPool_T2[110] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[110].resourceName  = "Memory Substrate"
    MainScript.IME_JobPool_T2[110].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T2[110].companyIndex  = 30
    MainScript.IME_JobPool_T2[110].quantity      = 100
    MainScript.IME_JobPool_T2[110].baseValue     = 65
    MainScript.IME_JobPool_T2[110].deadlineHours = 504
    MainScript.IME_JobPool_T2[110].rarity        = "Unique"

    ; [111] Advanced Nutrition — Membrane x750  TCV=6,750  202h
    MainScript.IME_JobPool_T2[111] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[111].resourceName  = "Membrane"
    MainScript.IME_JobPool_T2[111].companyName   = "Advanced Nutrition"
    MainScript.IME_JobPool_T2[111].companyIndex  = 1
    MainScript.IME_JobPool_T2[111].quantity      = 750
    MainScript.IME_JobPool_T2[111].baseValue     = 9
    MainScript.IME_JobPool_T2[111].deadlineHours = 202
    MainScript.IME_JobPool_T2[111].rarity        = "Uncommon"

    ; [112] Muybridge Pharmaceuticals — Membrane x750  TCV=6,750  202h
    MainScript.IME_JobPool_T2[112] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[112].resourceName  = "Membrane"
    MainScript.IME_JobPool_T2[112].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T2[112].companyIndex  = 30
    MainScript.IME_JobPool_T2[112].quantity      = 750
    MainScript.IME_JobPool_T2[112].baseValue     = 9
    MainScript.IME_JobPool_T2[112].deadlineHours = 202
    MainScript.IME_JobPool_T2[112].rarity        = "Uncommon"

    ; [113] Ryujin — Xenon x250  TCV=6,750  353h
    MainScript.IME_JobPool_T2[113] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[113].resourceName  = "Xenon"
    MainScript.IME_JobPool_T2[113].companyName   = "Ryujin"
    MainScript.IME_JobPool_T2[113].companyIndex  = 37
    MainScript.IME_JobPool_T2[113].quantity      = 250
    MainScript.IME_JobPool_T2[113].baseValue     = 27
    MainScript.IME_JobPool_T2[113].deadlineHours = 353
    MainScript.IME_JobPool_T2[113].rarity        = "Exotic"

    ; [114] Dogstar — Aluminum x1000  TCV=7,000  151h
    MainScript.IME_JobPool_T2[114] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[114].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[114].companyName   = "Dogstar"
    MainScript.IME_JobPool_T2[114].companyIndex  = 17
    MainScript.IME_JobPool_T2[114].quantity      = 1000
    MainScript.IME_JobPool_T2[114].baseValue     = 7
    MainScript.IME_JobPool_T2[114].deadlineHours = 151
    MainScript.IME_JobPool_T2[114].rarity        = "Common"

    ; [115] Nova Galactic — Aluminum x1000  TCV=7,000  151h
    MainScript.IME_JobPool_T2[115] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[115].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[115].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T2[115].companyIndex  = 32
    MainScript.IME_JobPool_T2[115].quantity      = 1000
    MainScript.IME_JobPool_T2[115].baseValue     = 7
    MainScript.IME_JobPool_T2[115].deadlineHours = 151
    MainScript.IME_JobPool_T2[115].rarity        = "Common"

    ; [116] Panoptes — Aluminum x1000  TCV=7,000  151h
    MainScript.IME_JobPool_T2[116] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[116].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[116].companyName   = "Panoptes"
    MainScript.IME_JobPool_T2[116].companyIndex  = 33
    MainScript.IME_JobPool_T2[116].quantity      = 1000
    MainScript.IME_JobPool_T2[116].baseValue     = 7
    MainScript.IME_JobPool_T2[116].deadlineHours = 151
    MainScript.IME_JobPool_T2[116].rarity        = "Common"

    ; [117] Protectorate Systems — Aluminum x1000  TCV=7,000  151h
    MainScript.IME_JobPool_T2[117] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[117].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[117].companyName   = "Protectorate Systems"
    MainScript.IME_JobPool_T2[117].companyIndex  = 34
    MainScript.IME_JobPool_T2[117].quantity      = 1000
    MainScript.IME_JobPool_T2[117].baseValue     = 7
    MainScript.IME_JobPool_T2[117].deadlineHours = 151
    MainScript.IME_JobPool_T2[117].rarity        = "Common"

    ; [118] Sextant Shield Systems — Aluminum x1000  TCV=7,000  151h
    MainScript.IME_JobPool_T2[118] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[118].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T2[118].companyName   = "Sextant Shield Systems"
    MainScript.IME_JobPool_T2[118].companyIndex  = 38
    MainScript.IME_JobPool_T2[118].quantity      = 1000
    MainScript.IME_JobPool_T2[118].baseValue     = 7
    MainScript.IME_JobPool_T2[118].deadlineHours = 151
    MainScript.IME_JobPool_T2[118].rarity        = "Common"

    ; [119] Arc Might — Dysprosium x125  TCV=7,000  294h
    MainScript.IME_JobPool_T2[119] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[119].resourceName  = "Dysprosium"
    MainScript.IME_JobPool_T2[119].companyName   = "Arc Might"
    MainScript.IME_JobPool_T2[119].companyIndex  = 4
    MainScript.IME_JobPool_T2[119].quantity      = 125
    MainScript.IME_JobPool_T2[119].baseValue     = 56
    MainScript.IME_JobPool_T2[119].deadlineHours = 294
    MainScript.IME_JobPool_T2[119].rarity        = "Exotic"

    ; [120] Axion Energy — Dysprosium x125  TCV=7,000  294h
    MainScript.IME_JobPool_T2[120] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[120].resourceName  = "Dysprosium"
    MainScript.IME_JobPool_T2[120].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T2[120].companyIndex  = 7
    MainScript.IME_JobPool_T2[120].quantity      = 125
    MainScript.IME_JobPool_T2[120].baseValue     = 56
    MainScript.IME_JobPool_T2[120].deadlineHours = 294
    MainScript.IME_JobPool_T2[120].rarity        = "Exotic"

    ; [121] Reliant Medical — Hallucinogen x500  TCV=7,000  252h
    MainScript.IME_JobPool_T2[121] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[121].resourceName  = "Hallucinogen"
    MainScript.IME_JobPool_T2[121].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T2[121].companyIndex  = 36
    MainScript.IME_JobPool_T2[121].quantity      = 500
    MainScript.IME_JobPool_T2[121].baseValue     = 14
    MainScript.IME_JobPool_T2[121].deadlineHours = 252
    MainScript.IME_JobPool_T2[121].rarity        = "Rare"

    ; [122] Celtcorp — Lithium x500  TCV=7,000  252h
    MainScript.IME_JobPool_T2[122] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[122].resourceName  = "Lithium"
    MainScript.IME_JobPool_T2[122].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T2[122].companyIndex  = 9
    MainScript.IME_JobPool_T2[122].quantity      = 500
    MainScript.IME_JobPool_T2[122].baseValue     = 14
    MainScript.IME_JobPool_T2[122].deadlineHours = 252
    MainScript.IME_JobPool_T2[122].rarity        = "Rare"

    ; [123] Stroud Eklund — Lithium x500  TCV=7,000  252h
    MainScript.IME_JobPool_T2[123] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[123].resourceName  = "Lithium"
    MainScript.IME_JobPool_T2[123].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T2[123].companyIndex  = 43
    MainScript.IME_JobPool_T2[123].quantity      = 500
    MainScript.IME_JobPool_T2[123].baseValue     = 14
    MainScript.IME_JobPool_T2[123].deadlineHours = 252
    MainScript.IME_JobPool_T2[123].rarity        = "Rare"

    ; [124] Taiyo Astroneering — Lithium x500  TCV=7,000  252h
    MainScript.IME_JobPool_T2[124] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[124].resourceName  = "Lithium"
    MainScript.IME_JobPool_T2[124].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T2[124].companyIndex  = 44
    MainScript.IME_JobPool_T2[124].quantity      = 500
    MainScript.IME_JobPool_T2[124].baseValue     = 14
    MainScript.IME_JobPool_T2[124].deadlineHours = 252
    MainScript.IME_JobPool_T2[124].rarity        = "Rare"

    ; [125] Trident Luxury Lines — Lithium x500  TCV=7,000  252h
    MainScript.IME_JobPool_T2[125] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[125].resourceName  = "Lithium"
    MainScript.IME_JobPool_T2[125].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T2[125].companyIndex  = 45
    MainScript.IME_JobPool_T2[125].quantity      = 500
    MainScript.IME_JobPool_T2[125].baseValue     = 14
    MainScript.IME_JobPool_T2[125].deadlineHours = 252
    MainScript.IME_JobPool_T2[125].rarity        = "Rare"

    ; [126] Hopetech — Uranium x500  TCV=7,000  126h
    MainScript.IME_JobPool_T2[126] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[126].resourceName  = "Uranium"
    MainScript.IME_JobPool_T2[126].companyName   = "Hopetech"
    MainScript.IME_JobPool_T2[126].companyIndex  = 23
    MainScript.IME_JobPool_T2[126].quantity      = 500
    MainScript.IME_JobPool_T2[126].baseValue     = 14
    MainScript.IME_JobPool_T2[126].deadlineHours = 126
    MainScript.IME_JobPool_T2[126].rarity        = "Common"

    ; [127] Nova Galactic — Uranium x500  TCV=7,000  126h
    MainScript.IME_JobPool_T2[127] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T2[127].resourceName  = "Uranium"
    MainScript.IME_JobPool_T2[127].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T2[127].companyIndex  = 32
    MainScript.IME_JobPool_T2[127].quantity      = 500
    MainScript.IME_JobPool_T2[127].baseValue     = 14
    MainScript.IME_JobPool_T2[127].deadlineHours = 126
    MainScript.IME_JobPool_T2[127].rarity        = "Common"

EndFunction

; ── TIER 3 (128 jobs | TCV 7,450 - 24,300) ──────────────────────────────────────────
Function InitTier3Jobs()
    MainScript.IME_Tier3_JobCount = 128
    MainScript.IME_JobPool_T3 = new IME_MainQuestScript:JobTemplate[128]

    ; [  0] Axion Energy — Semimetal Wafer x50  TCV=7,450  210h
    MainScript.IME_JobPool_T3[0] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[0].resourceName  = "Semimetal Wafer"
    MainScript.IME_JobPool_T3[0].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T3[0].companyIndex  = 7
    MainScript.IME_JobPool_T3[0].quantity      = 50
    MainScript.IME_JobPool_T3[0].baseValue     = 149
    MainScript.IME_JobPool_T3[0].deadlineHours = 210
    MainScript.IME_JobPool_T3[0].rarity        = "Rare"

    ; [  1] Celtcorp — Semimetal Wafer x50  TCV=7,450  210h
    MainScript.IME_JobPool_T3[1] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[1].resourceName  = "Semimetal Wafer"
    MainScript.IME_JobPool_T3[1].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T3[1].companyIndex  = 9
    MainScript.IME_JobPool_T3[1].quantity      = 50
    MainScript.IME_JobPool_T3[1].baseValue     = 149
    MainScript.IME_JobPool_T3[1].deadlineHours = 210
    MainScript.IME_JobPool_T3[1].rarity        = "Rare"

    ; [  2] Ryujin — Antimicrobial x750  TCV=7,500  202h
    MainScript.IME_JobPool_T3[2] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[2].resourceName  = "Antimicrobial"
    MainScript.IME_JobPool_T3[2].companyName   = "Ryujin"
    MainScript.IME_JobPool_T3[2].companyIndex  = 37
    MainScript.IME_JobPool_T3[2].quantity      = 750
    MainScript.IME_JobPool_T3[2].baseValue     = 10
    MainScript.IME_JobPool_T3[2].deadlineHours = 202
    MainScript.IME_JobPool_T3[2].rarity        = "Uncommon"

    ; [  3] Nautilus — Antimony x250  TCV=7,500  353h
    MainScript.IME_JobPool_T3[3] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[3].resourceName  = "Antimony"
    MainScript.IME_JobPool_T3[3].companyName   = "Nautilus"
    MainScript.IME_JobPool_T3[3].companyIndex  = 31
    MainScript.IME_JobPool_T3[3].quantity      = 250
    MainScript.IME_JobPool_T3[3].baseValue     = 30
    MainScript.IME_JobPool_T3[3].deadlineHours = 353
    MainScript.IME_JobPool_T3[3].rarity        = "Exotic"

    ; [  4] Vanguard — Antimony x250  TCV=7,500  353h
    MainScript.IME_JobPool_T3[4] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[4].resourceName  = "Antimony"
    MainScript.IME_JobPool_T3[4].companyName   = "Vanguard"
    MainScript.IME_JobPool_T3[4].companyIndex  = 46
    MainScript.IME_JobPool_T3[4].quantity      = 250
    MainScript.IME_JobPool_T3[4].baseValue     = 30
    MainScript.IME_JobPool_T3[4].deadlineHours = 353
    MainScript.IME_JobPool_T3[4].rarity        = "Exotic"

    ; [  5] Celtcorp — Silver x375  TCV=7,500  168h
    MainScript.IME_JobPool_T3[5] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[5].resourceName  = "Silver"
    MainScript.IME_JobPool_T3[5].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T3[5].companyIndex  = 9
    MainScript.IME_JobPool_T3[5].quantity      = 375
    MainScript.IME_JobPool_T3[5].baseValue     = 20
    MainScript.IME_JobPool_T3[5].deadlineHours = 168
    MainScript.IME_JobPool_T3[5].rarity        = "Uncommon"

    ; [  6] Deimos Staryards — Iron x1000  TCV=8,000  151h
    MainScript.IME_JobPool_T3[6] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[6].resourceName  = "Iron"
    MainScript.IME_JobPool_T3[6].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T3[6].companyIndex  = 16
    MainScript.IME_JobPool_T3[6].quantity      = 1000
    MainScript.IME_JobPool_T3[6].baseValue     = 8
    MainScript.IME_JobPool_T3[6].deadlineHours = 151
    MainScript.IME_JobPool_T3[6].rarity        = "Common"

    ; [  7] Generdyne Industries — Plutonium x125  TCV=8,000  294h
    MainScript.IME_JobPool_T3[7] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[7].resourceName  = "Plutonium"
    MainScript.IME_JobPool_T3[7].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T3[7].companyIndex  = 22
    MainScript.IME_JobPool_T3[7].quantity      = 125
    MainScript.IME_JobPool_T3[7].baseValue     = 64
    MainScript.IME_JobPool_T3[7].deadlineHours = 294
    MainScript.IME_JobPool_T3[7].rarity        = "Exotic"

    ; [  8] Chunks — Toxin x1000  TCV=8,000  151h
    MainScript.IME_JobPool_T3[8] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[8].resourceName  = "Toxin"
    MainScript.IME_JobPool_T3[8].companyName   = "Chunks"
    MainScript.IME_JobPool_T3[8].companyIndex  = 12
    MainScript.IME_JobPool_T3[8].quantity      = 1000
    MainScript.IME_JobPool_T3[8].baseValue     = 8
    MainScript.IME_JobPool_T3[8].deadlineHours = 151
    MainScript.IME_JobPool_T3[8].rarity        = "Common"

    ; [  9] Ryujin — Toxin x1000  TCV=8,000  151h
    MainScript.IME_JobPool_T3[9] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[9].resourceName  = "Toxin"
    MainScript.IME_JobPool_T3[9].companyName   = "Ryujin"
    MainScript.IME_JobPool_T3[9].companyIndex  = 37
    MainScript.IME_JobPool_T3[9].quantity      = 1000
    MainScript.IME_JobPool_T3[9].baseValue     = 8
    MainScript.IME_JobPool_T3[9].deadlineHours = 151
    MainScript.IME_JobPool_T3[9].rarity        = "Common"

    ; [ 10] Eit Clothiers — Ornamental Material x750  TCV=8,250  202h
    MainScript.IME_JobPool_T3[10] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[10].resourceName  = "Ornamental Material"
    MainScript.IME_JobPool_T3[10].companyName   = "Eit Clothiers"
    MainScript.IME_JobPool_T3[10].companyIndex  = 18
    MainScript.IME_JobPool_T3[10].quantity      = 750
    MainScript.IME_JobPool_T3[10].baseValue     = 11
    MainScript.IME_JobPool_T3[10].deadlineHours = 202
    MainScript.IME_JobPool_T3[10].rarity        = "Uncommon"

    ; [ 11] Advanced Nutrition — Spice x750  TCV=8,250  202h
    MainScript.IME_JobPool_T3[11] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[11].resourceName  = "Spice"
    MainScript.IME_JobPool_T3[11].companyName   = "Advanced Nutrition"
    MainScript.IME_JobPool_T3[11].companyIndex  = 1
    MainScript.IME_JobPool_T3[11].quantity      = 750
    MainScript.IME_JobPool_T3[11].baseValue     = 11
    MainScript.IME_JobPool_T3[11].deadlineHours = 202
    MainScript.IME_JobPool_T3[11].rarity        = "Uncommon"

    ; [ 12] Generdyne Industries — Vytinium Fuel Rod x10  TCV=8,360  420h
    MainScript.IME_JobPool_T3[12] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[12].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T3[12].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T3[12].companyIndex  = 22
    MainScript.IME_JobPool_T3[12].quantity      = 10
    MainScript.IME_JobPool_T3[12].baseValue     = 836
    MainScript.IME_JobPool_T3[12].deadlineHours = 420
    MainScript.IME_JobPool_T3[12].rarity        = "Unique"

    ; [ 13] Shinigami — Uranium x600  TCV=8,400  126h
    MainScript.IME_JobPool_T3[13] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[13].resourceName  = "Uranium"
    MainScript.IME_JobPool_T3[13].companyName   = "Shinigami"
    MainScript.IME_JobPool_T3[13].companyIndex  = 39
    MainScript.IME_JobPool_T3[13].quantity      = 600
    MainScript.IME_JobPool_T3[13].baseValue     = 14
    MainScript.IME_JobPool_T3[13].deadlineHours = 126
    MainScript.IME_JobPool_T3[13].rarity        = "Common"

    ; [ 14] Argos Extractors — Aldumite x100  TCV=8,400  504h
    MainScript.IME_JobPool_T3[14] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[14].resourceName  = "Aldumite"
    MainScript.IME_JobPool_T3[14].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T3[14].companyIndex  = 5
    MainScript.IME_JobPool_T3[14].quantity      = 100
    MainScript.IME_JobPool_T3[14].baseValue     = 84
    MainScript.IME_JobPool_T3[14].deadlineHours = 504
    MainScript.IME_JobPool_T3[14].rarity        = "Unique"

    ; [ 15] Ryujin — Beryllium x750  TCV=9,000  202h
    MainScript.IME_JobPool_T3[15] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[15].resourceName  = "Beryllium"
    MainScript.IME_JobPool_T3[15].companyName   = "Ryujin"
    MainScript.IME_JobPool_T3[15].companyIndex  = 37
    MainScript.IME_JobPool_T3[15].quantity      = 750
    MainScript.IME_JobPool_T3[15].baseValue     = 12
    MainScript.IME_JobPool_T3[15].deadlineHours = 202
    MainScript.IME_JobPool_T3[15].rarity        = "Uncommon"

    ; [ 16] Celtcorp — Fluorine x750  TCV=9,000  202h
    MainScript.IME_JobPool_T3[16] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[16].resourceName  = "Fluorine"
    MainScript.IME_JobPool_T3[16].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T3[16].companyIndex  = 9
    MainScript.IME_JobPool_T3[16].quantity      = 750
    MainScript.IME_JobPool_T3[16].baseValue     = 12
    MainScript.IME_JobPool_T3[16].deadlineHours = 202
    MainScript.IME_JobPool_T3[16].rarity        = "Uncommon"

    ; [ 17] Muybridge Pharmaceuticals — Metabolic Agent x1000  TCV=9,000  151h
    MainScript.IME_JobPool_T3[17] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[17].resourceName  = "Metabolic Agent"
    MainScript.IME_JobPool_T3[17].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T3[17].companyIndex  = 30
    MainScript.IME_JobPool_T3[17].quantity      = 1000
    MainScript.IME_JobPool_T3[17].baseValue     = 9
    MainScript.IME_JobPool_T3[17].deadlineHours = 151
    MainScript.IME_JobPool_T3[17].rarity        = "Common"

    ; [ 18] Muybridge Pharmaceuticals — Tetrafluorides x500  TCV=9,000  252h
    MainScript.IME_JobPool_T3[18] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[18].resourceName  = "Tetrafluorides"
    MainScript.IME_JobPool_T3[18].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T3[18].companyIndex  = 30
    MainScript.IME_JobPool_T3[18].quantity      = 500
    MainScript.IME_JobPool_T3[18].baseValue     = 18
    MainScript.IME_JobPool_T3[18].deadlineHours = 252
    MainScript.IME_JobPool_T3[18].rarity        = "Rare"

    ; [ 19] Ryujin — Mag Pressure Tank x375  TCV=9,375  168h
    MainScript.IME_JobPool_T3[19] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[19].resourceName  = "Mag Pressure Tank"
    MainScript.IME_JobPool_T3[19].companyName   = "Ryujin"
    MainScript.IME_JobPool_T3[19].companyIndex  = 37
    MainScript.IME_JobPool_T3[19].quantity      = 375
    MainScript.IME_JobPool_T3[19].baseValue     = 25
    MainScript.IME_JobPool_T3[19].deadlineHours = 168
    MainScript.IME_JobPool_T3[19].rarity        = "Uncommon"

    ; [ 20] Arc Might — Polytextile x375  TCV=9,375  168h
    MainScript.IME_JobPool_T3[20] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[20].resourceName  = "Polytextile"
    MainScript.IME_JobPool_T3[20].companyName   = "Arc Might"
    MainScript.IME_JobPool_T3[20].companyIndex  = 4
    MainScript.IME_JobPool_T3[20].quantity      = 375
    MainScript.IME_JobPool_T3[20].baseValue     = 25
    MainScript.IME_JobPool_T3[20].deadlineHours = 168
    MainScript.IME_JobPool_T3[20].rarity        = "Uncommon"

    ; [ 21] Deimos Staryards — Ytterbium x250  TCV=9,500  353h
    MainScript.IME_JobPool_T3[21] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[21].resourceName  = "Ytterbium"
    MainScript.IME_JobPool_T3[21].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T3[21].companyIndex  = 16
    MainScript.IME_JobPool_T3[21].quantity      = 250
    MainScript.IME_JobPool_T3[21].baseValue     = 38
    MainScript.IME_JobPool_T3[21].deadlineHours = 353
    MainScript.IME_JobPool_T3[21].rarity        = "Exotic"

    ; [ 22] Hopetech — Ytterbium x250  TCV=9,500  353h
    MainScript.IME_JobPool_T3[22] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[22].resourceName  = "Ytterbium"
    MainScript.IME_JobPool_T3[22].companyName   = "Hopetech"
    MainScript.IME_JobPool_T3[22].companyIndex  = 23
    MainScript.IME_JobPool_T3[22].quantity      = 250
    MainScript.IME_JobPool_T3[22].baseValue     = 38
    MainScript.IME_JobPool_T3[22].deadlineHours = 353
    MainScript.IME_JobPool_T3[22].rarity        = "Exotic"

    ; [ 23] Taiyo Astroneering — Ytterbium x250  TCV=9,500  353h
    MainScript.IME_JobPool_T3[23] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[23].resourceName  = "Ytterbium"
    MainScript.IME_JobPool_T3[23].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T3[23].companyIndex  = 44
    MainScript.IME_JobPool_T3[23].quantity      = 250
    MainScript.IME_JobPool_T3[23].baseValue     = 38
    MainScript.IME_JobPool_T3[23].deadlineHours = 353
    MainScript.IME_JobPool_T3[23].rarity        = "Exotic"

    ; [ 24] Chunks — Alkanes x750  TCV=9,750  202h
    MainScript.IME_JobPool_T3[24] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[24].resourceName  = "Alkanes"
    MainScript.IME_JobPool_T3[24].companyName   = "Chunks"
    MainScript.IME_JobPool_T3[24].companyIndex  = 12
    MainScript.IME_JobPool_T3[24].quantity      = 750
    MainScript.IME_JobPool_T3[24].baseValue     = 13
    MainScript.IME_JobPool_T3[24].deadlineHours = 202
    MainScript.IME_JobPool_T3[24].rarity        = "Uncommon"

    ; [ 25] Reliant Medical — Biosuppressant x625  TCV=10,000  441h
    MainScript.IME_JobPool_T3[25] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[25].resourceName  = "Biosuppressant"
    MainScript.IME_JobPool_T3[25].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[25].companyIndex  = 36
    MainScript.IME_JobPool_T3[25].quantity      = 625
    MainScript.IME_JobPool_T3[25].baseValue     = 16
    MainScript.IME_JobPool_T3[25].deadlineHours = 441
    MainScript.IME_JobPool_T3[25].rarity        = "Exotic"

    ; [ 26] Celtcorp — Copper x1000  TCV=10,000  151h
    MainScript.IME_JobPool_T3[26] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[26].resourceName  = "Copper"
    MainScript.IME_JobPool_T3[26].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T3[26].companyIndex  = 9
    MainScript.IME_JobPool_T3[26].quantity      = 1000
    MainScript.IME_JobPool_T3[26].baseValue     = 10
    MainScript.IME_JobPool_T3[26].deadlineHours = 151
    MainScript.IME_JobPool_T3[26].rarity        = "Common"

    ; [ 27] Deep Core — Europium x250  TCV=10,000  353h
    MainScript.IME_JobPool_T3[27] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[27].resourceName  = "Europium"
    MainScript.IME_JobPool_T3[27].companyName   = "Deep Core"
    MainScript.IME_JobPool_T3[27].companyIndex  = 15
    MainScript.IME_JobPool_T3[27].quantity      = 250
    MainScript.IME_JobPool_T3[27].baseValue     = 40
    MainScript.IME_JobPool_T3[27].deadlineHours = 353
    MainScript.IME_JobPool_T3[27].rarity        = "Exotic"

    ; [ 28] Kore Kinetics — Lead x1000  TCV=10,000  151h
    MainScript.IME_JobPool_T3[28] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[28].resourceName  = "Lead"
    MainScript.IME_JobPool_T3[28].companyName   = "Kore Kinetics"
    MainScript.IME_JobPool_T3[28].companyIndex  = 26
    MainScript.IME_JobPool_T3[28].quantity      = 1000
    MainScript.IME_JobPool_T3[28].baseValue     = 10
    MainScript.IME_JobPool_T3[28].deadlineHours = 151
    MainScript.IME_JobPool_T3[28].rarity        = "Common"

    ; [ 29] Ballistics Solutions — Neodymium x500  TCV=10,000  252h
    MainScript.IME_JobPool_T3[29] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[29].resourceName  = "Neodymium"
    MainScript.IME_JobPool_T3[29].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T3[29].companyIndex  = 8
    MainScript.IME_JobPool_T3[29].quantity      = 500
    MainScript.IME_JobPool_T3[29].baseValue     = 20
    MainScript.IME_JobPool_T3[29].deadlineHours = 252
    MainScript.IME_JobPool_T3[29].rarity        = "Rare"

    ; [ 30] Horizon Defence — Neodymium x500  TCV=10,000  252h
    MainScript.IME_JobPool_T3[30] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[30].resourceName  = "Neodymium"
    MainScript.IME_JobPool_T3[30].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T3[30].companyIndex  = 24
    MainScript.IME_JobPool_T3[30].quantity      = 500
    MainScript.IME_JobPool_T3[30].baseValue     = 20
    MainScript.IME_JobPool_T3[30].deadlineHours = 252
    MainScript.IME_JobPool_T3[30].rarity        = "Rare"

    ; [ 31] Consolidated Mining — Nickel x1000  TCV=10,000  151h
    MainScript.IME_JobPool_T3[31] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[31].resourceName  = "Nickel"
    MainScript.IME_JobPool_T3[31].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T3[31].companyIndex  = 14
    MainScript.IME_JobPool_T3[31].quantity      = 1000
    MainScript.IME_JobPool_T3[31].baseValue     = 10
    MainScript.IME_JobPool_T3[31].deadlineHours = 151
    MainScript.IME_JobPool_T3[31].rarity        = "Common"

    ; [ 32] Chunks — Water x2500  TCV=10,000  189h
    MainScript.IME_JobPool_T3[32] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[32].resourceName  = "Water"
    MainScript.IME_JobPool_T3[32].companyName   = "Chunks"
    MainScript.IME_JobPool_T3[32].companyIndex  = 12
    MainScript.IME_JobPool_T3[32].quantity      = 2500
    MainScript.IME_JobPool_T3[32].baseValue     = 4
    MainScript.IME_JobPool_T3[32].deadlineHours = 189
    MainScript.IME_JobPool_T3[32].rarity        = "Common"

    ; [ 33] Infinity Ltd — Chlorosilanes x750  TCV=10,500  202h
    MainScript.IME_JobPool_T3[33] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[33].resourceName  = "Chlorosilanes"
    MainScript.IME_JobPool_T3[33].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T3[33].companyIndex  = 25
    MainScript.IME_JobPool_T3[33].quantity      = 750
    MainScript.IME_JobPool_T3[33].baseValue     = 14
    MainScript.IME_JobPool_T3[33].deadlineHours = 202
    MainScript.IME_JobPool_T3[33].rarity        = "Uncommon"

    ; [ 34] Shinigami — Iridium x750  TCV=10,500  202h
    MainScript.IME_JobPool_T3[34] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[34].resourceName  = "Iridium"
    MainScript.IME_JobPool_T3[34].companyName   = "Shinigami"
    MainScript.IME_JobPool_T3[34].companyIndex  = 39
    MainScript.IME_JobPool_T3[34].quantity      = 750
    MainScript.IME_JobPool_T3[34].baseValue     = 14
    MainScript.IME_JobPool_T3[34].deadlineHours = 202
    MainScript.IME_JobPool_T3[34].rarity        = "Uncommon"

    ; [ 35] Vanguard — Iridium x750  TCV=10,500  202h
    MainScript.IME_JobPool_T3[35] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[35].resourceName  = "Iridium"
    MainScript.IME_JobPool_T3[35].companyName   = "Vanguard"
    MainScript.IME_JobPool_T3[35].companyIndex  = 46
    MainScript.IME_JobPool_T3[35].quantity      = 750
    MainScript.IME_JobPool_T3[35].baseValue     = 14
    MainScript.IME_JobPool_T3[35].deadlineHours = 202
    MainScript.IME_JobPool_T3[35].rarity        = "Uncommon"

    ; [ 36] Ryujin — Mercury x500  TCV=11,000  252h
    MainScript.IME_JobPool_T3[36] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[36].resourceName  = "Mercury"
    MainScript.IME_JobPool_T3[36].companyName   = "Ryujin"
    MainScript.IME_JobPool_T3[36].companyIndex  = 37
    MainScript.IME_JobPool_T3[36].quantity      = 500
    MainScript.IME_JobPool_T3[36].baseValue     = 22
    MainScript.IME_JobPool_T3[36].deadlineHours = 252
    MainScript.IME_JobPool_T3[36].rarity        = "Rare"

    ; [ 37] Reliant Medical — Hypercatalyst x625  TCV=11,250  441h
    MainScript.IME_JobPool_T3[37] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[37].resourceName  = "Hypercatalyst"
    MainScript.IME_JobPool_T3[37].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[37].companyIndex  = 36
    MainScript.IME_JobPool_T3[37].quantity      = 625
    MainScript.IME_JobPool_T3[37].baseValue     = 18
    MainScript.IME_JobPool_T3[37].deadlineHours = 441
    MainScript.IME_JobPool_T3[37].rarity        = "Exotic"

    ; [ 38] Ballistics Solutions — Tantalum x500  TCV=11,500  252h
    MainScript.IME_JobPool_T3[38] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[38].resourceName  = "Tantalum"
    MainScript.IME_JobPool_T3[38].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T3[38].companyIndex  = 8
    MainScript.IME_JobPool_T3[38].quantity      = 500
    MainScript.IME_JobPool_T3[38].baseValue     = 23
    MainScript.IME_JobPool_T3[38].deadlineHours = 252
    MainScript.IME_JobPool_T3[38].rarity        = "Rare"

    ; [ 39] Vanguard — Tantalum x500  TCV=11,500  252h
    MainScript.IME_JobPool_T3[39] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[39].resourceName  = "Tantalum"
    MainScript.IME_JobPool_T3[39].companyName   = "Vanguard"
    MainScript.IME_JobPool_T3[39].companyIndex  = 46
    MainScript.IME_JobPool_T3[39].quantity      = 500
    MainScript.IME_JobPool_T3[39].baseValue     = 23
    MainScript.IME_JobPool_T3[39].deadlineHours = 252
    MainScript.IME_JobPool_T3[39].rarity        = "Rare"

    ; [ 40] Axion Energy — Adaptive Frame x500  TCV=12,000  126h
    MainScript.IME_JobPool_T3[40] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[40].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T3[40].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T3[40].companyIndex  = 7
    MainScript.IME_JobPool_T3[40].quantity      = 500
    MainScript.IME_JobPool_T3[40].baseValue     = 24
    MainScript.IME_JobPool_T3[40].deadlineHours = 126
    MainScript.IME_JobPool_T3[40].rarity        = "Common"

    ; [ 41] Ryujin — Adaptive Frame x500  TCV=12,000  126h
    MainScript.IME_JobPool_T3[41] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[41].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T3[41].companyName   = "Ryujin"
    MainScript.IME_JobPool_T3[41].companyIndex  = 37
    MainScript.IME_JobPool_T3[41].quantity      = 500
    MainScript.IME_JobPool_T3[41].baseValue     = 24
    MainScript.IME_JobPool_T3[41].deadlineHours = 126
    MainScript.IME_JobPool_T3[41].rarity        = "Common"

    ; [ 42] Ryujin — Gold x500  TCV=12,000  252h
    MainScript.IME_JobPool_T3[42] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[42].resourceName  = "Gold"
    MainScript.IME_JobPool_T3[42].companyName   = "Ryujin"
    MainScript.IME_JobPool_T3[42].companyIndex  = 37
    MainScript.IME_JobPool_T3[42].quantity      = 500
    MainScript.IME_JobPool_T3[42].baseValue     = 24
    MainScript.IME_JobPool_T3[42].deadlineHours = 252
    MainScript.IME_JobPool_T3[42].rarity        = "Rare"

    ; [ 43] Infinity Ltd — Platinum x500  TCV=12,000  252h
    MainScript.IME_JobPool_T3[43] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[43].resourceName  = "Platinum"
    MainScript.IME_JobPool_T3[43].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T3[43].companyIndex  = 25
    MainScript.IME_JobPool_T3[43].quantity      = 500
    MainScript.IME_JobPool_T3[43].baseValue     = 24
    MainScript.IME_JobPool_T3[43].deadlineHours = 252
    MainScript.IME_JobPool_T3[43].rarity        = "Rare"

    ; [ 44] Deimos Staryards — Tungsten x750  TCV=12,000  202h
    MainScript.IME_JobPool_T3[44] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[44].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T3[44].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T3[44].companyIndex  = 16
    MainScript.IME_JobPool_T3[44].quantity      = 750
    MainScript.IME_JobPool_T3[44].baseValue     = 16
    MainScript.IME_JobPool_T3[44].deadlineHours = 202
    MainScript.IME_JobPool_T3[44].rarity        = "Uncommon"

    ; [ 45] Hopetech — Tungsten x750  TCV=12,000  202h
    MainScript.IME_JobPool_T3[45] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[45].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T3[45].companyName   = "Hopetech"
    MainScript.IME_JobPool_T3[45].companyIndex  = 23
    MainScript.IME_JobPool_T3[45].quantity      = 750
    MainScript.IME_JobPool_T3[45].baseValue     = 16
    MainScript.IME_JobPool_T3[45].deadlineHours = 202
    MainScript.IME_JobPool_T3[45].rarity        = "Uncommon"

    ; [ 46] Stroud Eklund — Tungsten x750  TCV=12,000  202h
    MainScript.IME_JobPool_T3[46] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[46].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T3[46].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T3[46].companyIndex  = 43
    MainScript.IME_JobPool_T3[46].quantity      = 750
    MainScript.IME_JobPool_T3[46].baseValue     = 16
    MainScript.IME_JobPool_T3[46].deadlineHours = 202
    MainScript.IME_JobPool_T3[46].rarity        = "Uncommon"

    ; [ 47] Taiyo Astroneering — Tungsten x750  TCV=12,000  202h
    MainScript.IME_JobPool_T3[47] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[47].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T3[47].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T3[47].companyIndex  = 44
    MainScript.IME_JobPool_T3[47].quantity      = 750
    MainScript.IME_JobPool_T3[47].baseValue     = 16
    MainScript.IME_JobPool_T3[47].deadlineHours = 202
    MainScript.IME_JobPool_T3[47].rarity        = "Uncommon"

    ; [ 48] Trident Luxury Lines — Tungsten x750  TCV=12,000  202h
    MainScript.IME_JobPool_T3[48] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[48].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T3[48].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T3[48].companyIndex  = 45
    MainScript.IME_JobPool_T3[48].quantity      = 750
    MainScript.IME_JobPool_T3[48].baseValue     = 16
    MainScript.IME_JobPool_T3[48].deadlineHours = 202
    MainScript.IME_JobPool_T3[48].rarity        = "Uncommon"

    ; [ 49] Argos Extractors — Vanadium x500  TCV=12,000  252h
    MainScript.IME_JobPool_T3[49] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[49].resourceName  = "Vanadium"
    MainScript.IME_JobPool_T3[49].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T3[49].companyIndex  = 5
    MainScript.IME_JobPool_T3[49].quantity      = 500
    MainScript.IME_JobPool_T3[49].baseValue     = 24
    MainScript.IME_JobPool_T3[49].deadlineHours = 252
    MainScript.IME_JobPool_T3[49].rarity        = "Rare"

    ; [ 50] Celtcorp — Indicite Wafer x50  TCV=12,150  420h
    MainScript.IME_JobPool_T3[50] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[50].resourceName  = "Indicite Wafer"
    MainScript.IME_JobPool_T3[50].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T3[50].companyIndex  = 9
    MainScript.IME_JobPool_T3[50].quantity      = 50
    MainScript.IME_JobPool_T3[50].baseValue     = 243
    MainScript.IME_JobPool_T3[50].deadlineHours = 420
    MainScript.IME_JobPool_T3[50].rarity        = "Unique"

    ; [ 51] Muybridge Pharmaceuticals — Amino Acids x1250  TCV=12,500  315h
    MainScript.IME_JobPool_T3[51] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[51].resourceName  = "Amino Acids"
    MainScript.IME_JobPool_T3[51].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T3[51].companyIndex  = 30
    MainScript.IME_JobPool_T3[51].quantity      = 1250
    MainScript.IME_JobPool_T3[51].baseValue     = 10
    MainScript.IME_JobPool_T3[51].deadlineHours = 315
    MainScript.IME_JobPool_T3[51].rarity        = "Rare"

    ; [ 52] Arc Might — Argon x2500  TCV=12,500  189h
    MainScript.IME_JobPool_T3[52] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[52].resourceName  = "Argon"
    MainScript.IME_JobPool_T3[52].companyName   = "Arc Might"
    MainScript.IME_JobPool_T3[52].companyIndex  = 4
    MainScript.IME_JobPool_T3[52].quantity      = 2500
    MainScript.IME_JobPool_T3[52].baseValue     = 5
    MainScript.IME_JobPool_T3[52].deadlineHours = 189
    MainScript.IME_JobPool_T3[52].rarity        = "Common"

    ; [ 53] Consolidated Mining — Isotopic Coolant x500  TCV=12,500  126h
    MainScript.IME_JobPool_T3[53] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[53].resourceName  = "Isotopic Coolant"
    MainScript.IME_JobPool_T3[53].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T3[53].companyIndex  = 14
    MainScript.IME_JobPool_T3[53].quantity      = 500
    MainScript.IME_JobPool_T3[53].baseValue     = 25
    MainScript.IME_JobPool_T3[53].deadlineHours = 126
    MainScript.IME_JobPool_T3[53].rarity        = "Common"

    ; [ 54] Xenofresh Fisheries — Nutrient x2500  TCV=12,500  189h
    MainScript.IME_JobPool_T3[54] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[54].resourceName  = "Nutrient"
    MainScript.IME_JobPool_T3[54].companyName   = "Xenofresh Fisheries"
    MainScript.IME_JobPool_T3[54].companyIndex  = 47
    MainScript.IME_JobPool_T3[54].quantity      = 2500
    MainScript.IME_JobPool_T3[54].baseValue     = 5
    MainScript.IME_JobPool_T3[54].deadlineHours = 189
    MainScript.IME_JobPool_T3[54].rarity        = "Common"

    ; [ 55] Ryujin — Polymer x625  TCV=12,500  441h
    MainScript.IME_JobPool_T3[55] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[55].resourceName  = "Polymer"
    MainScript.IME_JobPool_T3[55].companyName   = "Ryujin"
    MainScript.IME_JobPool_T3[55].companyIndex  = 37
    MainScript.IME_JobPool_T3[55].quantity      = 625
    MainScript.IME_JobPool_T3[55].baseValue     = 20
    MainScript.IME_JobPool_T3[55].deadlineHours = 441
    MainScript.IME_JobPool_T3[55].rarity        = "Exotic"

    ; [ 56] Axion Energy — Reactive Gauge x500  TCV=12,500  126h
    MainScript.IME_JobPool_T3[56] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[56].resourceName  = "Reactive Gauge"
    MainScript.IME_JobPool_T3[56].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T3[56].companyIndex  = 7
    MainScript.IME_JobPool_T3[56].quantity      = 500
    MainScript.IME_JobPool_T3[56].baseValue     = 25
    MainScript.IME_JobPool_T3[56].deadlineHours = 126
    MainScript.IME_JobPool_T3[56].rarity        = "Common"

    ; [ 57] Celtcorp — Reactive Gauge x500  TCV=12,500  126h
    MainScript.IME_JobPool_T3[57] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[57].resourceName  = "Reactive Gauge"
    MainScript.IME_JobPool_T3[57].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T3[57].companyIndex  = 9
    MainScript.IME_JobPool_T3[57].quantity      = 500
    MainScript.IME_JobPool_T3[57].baseValue     = 25
    MainScript.IME_JobPool_T3[57].deadlineHours = 126
    MainScript.IME_JobPool_T3[57].rarity        = "Common"

    ; [ 58] Chunks — Stimulant x625  TCV=12,500  441h
    MainScript.IME_JobPool_T3[58] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[58].resourceName  = "Stimulant"
    MainScript.IME_JobPool_T3[58].companyName   = "Chunks"
    MainScript.IME_JobPool_T3[58].companyIndex  = 12
    MainScript.IME_JobPool_T3[58].quantity      = 625
    MainScript.IME_JobPool_T3[58].baseValue     = 20
    MainScript.IME_JobPool_T3[58].deadlineHours = 441
    MainScript.IME_JobPool_T3[58].rarity        = "Exotic"

    ; [ 59] Reliant Medical — Substrate Molecule Sieve x50  TCV=13,700  420h
    MainScript.IME_JobPool_T3[59] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[59].resourceName  = "Substrate Molecule Sieve"
    MainScript.IME_JobPool_T3[59].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[59].companyIndex  = 36
    MainScript.IME_JobPool_T3[59].quantity      = 50
    MainScript.IME_JobPool_T3[59].baseValue     = 274
    MainScript.IME_JobPool_T3[59].deadlineHours = 420
    MainScript.IME_JobPool_T3[59].rarity        = "Unique"

    ; [ 60] Generdyne Industries — Dysprosium x250  TCV=14,000  353h
    MainScript.IME_JobPool_T3[60] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[60].resourceName  = "Dysprosium"
    MainScript.IME_JobPool_T3[60].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T3[60].companyIndex  = 22
    MainScript.IME_JobPool_T3[60].quantity      = 250
    MainScript.IME_JobPool_T3[60].baseValue     = 56
    MainScript.IME_JobPool_T3[60].deadlineHours = 353
    MainScript.IME_JobPool_T3[60].rarity        = "Exotic"

    ; [ 61] Deimos Staryards — Uranium x1000  TCV=14,000  151h
    MainScript.IME_JobPool_T3[61] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[61].resourceName  = "Uranium"
    MainScript.IME_JobPool_T3[61].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T3[61].companyIndex  = 16
    MainScript.IME_JobPool_T3[61].quantity      = 1000
    MainScript.IME_JobPool_T3[61].baseValue     = 14
    MainScript.IME_JobPool_T3[61].deadlineHours = 151
    MainScript.IME_JobPool_T3[61].rarity        = "Common"

    ; [ 62] Generdyne Industries — Uranium x1000  TCV=14,000  151h
    MainScript.IME_JobPool_T3[62] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[62].resourceName  = "Uranium"
    MainScript.IME_JobPool_T3[62].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T3[62].companyIndex  = 22
    MainScript.IME_JobPool_T3[62].quantity      = 1000
    MainScript.IME_JobPool_T3[62].baseValue     = 14
    MainScript.IME_JobPool_T3[62].deadlineHours = 151
    MainScript.IME_JobPool_T3[62].rarity        = "Common"

    ; [ 63] Stroud Eklund — Uranium x1000  TCV=14,000  151h
    MainScript.IME_JobPool_T3[63] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[63].resourceName  = "Uranium"
    MainScript.IME_JobPool_T3[63].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T3[63].companyIndex  = 43
    MainScript.IME_JobPool_T3[63].quantity      = 1000
    MainScript.IME_JobPool_T3[63].baseValue     = 14
    MainScript.IME_JobPool_T3[63].deadlineHours = 151
    MainScript.IME_JobPool_T3[63].rarity        = "Common"

    ; [ 64] Taiyo Astroneering — Uranium x1000  TCV=14,000  151h
    MainScript.IME_JobPool_T3[64] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[64].resourceName  = "Uranium"
    MainScript.IME_JobPool_T3[64].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T3[64].companyIndex  = 44
    MainScript.IME_JobPool_T3[64].quantity      = 1000
    MainScript.IME_JobPool_T3[64].baseValue     = 14
    MainScript.IME_JobPool_T3[64].deadlineHours = 151
    MainScript.IME_JobPool_T3[64].rarity        = "Common"

    ; [ 65] Muybridge Pharmaceuticals — Benzene x750  TCV=14,250  202h
    MainScript.IME_JobPool_T3[65] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[65].resourceName  = "Benzene"
    MainScript.IME_JobPool_T3[65].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T3[65].companyIndex  = 30
    MainScript.IME_JobPool_T3[65].quantity      = 750
    MainScript.IME_JobPool_T3[65].baseValue     = 19
    MainScript.IME_JobPool_T3[65].deadlineHours = 202
    MainScript.IME_JobPool_T3[65].rarity        = "Uncommon"

    ; [ 66] Reladyne — Ionic Liquids x625  TCV=14,375  441h
    MainScript.IME_JobPool_T3[66] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[66].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T3[66].companyName   = "Reladyne"
    MainScript.IME_JobPool_T3[66].companyIndex  = 35
    MainScript.IME_JobPool_T3[66].quantity      = 625
    MainScript.IME_JobPool_T3[66].baseValue     = 23
    MainScript.IME_JobPool_T3[66].deadlineHours = 441
    MainScript.IME_JobPool_T3[66].rarity        = "Exotic"

    ; [ 67] Slayton Aerospace — Ionic Liquids x625  TCV=14,375  441h
    MainScript.IME_JobPool_T3[67] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[67].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T3[67].companyName   = "Slayton Aerospace"
    MainScript.IME_JobPool_T3[67].companyIndex  = 41
    MainScript.IME_JobPool_T3[67].quantity      = 625
    MainScript.IME_JobPool_T3[67].baseValue     = 23
    MainScript.IME_JobPool_T3[67].deadlineHours = 441
    MainScript.IME_JobPool_T3[67].rarity        = "Exotic"

    ; [ 68] Axion Energy — Rothicite Magnet x50  TCV=14,750  420h
    MainScript.IME_JobPool_T3[68] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[68].resourceName  = "Rothicite Magnet"
    MainScript.IME_JobPool_T3[68].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T3[68].companyIndex  = 7
    MainScript.IME_JobPool_T3[68].quantity      = 50
    MainScript.IME_JobPool_T3[68].baseValue     = 295
    MainScript.IME_JobPool_T3[68].deadlineHours = 420
    MainScript.IME_JobPool_T3[68].rarity        = "Unique"

    ; [ 69] Consolidated Mining — Veryl-Treated Manifold x50  TCV=14,750  420h
    MainScript.IME_JobPool_T3[69] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[69].resourceName  = "Veryl-Treated Manifold"
    MainScript.IME_JobPool_T3[69].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T3[69].companyIndex  = 14
    MainScript.IME_JobPool_T3[69].quantity      = 50
    MainScript.IME_JobPool_T3[69].baseValue     = 295
    MainScript.IME_JobPool_T3[69].deadlineHours = 420
    MainScript.IME_JobPool_T3[69].rarity        = "Unique"

    ; [ 70] Axion Energy — Tasine Superconductor x50  TCV=14,950  420h
    MainScript.IME_JobPool_T3[70] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[70].resourceName  = "Tasine Superconductor"
    MainScript.IME_JobPool_T3[70].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T3[70].companyIndex  = 7
    MainScript.IME_JobPool_T3[70].quantity      = 50
    MainScript.IME_JobPool_T3[70].baseValue     = 299
    MainScript.IME_JobPool_T3[70].deadlineHours = 420
    MainScript.IME_JobPool_T3[70].rarity        = "Unique"

    ; [ 71] Arc Might — Adhesive x1250  TCV=15,000  315h
    MainScript.IME_JobPool_T3[71] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[71].resourceName  = "Adhesive"
    MainScript.IME_JobPool_T3[71].companyName   = "Arc Might"
    MainScript.IME_JobPool_T3[71].companyIndex  = 4
    MainScript.IME_JobPool_T3[71].quantity      = 1250
    MainScript.IME_JobPool_T3[71].baseValue     = 12
    MainScript.IME_JobPool_T3[71].deadlineHours = 315
    MainScript.IME_JobPool_T3[71].rarity        = "Rare"

    ; [ 72] Reliant Medical — Analgesic x1250  TCV=15,000  315h
    MainScript.IME_JobPool_T3[72] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[72].resourceName  = "Analgesic"
    MainScript.IME_JobPool_T3[72].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[72].companyIndex  = 36
    MainScript.IME_JobPool_T3[72].quantity      = 1250
    MainScript.IME_JobPool_T3[72].baseValue     = 12
    MainScript.IME_JobPool_T3[72].deadlineHours = 315
    MainScript.IME_JobPool_T3[72].rarity        = "Rare"

    ; [ 73] Reliant Medical — Carboxylic Acids x1250  TCV=15,000  315h
    MainScript.IME_JobPool_T3[73] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[73].resourceName  = "Carboxylic Acids"
    MainScript.IME_JobPool_T3[73].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[73].companyIndex  = 36
    MainScript.IME_JobPool_T3[73].quantity      = 1250
    MainScript.IME_JobPool_T3[73].baseValue     = 12
    MainScript.IME_JobPool_T3[73].deadlineHours = 315
    MainScript.IME_JobPool_T3[73].rarity        = "Rare"

    ; [ 74] Reliant Medical — Chlorine x2500  TCV=15,000  189h
    MainScript.IME_JobPool_T3[74] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[74].resourceName  = "Chlorine"
    MainScript.IME_JobPool_T3[74].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[74].companyIndex  = 36
    MainScript.IME_JobPool_T3[74].quantity      = 2500
    MainScript.IME_JobPool_T3[74].baseValue     = 6
    MainScript.IME_JobPool_T3[74].deadlineHours = 189
    MainScript.IME_JobPool_T3[74].rarity        = "Common"

    ; [ 75] Deimos Staryards — Sealant x2500  TCV=15,000  189h
    MainScript.IME_JobPool_T3[75] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[75].resourceName  = "Sealant"
    MainScript.IME_JobPool_T3[75].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T3[75].companyIndex  = 16
    MainScript.IME_JobPool_T3[75].quantity      = 2500
    MainScript.IME_JobPool_T3[75].baseValue     = 6
    MainScript.IME_JobPool_T3[75].deadlineHours = 189
    MainScript.IME_JobPool_T3[75].rarity        = "Common"

    ; [ 76] Stroud Eklund — Sealant x2500  TCV=15,000  189h
    MainScript.IME_JobPool_T3[76] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[76].resourceName  = "Sealant"
    MainScript.IME_JobPool_T3[76].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T3[76].companyIndex  = 43
    MainScript.IME_JobPool_T3[76].quantity      = 2500
    MainScript.IME_JobPool_T3[76].baseValue     = 6
    MainScript.IME_JobPool_T3[76].deadlineHours = 189
    MainScript.IME_JobPool_T3[76].rarity        = "Common"

    ; [ 77] Taiyo Astroneering — Sealant x2500  TCV=15,000  189h
    MainScript.IME_JobPool_T3[77] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[77].resourceName  = "Sealant"
    MainScript.IME_JobPool_T3[77].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T3[77].companyIndex  = 44
    MainScript.IME_JobPool_T3[77].quantity      = 2500
    MainScript.IME_JobPool_T3[77].baseValue     = 6
    MainScript.IME_JobPool_T3[77].deadlineHours = 189
    MainScript.IME_JobPool_T3[77].rarity        = "Common"

    ; [ 78] Trident Luxury Lines — Sealant x2500  TCV=15,000  189h
    MainScript.IME_JobPool_T3[78] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[78].resourceName  = "Sealant"
    MainScript.IME_JobPool_T3[78].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T3[78].companyIndex  = 45
    MainScript.IME_JobPool_T3[78].quantity      = 2500
    MainScript.IME_JobPool_T3[78].baseValue     = 6
    MainScript.IME_JobPool_T3[78].deadlineHours = 189
    MainScript.IME_JobPool_T3[78].rarity        = "Common"

    ; [ 79] Chunks — Sedative x1250  TCV=15,000  315h
    MainScript.IME_JobPool_T3[79] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[79].resourceName  = "Sedative"
    MainScript.IME_JobPool_T3[79].companyName   = "Chunks"
    MainScript.IME_JobPool_T3[79].companyIndex  = 12
    MainScript.IME_JobPool_T3[79].quantity      = 1250
    MainScript.IME_JobPool_T3[79].baseValue     = 12
    MainScript.IME_JobPool_T3[79].deadlineHours = 315
    MainScript.IME_JobPool_T3[79].rarity        = "Rare"

    ; [ 80] Reliant Medical — Sedative x1250  TCV=15,000  315h
    MainScript.IME_JobPool_T3[80] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[80].resourceName  = "Sedative"
    MainScript.IME_JobPool_T3[80].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[80].companyIndex  = 36
    MainScript.IME_JobPool_T3[80].quantity      = 1250
    MainScript.IME_JobPool_T3[80].baseValue     = 12
    MainScript.IME_JobPool_T3[80].deadlineHours = 315
    MainScript.IME_JobPool_T3[80].rarity        = "Rare"

    ; [ 81] Axion Energy — Silver x750  TCV=15,000  202h
    MainScript.IME_JobPool_T3[81] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[81].resourceName  = "Silver"
    MainScript.IME_JobPool_T3[81].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T3[81].companyIndex  = 7
    MainScript.IME_JobPool_T3[81].quantity      = 750
    MainScript.IME_JobPool_T3[81].baseValue     = 20
    MainScript.IME_JobPool_T3[81].deadlineHours = 202
    MainScript.IME_JobPool_T3[81].rarity        = "Uncommon"

    ; [ 82] Ryujin — Silver x750  TCV=15,000  202h
    MainScript.IME_JobPool_T3[82] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[82].resourceName  = "Silver"
    MainScript.IME_JobPool_T3[82].companyName   = "Ryujin"
    MainScript.IME_JobPool_T3[82].companyIndex  = 37
    MainScript.IME_JobPool_T3[82].quantity      = 750
    MainScript.IME_JobPool_T3[82].baseValue     = 20
    MainScript.IME_JobPool_T3[82].deadlineHours = 202
    MainScript.IME_JobPool_T3[82].rarity        = "Uncommon"

    ; [ 83] Stroud Eklund — Titanium x1250  TCV=15,000  315h
    MainScript.IME_JobPool_T3[83] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[83].resourceName  = "Titanium"
    MainScript.IME_JobPool_T3[83].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T3[83].companyIndex  = 43
    MainScript.IME_JobPool_T3[83].quantity      = 1250
    MainScript.IME_JobPool_T3[83].baseValue     = 12
    MainScript.IME_JobPool_T3[83].deadlineHours = 315
    MainScript.IME_JobPool_T3[83].rarity        = "Rare"

    ; [ 84] Taiyo Astroneering — Titanium x1250  TCV=15,000  315h
    MainScript.IME_JobPool_T3[84] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[84].resourceName  = "Titanium"
    MainScript.IME_JobPool_T3[84].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T3[84].companyIndex  = 44
    MainScript.IME_JobPool_T3[84].quantity      = 1250
    MainScript.IME_JobPool_T3[84].baseValue     = 12
    MainScript.IME_JobPool_T3[84].deadlineHours = 315
    MainScript.IME_JobPool_T3[84].rarity        = "Rare"

    ; [ 85] Axion Energy — Caesium x625  TCV=15,625  441h
    MainScript.IME_JobPool_T3[85] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[85].resourceName  = "Caesium"
    MainScript.IME_JobPool_T3[85].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T3[85].companyIndex  = 7
    MainScript.IME_JobPool_T3[85].quantity      = 625
    MainScript.IME_JobPool_T3[85].baseValue     = 25
    MainScript.IME_JobPool_T3[85].deadlineHours = 441
    MainScript.IME_JobPool_T3[85].rarity        = "Exotic"

    ; [ 86] Generdyne Industries — Caesium x625  TCV=15,625  441h
    MainScript.IME_JobPool_T3[86] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[86].resourceName  = "Caesium"
    MainScript.IME_JobPool_T3[86].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T3[86].companyIndex  = 22
    MainScript.IME_JobPool_T3[86].quantity      = 625
    MainScript.IME_JobPool_T3[86].baseValue     = 25
    MainScript.IME_JobPool_T3[86].deadlineHours = 441
    MainScript.IME_JobPool_T3[86].rarity        = "Exotic"

    ; [ 87] Horizon Defence — Caesium x625  TCV=15,625  441h
    MainScript.IME_JobPool_T3[87] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[87].resourceName  = "Caesium"
    MainScript.IME_JobPool_T3[87].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T3[87].companyIndex  = 24
    MainScript.IME_JobPool_T3[87].quantity      = 625
    MainScript.IME_JobPool_T3[87].baseValue     = 25
    MainScript.IME_JobPool_T3[87].deadlineHours = 441
    MainScript.IME_JobPool_T3[87].rarity        = "Exotic"

    ; [ 88] Horizon Defence — Palladium x625  TCV=15,625  441h
    MainScript.IME_JobPool_T3[88] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[88].resourceName  = "Palladium"
    MainScript.IME_JobPool_T3[88].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T3[88].companyIndex  = 24
    MainScript.IME_JobPool_T3[88].quantity      = 625
    MainScript.IME_JobPool_T3[88].baseValue     = 25
    MainScript.IME_JobPool_T3[88].deadlineHours = 441
    MainScript.IME_JobPool_T3[88].rarity        = "Exotic"

    ; [ 89] Shinigami — Palladium x625  TCV=15,625  441h
    MainScript.IME_JobPool_T3[89] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[89].resourceName  = "Palladium"
    MainScript.IME_JobPool_T3[89].companyName   = "Shinigami"
    MainScript.IME_JobPool_T3[89].companyIndex  = 39
    MainScript.IME_JobPool_T3[89].quantity      = 625
    MainScript.IME_JobPool_T3[89].baseValue     = 25
    MainScript.IME_JobPool_T3[89].deadlineHours = 441
    MainScript.IME_JobPool_T3[89].rarity        = "Exotic"

    ; [ 90] Infinity Ltd — Memory Substrate x250  TCV=16,250  630h
    MainScript.IME_JobPool_T3[90] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[90].resourceName  = "Memory Substrate"
    MainScript.IME_JobPool_T3[90].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T3[90].companyIndex  = 25
    MainScript.IME_JobPool_T3[90].quantity      = 250
    MainScript.IME_JobPool_T3[90].baseValue     = 65
    MainScript.IME_JobPool_T3[90].deadlineHours = 630
    MainScript.IME_JobPool_T3[90].rarity        = "Unique"

    ; [ 91] Vanguard — Sterile Nanotubes x125  TCV=16,250  294h
    MainScript.IME_JobPool_T3[91] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[91].resourceName  = "Sterile Nanotubes"
    MainScript.IME_JobPool_T3[91].companyName   = "Vanguard"
    MainScript.IME_JobPool_T3[91].companyIndex  = 46
    MainScript.IME_JobPool_T3[91].quantity      = 125
    MainScript.IME_JobPool_T3[91].baseValue     = 130
    MainScript.IME_JobPool_T3[91].deadlineHours = 294
    MainScript.IME_JobPool_T3[91].rarity        = "Exotic"

    ; [ 92] Chunks — Gastronomic Delight x250  TCV=16,500  630h
    MainScript.IME_JobPool_T3[92] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[92].resourceName  = "Gastronomic Delight"
    MainScript.IME_JobPool_T3[92].companyName   = "Chunks"
    MainScript.IME_JobPool_T3[92].companyIndex  = 12
    MainScript.IME_JobPool_T3[92].quantity      = 250
    MainScript.IME_JobPool_T3[92].baseValue     = 66
    MainScript.IME_JobPool_T3[92].deadlineHours = 630
    MainScript.IME_JobPool_T3[92].rarity        = "Unique"

    ; [ 93] Chunks — Membrane x1875  TCV=16,875  252h
    MainScript.IME_JobPool_T3[93] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[93].resourceName  = "Membrane"
    MainScript.IME_JobPool_T3[93].companyName   = "Chunks"
    MainScript.IME_JobPool_T3[93].companyIndex  = 12
    MainScript.IME_JobPool_T3[93].quantity      = 1875
    MainScript.IME_JobPool_T3[93].baseValue     = 9
    MainScript.IME_JobPool_T3[93].deadlineHours = 252
    MainScript.IME_JobPool_T3[93].rarity        = "Uncommon"

    ; [ 94] Reliant Medical — Membrane x1875  TCV=16,875  252h
    MainScript.IME_JobPool_T3[94] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[94].resourceName  = "Membrane"
    MainScript.IME_JobPool_T3[94].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[94].companyIndex  = 36
    MainScript.IME_JobPool_T3[94].quantity      = 1875
    MainScript.IME_JobPool_T3[94].baseValue     = 9
    MainScript.IME_JobPool_T3[94].deadlineHours = 252
    MainScript.IME_JobPool_T3[94].rarity        = "Uncommon"

    ; [ 95] Arc Might — Xenon x625  TCV=16,875  441h
    MainScript.IME_JobPool_T3[95] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[95].resourceName  = "Xenon"
    MainScript.IME_JobPool_T3[95].companyName   = "Arc Might"
    MainScript.IME_JobPool_T3[95].companyIndex  = 4
    MainScript.IME_JobPool_T3[95].quantity      = 625
    MainScript.IME_JobPool_T3[95].baseValue     = 27
    MainScript.IME_JobPool_T3[95].deadlineHours = 441
    MainScript.IME_JobPool_T3[95].rarity        = "Exotic"

    ; [ 96] Arc Might — Aluminum x2500  TCV=17,500  189h
    MainScript.IME_JobPool_T3[96] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[96].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T3[96].companyName   = "Arc Might"
    MainScript.IME_JobPool_T3[96].companyIndex  = 4
    MainScript.IME_JobPool_T3[96].quantity      = 2500
    MainScript.IME_JobPool_T3[96].baseValue     = 7
    MainScript.IME_JobPool_T3[96].deadlineHours = 189
    MainScript.IME_JobPool_T3[96].rarity        = "Common"

    ; [ 97] Deimos Staryards — Aluminum x2500  TCV=17,500  189h
    MainScript.IME_JobPool_T3[97] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[97].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T3[97].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T3[97].companyIndex  = 16
    MainScript.IME_JobPool_T3[97].quantity      = 2500
    MainScript.IME_JobPool_T3[97].baseValue     = 7
    MainScript.IME_JobPool_T3[97].deadlineHours = 189
    MainScript.IME_JobPool_T3[97].rarity        = "Common"

    ; [ 98] Hopetech — Aluminum x2500  TCV=17,500  189h
    MainScript.IME_JobPool_T3[98] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[98].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T3[98].companyName   = "Hopetech"
    MainScript.IME_JobPool_T3[98].companyIndex  = 23
    MainScript.IME_JobPool_T3[98].quantity      = 2500
    MainScript.IME_JobPool_T3[98].baseValue     = 7
    MainScript.IME_JobPool_T3[98].deadlineHours = 189
    MainScript.IME_JobPool_T3[98].rarity        = "Common"

    ; [ 99] Stroud Eklund — Aluminum x2500  TCV=17,500  189h
    MainScript.IME_JobPool_T3[99] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[99].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T3[99].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T3[99].companyIndex  = 43
    MainScript.IME_JobPool_T3[99].quantity      = 2500
    MainScript.IME_JobPool_T3[99].baseValue     = 7
    MainScript.IME_JobPool_T3[99].deadlineHours = 189
    MainScript.IME_JobPool_T3[99].rarity        = "Common"

    ; [100] Taiyo Astroneering — Aluminum x2500  TCV=17,500  189h
    MainScript.IME_JobPool_T3[100] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[100].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T3[100].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T3[100].companyIndex  = 44
    MainScript.IME_JobPool_T3[100].quantity      = 2500
    MainScript.IME_JobPool_T3[100].baseValue     = 7
    MainScript.IME_JobPool_T3[100].deadlineHours = 189
    MainScript.IME_JobPool_T3[100].rarity        = "Common"

    ; [101] Arc Might — Lithium x1250  TCV=17,500  315h
    MainScript.IME_JobPool_T3[101] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[101].resourceName  = "Lithium"
    MainScript.IME_JobPool_T3[101].companyName   = "Arc Might"
    MainScript.IME_JobPool_T3[101].companyIndex  = 4
    MainScript.IME_JobPool_T3[101].quantity      = 1250
    MainScript.IME_JobPool_T3[101].baseValue     = 14
    MainScript.IME_JobPool_T3[101].deadlineHours = 315
    MainScript.IME_JobPool_T3[101].rarity        = "Rare"

    ; [102] Deimos Staryards — Lithium x1250  TCV=17,500  315h
    MainScript.IME_JobPool_T3[102] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[102].resourceName  = "Lithium"
    MainScript.IME_JobPool_T3[102].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T3[102].companyIndex  = 16
    MainScript.IME_JobPool_T3[102].quantity      = 1250
    MainScript.IME_JobPool_T3[102].baseValue     = 14
    MainScript.IME_JobPool_T3[102].deadlineHours = 315
    MainScript.IME_JobPool_T3[102].rarity        = "Rare"

    ; [103] Arc Might — Structural Material x2500  TCV=17,500  189h
    MainScript.IME_JobPool_T3[103] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[103].resourceName  = "Structural Material"
    MainScript.IME_JobPool_T3[103].companyName   = "Arc Might"
    MainScript.IME_JobPool_T3[103].companyIndex  = 4
    MainScript.IME_JobPool_T3[103].quantity      = 2500
    MainScript.IME_JobPool_T3[103].baseValue     = 7
    MainScript.IME_JobPool_T3[103].deadlineHours = 189
    MainScript.IME_JobPool_T3[103].rarity        = "Common"

    ; [104] Combatech — Isocentered Magnet x500  TCV=18,000  126h
    MainScript.IME_JobPool_T3[104] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[104].resourceName  = "Isocentered Magnet"
    MainScript.IME_JobPool_T3[104].companyName   = "Combatech"
    MainScript.IME_JobPool_T3[104].companyIndex  = 13
    MainScript.IME_JobPool_T3[104].quantity      = 500
    MainScript.IME_JobPool_T3[104].baseValue     = 36
    MainScript.IME_JobPool_T3[104].deadlineHours = 126
    MainScript.IME_JobPool_T3[104].rarity        = "Common"

    ; [105] Muybridge Pharmaceuticals — Antimicrobial x1875  TCV=18,750  252h
    MainScript.IME_JobPool_T3[105] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[105].resourceName  = "Antimicrobial"
    MainScript.IME_JobPool_T3[105].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T3[105].companyIndex  = 30
    MainScript.IME_JobPool_T3[105].quantity      = 1875
    MainScript.IME_JobPool_T3[105].baseValue     = 10
    MainScript.IME_JobPool_T3[105].deadlineHours = 252
    MainScript.IME_JobPool_T3[105].rarity        = "Uncommon"

    ; [106] Dogstar — Antimony x625  TCV=18,750  441h
    MainScript.IME_JobPool_T3[106] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[106].resourceName  = "Antimony"
    MainScript.IME_JobPool_T3[106].companyName   = "Dogstar"
    MainScript.IME_JobPool_T3[106].companyIndex  = 17
    MainScript.IME_JobPool_T3[106].quantity      = 625
    MainScript.IME_JobPool_T3[106].baseValue     = 30
    MainScript.IME_JobPool_T3[106].deadlineHours = 441
    MainScript.IME_JobPool_T3[106].rarity        = "Exotic"

    ; [107] Celtcorp — Mag Pressure Tank x750  TCV=18,750  202h
    MainScript.IME_JobPool_T3[107] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[107].resourceName  = "Mag Pressure Tank"
    MainScript.IME_JobPool_T3[107].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T3[107].companyIndex  = 9
    MainScript.IME_JobPool_T3[107].quantity      = 750
    MainScript.IME_JobPool_T3[107].baseValue     = 25
    MainScript.IME_JobPool_T3[107].deadlineHours = 202
    MainScript.IME_JobPool_T3[107].rarity        = "Uncommon"

    ; [108] Eit Clothiers — Pigment x1875  TCV=18,750  252h
    MainScript.IME_JobPool_T3[108] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[108].resourceName  = "Pigment"
    MainScript.IME_JobPool_T3[108].companyName   = "Eit Clothiers"
    MainScript.IME_JobPool_T3[108].companyIndex  = 18
    MainScript.IME_JobPool_T3[108].quantity      = 1875
    MainScript.IME_JobPool_T3[108].baseValue     = 10
    MainScript.IME_JobPool_T3[108].deadlineHours = 252
    MainScript.IME_JobPool_T3[108].rarity        = "Uncommon"

    ; [109] Armco — Iron x2500  TCV=20,000  189h
    MainScript.IME_JobPool_T3[109] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[109].resourceName  = "Iron"
    MainScript.IME_JobPool_T3[109].companyName   = "Armco"
    MainScript.IME_JobPool_T3[109].companyIndex  = 6
    MainScript.IME_JobPool_T3[109].quantity      = 2500
    MainScript.IME_JobPool_T3[109].baseValue     = 8
    MainScript.IME_JobPool_T3[109].deadlineHours = 189
    MainScript.IME_JobPool_T3[109].rarity        = "Common"

    ; [110] Nova Galactic — Iron x2500  TCV=20,000  189h
    MainScript.IME_JobPool_T3[110] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[110].resourceName  = "Iron"
    MainScript.IME_JobPool_T3[110].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T3[110].companyIndex  = 32
    MainScript.IME_JobPool_T3[110].quantity      = 2500
    MainScript.IME_JobPool_T3[110].baseValue     = 8
    MainScript.IME_JobPool_T3[110].deadlineHours = 189
    MainScript.IME_JobPool_T3[110].rarity        = "Common"

    ; [111] Stroud Eklund — Iron x2500  TCV=20,000  189h
    MainScript.IME_JobPool_T3[111] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[111].resourceName  = "Iron"
    MainScript.IME_JobPool_T3[111].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T3[111].companyIndex  = 43
    MainScript.IME_JobPool_T3[111].quantity      = 2500
    MainScript.IME_JobPool_T3[111].baseValue     = 8
    MainScript.IME_JobPool_T3[111].deadlineHours = 189
    MainScript.IME_JobPool_T3[111].rarity        = "Common"

    ; [112] Taiyo Astroneering — Iron x2500  TCV=20,000  189h
    MainScript.IME_JobPool_T3[112] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[112].resourceName  = "Iron"
    MainScript.IME_JobPool_T3[112].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T3[112].companyIndex  = 44
    MainScript.IME_JobPool_T3[112].quantity      = 2500
    MainScript.IME_JobPool_T3[112].baseValue     = 8
    MainScript.IME_JobPool_T3[112].deadlineHours = 189
    MainScript.IME_JobPool_T3[112].rarity        = "Common"

    ; [113] Trident Luxury Lines — Iron x2500  TCV=20,000  189h
    MainScript.IME_JobPool_T3[113] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[113].resourceName  = "Iron"
    MainScript.IME_JobPool_T3[113].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T3[113].companyIndex  = 45
    MainScript.IME_JobPool_T3[113].quantity      = 2500
    MainScript.IME_JobPool_T3[113].baseValue     = 8
    MainScript.IME_JobPool_T3[113].deadlineHours = 189
    MainScript.IME_JobPool_T3[113].rarity        = "Common"

    ; [114] Arc Might — Water x5000  TCV=20,000  252h
    MainScript.IME_JobPool_T3[114] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[114].resourceName  = "Water"
    MainScript.IME_JobPool_T3[114].companyName   = "Arc Might"
    MainScript.IME_JobPool_T3[114].companyIndex  = 4
    MainScript.IME_JobPool_T3[114].quantity      = 5000
    MainScript.IME_JobPool_T3[114].baseValue     = 4
    MainScript.IME_JobPool_T3[114].deadlineHours = 252
    MainScript.IME_JobPool_T3[114].rarity        = "Common"

    ; [115] Chunks — Spice x1875  TCV=20,625  252h
    MainScript.IME_JobPool_T3[115] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[115].resourceName  = "Spice"
    MainScript.IME_JobPool_T3[115].companyName   = "Chunks"
    MainScript.IME_JobPool_T3[115].companyIndex  = 12
    MainScript.IME_JobPool_T3[115].quantity      = 1875
    MainScript.IME_JobPool_T3[115].baseValue     = 11
    MainScript.IME_JobPool_T3[115].deadlineHours = 252
    MainScript.IME_JobPool_T3[115].rarity        = "Uncommon"

    ; [116] Generdyne Industries — Control Rod x125  TCV=22,500  294h
    MainScript.IME_JobPool_T3[116] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[116].resourceName  = "Control Rod"
    MainScript.IME_JobPool_T3[116].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T3[116].companyIndex  = 22
    MainScript.IME_JobPool_T3[116].quantity      = 125
    MainScript.IME_JobPool_T3[116].baseValue     = 180
    MainScript.IME_JobPool_T3[116].deadlineHours = 294
    MainScript.IME_JobPool_T3[116].rarity        = "Exotic"

    ; [117] Arc Might — Lubricant x1250  TCV=22,500  588h
    MainScript.IME_JobPool_T3[117] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[117].resourceName  = "Lubricant"
    MainScript.IME_JobPool_T3[117].companyName   = "Arc Might"
    MainScript.IME_JobPool_T3[117].companyIndex  = 4
    MainScript.IME_JobPool_T3[117].quantity      = 1250
    MainScript.IME_JobPool_T3[117].baseValue     = 18
    MainScript.IME_JobPool_T3[117].deadlineHours = 588
    MainScript.IME_JobPool_T3[117].rarity        = "Exotic"

    ; [118] Reliant Medical — Metabolic Agent x2500  TCV=22,500  189h
    MainScript.IME_JobPool_T3[118] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[118].resourceName  = "Metabolic Agent"
    MainScript.IME_JobPool_T3[118].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[118].companyIndex  = 36
    MainScript.IME_JobPool_T3[118].quantity      = 2500
    MainScript.IME_JobPool_T3[118].baseValue     = 9
    MainScript.IME_JobPool_T3[118].deadlineHours = 189
    MainScript.IME_JobPool_T3[118].rarity        = "Common"

    ; [119] Reliant Medical — Tetrafluorides x1250  TCV=22,500  315h
    MainScript.IME_JobPool_T3[119] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[119].resourceName  = "Tetrafluorides"
    MainScript.IME_JobPool_T3[119].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T3[119].companyIndex  = 36
    MainScript.IME_JobPool_T3[119].quantity      = 1250
    MainScript.IME_JobPool_T3[119].baseValue     = 18
    MainScript.IME_JobPool_T3[119].deadlineHours = 315
    MainScript.IME_JobPool_T3[119].rarity        = "Rare"

    ; [120] Axion Energy — Molecular Sieve x250  TCV=22,750  210h
    MainScript.IME_JobPool_T3[120] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[120].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T3[120].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T3[120].companyIndex  = 7
    MainScript.IME_JobPool_T3[120].quantity      = 250
    MainScript.IME_JobPool_T3[120].baseValue     = 91
    MainScript.IME_JobPool_T3[120].deadlineHours = 210
    MainScript.IME_JobPool_T3[120].rarity        = "Rare"

    ; [121] Lunar Robotics — Molecular Sieve x250  TCV=22,750  210h
    MainScript.IME_JobPool_T3[121] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[121].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T3[121].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T3[121].companyIndex  = 29
    MainScript.IME_JobPool_T3[121].quantity      = 250
    MainScript.IME_JobPool_T3[121].baseValue     = 91
    MainScript.IME_JobPool_T3[121].deadlineHours = 210
    MainScript.IME_JobPool_T3[121].rarity        = "Rare"

    ; [122] Light Scythe — Zero-G Gimbal x250  TCV=23,250  210h
    MainScript.IME_JobPool_T3[122] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[122].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T3[122].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T3[122].companyIndex  = 28
    MainScript.IME_JobPool_T3[122].quantity      = 250
    MainScript.IME_JobPool_T3[122].baseValue     = 93
    MainScript.IME_JobPool_T3[122].deadlineHours = 210
    MainScript.IME_JobPool_T3[122].rarity        = "Rare"

    ; [123] Shinigami — Zero-G Gimbal x250  TCV=23,250  210h
    MainScript.IME_JobPool_T3[123] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[123].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T3[123].companyName   = "Shinigami"
    MainScript.IME_JobPool_T3[123].companyIndex  = 39
    MainScript.IME_JobPool_T3[123].quantity      = 250
    MainScript.IME_JobPool_T3[123].baseValue     = 93
    MainScript.IME_JobPool_T3[123].deadlineHours = 210
    MainScript.IME_JobPool_T3[123].rarity        = "Rare"

    ; [124] Vanguard — Zero-G Gimbal x250  TCV=23,250  210h
    MainScript.IME_JobPool_T3[124] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[124].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T3[124].companyName   = "Vanguard"
    MainScript.IME_JobPool_T3[124].companyIndex  = 46
    MainScript.IME_JobPool_T3[124].quantity      = 250
    MainScript.IME_JobPool_T3[124].baseValue     = 93
    MainScript.IME_JobPool_T3[124].deadlineHours = 210
    MainScript.IME_JobPool_T3[124].rarity        = "Rare"

    ; [125] Stroud Eklund — Ytterbium x625  TCV=23,750  441h
    MainScript.IME_JobPool_T3[125] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[125].resourceName  = "Ytterbium"
    MainScript.IME_JobPool_T3[125].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T3[125].companyIndex  = 43
    MainScript.IME_JobPool_T3[125].quantity      = 625
    MainScript.IME_JobPool_T3[125].baseValue     = 38
    MainScript.IME_JobPool_T3[125].deadlineHours = 441
    MainScript.IME_JobPool_T3[125].rarity        = "Exotic"

    ; [126] Trident Luxury Lines — Adaptive Frame x1000  TCV=24,000  151h
    MainScript.IME_JobPool_T3[126] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[126].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T3[126].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T3[126].companyIndex  = 45
    MainScript.IME_JobPool_T3[126].quantity      = 1000
    MainScript.IME_JobPool_T3[126].baseValue     = 24
    MainScript.IME_JobPool_T3[126].deadlineHours = 151
    MainScript.IME_JobPool_T3[126].rarity        = "Common"

    ; [127] Infinity Ltd — Indicite Wafer x100  TCV=24,300  504h
    MainScript.IME_JobPool_T3[127] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T3[127].resourceName  = "Indicite Wafer"
    MainScript.IME_JobPool_T3[127].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T3[127].companyIndex  = 25
    MainScript.IME_JobPool_T3[127].quantity      = 100
    MainScript.IME_JobPool_T3[127].baseValue     = 243
    MainScript.IME_JobPool_T3[127].deadlineHours = 504
    MainScript.IME_JobPool_T3[127].rarity        = "Unique"

EndFunction

; ── TIER 4 (128 jobs | TCV 25,000 - 93,750) ──────────────────────────────────────────
Function InitTier4Jobs()
    MainScript.IME_Tier4_JobCount = 128
    MainScript.IME_JobPool_T4 = new IME_MainQuestScript:JobTemplate[128]

    ; [  0] Arc Might — Copper x2500  TCV=25,000  189h
    MainScript.IME_JobPool_T4[0] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[0].resourceName  = "Copper"
    MainScript.IME_JobPool_T4[0].companyName   = "Arc Might"
    MainScript.IME_JobPool_T4[0].companyIndex  = 4
    MainScript.IME_JobPool_T4[0].quantity      = 2500
    MainScript.IME_JobPool_T4[0].baseValue     = 10
    MainScript.IME_JobPool_T4[0].deadlineHours = 189
    MainScript.IME_JobPool_T4[0].rarity        = "Common"

    ; [  1] Slayton Aerospace — Europium x625  TCV=25,000  441h
    MainScript.IME_JobPool_T4[1] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[1].resourceName  = "Europium"
    MainScript.IME_JobPool_T4[1].companyName   = "Slayton Aerospace"
    MainScript.IME_JobPool_T4[1].companyIndex  = 41
    MainScript.IME_JobPool_T4[1].quantity      = 625
    MainScript.IME_JobPool_T4[1].baseValue     = 40
    MainScript.IME_JobPool_T4[1].deadlineHours = 441
    MainScript.IME_JobPool_T4[1].rarity        = "Exotic"

    ; [  2] Axion Energy — Isotopic Coolant x1000  TCV=25,000  151h
    MainScript.IME_JobPool_T4[2] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[2].resourceName  = "Isotopic Coolant"
    MainScript.IME_JobPool_T4[2].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T4[2].companyIndex  = 7
    MainScript.IME_JobPool_T4[2].quantity      = 1000
    MainScript.IME_JobPool_T4[2].baseValue     = 25
    MainScript.IME_JobPool_T4[2].deadlineHours = 151
    MainScript.IME_JobPool_T4[2].rarity        = "Common"

    ; [  3] Panoptes — Isotopic Coolant x1000  TCV=25,000  151h
    MainScript.IME_JobPool_T4[3] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[3].resourceName  = "Isotopic Coolant"
    MainScript.IME_JobPool_T4[3].companyName   = "Panoptes"
    MainScript.IME_JobPool_T4[3].companyIndex  = 33
    MainScript.IME_JobPool_T4[3].quantity      = 1000
    MainScript.IME_JobPool_T4[3].baseValue     = 25
    MainScript.IME_JobPool_T4[3].deadlineHours = 151
    MainScript.IME_JobPool_T4[3].rarity        = "Common"

    ; [  4] Reladyne — Isotopic Coolant x1000  TCV=25,000  151h
    MainScript.IME_JobPool_T4[4] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[4].resourceName  = "Isotopic Coolant"
    MainScript.IME_JobPool_T4[4].companyName   = "Reladyne"
    MainScript.IME_JobPool_T4[4].companyIndex  = 35
    MainScript.IME_JobPool_T4[4].quantity      = 1000
    MainScript.IME_JobPool_T4[4].baseValue     = 25
    MainScript.IME_JobPool_T4[4].deadlineHours = 151
    MainScript.IME_JobPool_T4[4].rarity        = "Common"

    ; [  5] Arc Might — Neodymium x1250  TCV=25,000  315h
    MainScript.IME_JobPool_T4[5] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[5].resourceName  = "Neodymium"
    MainScript.IME_JobPool_T4[5].companyName   = "Arc Might"
    MainScript.IME_JobPool_T4[5].companyIndex  = 4
    MainScript.IME_JobPool_T4[5].quantity      = 1250
    MainScript.IME_JobPool_T4[5].baseValue     = 20
    MainScript.IME_JobPool_T4[5].deadlineHours = 315
    MainScript.IME_JobPool_T4[5].rarity        = "Rare"

    ; [  6] Light Scythe — Neodymium x1250  TCV=25,000  315h
    MainScript.IME_JobPool_T4[6] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[6].resourceName  = "Neodymium"
    MainScript.IME_JobPool_T4[6].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T4[6].companyIndex  = 28
    MainScript.IME_JobPool_T4[6].quantity      = 1250
    MainScript.IME_JobPool_T4[6].baseValue     = 20
    MainScript.IME_JobPool_T4[6].deadlineHours = 315
    MainScript.IME_JobPool_T4[6].rarity        = "Rare"

    ; [  7] Argos Extractors — Nickel x2500  TCV=25,000  189h
    MainScript.IME_JobPool_T4[7] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[7].resourceName  = "Nickel"
    MainScript.IME_JobPool_T4[7].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T4[7].companyIndex  = 5
    MainScript.IME_JobPool_T4[7].quantity      = 2500
    MainScript.IME_JobPool_T4[7].baseValue     = 10
    MainScript.IME_JobPool_T4[7].deadlineHours = 189
    MainScript.IME_JobPool_T4[7].rarity        = "Common"

    ; [  8] Chunks — Nutrient x5000  TCV=25,000  252h
    MainScript.IME_JobPool_T4[8] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[8].resourceName  = "Nutrient"
    MainScript.IME_JobPool_T4[8].companyName   = "Chunks"
    MainScript.IME_JobPool_T4[8].companyIndex  = 12
    MainScript.IME_JobPool_T4[8].quantity      = 5000
    MainScript.IME_JobPool_T4[8].baseValue     = 5
    MainScript.IME_JobPool_T4[8].deadlineHours = 252
    MainScript.IME_JobPool_T4[8].rarity        = "Common"

    ; [  9] Ryujin — Reactive Gauge x1000  TCV=25,000  151h
    MainScript.IME_JobPool_T4[9] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[9].resourceName  = "Reactive Gauge"
    MainScript.IME_JobPool_T4[9].companyName   = "Ryujin"
    MainScript.IME_JobPool_T4[9].companyIndex  = 37
    MainScript.IME_JobPool_T4[9].quantity      = 1000
    MainScript.IME_JobPool_T4[9].baseValue     = 25
    MainScript.IME_JobPool_T4[9].deadlineHours = 151
    MainScript.IME_JobPool_T4[9].rarity        = "Common"

    ; [ 10] Muybridge Pharmaceuticals — Stimulant x1250  TCV=25,000  588h
    MainScript.IME_JobPool_T4[10] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[10].resourceName  = "Stimulant"
    MainScript.IME_JobPool_T4[10].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T4[10].companyIndex  = 30
    MainScript.IME_JobPool_T4[10].quantity      = 1250
    MainScript.IME_JobPool_T4[10].baseValue     = 20
    MainScript.IME_JobPool_T4[10].deadlineHours = 588
    MainScript.IME_JobPool_T4[10].rarity        = "Exotic"

    ; [ 11] Allied Armaments — Zero Wire x500  TCV=26,000  126h
    MainScript.IME_JobPool_T4[11] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[11].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T4[11].companyName   = "Allied Armaments"
    MainScript.IME_JobPool_T4[11].companyIndex  = 2
    MainScript.IME_JobPool_T4[11].quantity      = 500
    MainScript.IME_JobPool_T4[11].baseValue     = 52
    MainScript.IME_JobPool_T4[11].deadlineHours = 126
    MainScript.IME_JobPool_T4[11].rarity        = "Common"

    ; [ 12] Nova Galactic — Zero Wire x500  TCV=26,000  126h
    MainScript.IME_JobPool_T4[12] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[12].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T4[12].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T4[12].companyIndex  = 32
    MainScript.IME_JobPool_T4[12].quantity      = 500
    MainScript.IME_JobPool_T4[12].baseValue     = 52
    MainScript.IME_JobPool_T4[12].deadlineHours = 126
    MainScript.IME_JobPool_T4[12].rarity        = "Common"

    ; [ 13] Ryujin — Chlorosilanes x1875  TCV=26,250  252h
    MainScript.IME_JobPool_T4[13] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[13].resourceName  = "Chlorosilanes"
    MainScript.IME_JobPool_T4[13].companyName   = "Ryujin"
    MainScript.IME_JobPool_T4[13].companyIndex  = 37
    MainScript.IME_JobPool_T4[13].quantity      = 1875
    MainScript.IME_JobPool_T4[13].baseValue     = 14
    MainScript.IME_JobPool_T4[13].deadlineHours = 252
    MainScript.IME_JobPool_T4[13].rarity        = "Uncommon"

    ; [ 14] Horizon Defence — Iridium x1875  TCV=26,250  252h
    MainScript.IME_JobPool_T4[14] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[14].resourceName  = "Iridium"
    MainScript.IME_JobPool_T4[14].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T4[14].companyIndex  = 24
    MainScript.IME_JobPool_T4[14].quantity      = 1875
    MainScript.IME_JobPool_T4[14].baseValue     = 14
    MainScript.IME_JobPool_T4[14].deadlineHours = 252
    MainScript.IME_JobPool_T4[14].rarity        = "Uncommon"

    ; [ 15] Celtcorp — Microsecond Regulator x125  TCV=26,500  294h
    MainScript.IME_JobPool_T4[15] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[15].resourceName  = "Microsecond Regulator"
    MainScript.IME_JobPool_T4[15].companyName   = "Celtcorp"
    MainScript.IME_JobPool_T4[15].companyIndex  = 9
    MainScript.IME_JobPool_T4[15].quantity      = 125
    MainScript.IME_JobPool_T4[15].baseValue     = 212
    MainScript.IME_JobPool_T4[15].deadlineHours = 294
    MainScript.IME_JobPool_T4[15].rarity        = "Exotic"

    ; [ 16] Lunar Robotics — Microsecond Regulator x125  TCV=26,500  294h
    MainScript.IME_JobPool_T4[16] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[16].resourceName  = "Microsecond Regulator"
    MainScript.IME_JobPool_T4[16].companyName   = "Lunar Robotics"
    MainScript.IME_JobPool_T4[16].companyIndex  = 29
    MainScript.IME_JobPool_T4[16].quantity      = 125
    MainScript.IME_JobPool_T4[16].baseValue     = 212
    MainScript.IME_JobPool_T4[16].deadlineHours = 294
    MainScript.IME_JobPool_T4[16].rarity        = "Exotic"

    ; [ 17] Ryujin — Substrate Molecule Sieve x100  TCV=27,400  504h
    MainScript.IME_JobPool_T4[17] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[17].resourceName  = "Substrate Molecule Sieve"
    MainScript.IME_JobPool_T4[17].companyName   = "Ryujin"
    MainScript.IME_JobPool_T4[17].companyIndex  = 37
    MainScript.IME_JobPool_T4[17].quantity      = 100
    MainScript.IME_JobPool_T4[17].baseValue     = 274
    MainScript.IME_JobPool_T4[17].deadlineHours = 504
    MainScript.IME_JobPool_T4[17].rarity        = "Unique"

    ; [ 18] Deimos Staryards — Supercooled Magnet x250  TCV=27,750  210h
    MainScript.IME_JobPool_T4[18] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[18].resourceName  = "Supercooled Magnet"
    MainScript.IME_JobPool_T4[18].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T4[18].companyIndex  = 16
    MainScript.IME_JobPool_T4[18].quantity      = 250
    MainScript.IME_JobPool_T4[18].baseValue     = 111
    MainScript.IME_JobPool_T4[18].deadlineHours = 210
    MainScript.IME_JobPool_T4[18].rarity        = "Rare"

    ; [ 19] Hopetech — Supercooled Magnet x250  TCV=27,750  210h
    MainScript.IME_JobPool_T4[19] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[19].resourceName  = "Supercooled Magnet"
    MainScript.IME_JobPool_T4[19].companyName   = "Hopetech"
    MainScript.IME_JobPool_T4[19].companyIndex  = 23
    MainScript.IME_JobPool_T4[19].quantity      = 250
    MainScript.IME_JobPool_T4[19].baseValue     = 111
    MainScript.IME_JobPool_T4[19].deadlineHours = 210
    MainScript.IME_JobPool_T4[19].rarity        = "Rare"

    ; [ 20] Nova Galactic — Supercooled Magnet x250  TCV=27,750  210h
    MainScript.IME_JobPool_T4[20] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[20].resourceName  = "Supercooled Magnet"
    MainScript.IME_JobPool_T4[20].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T4[20].companyIndex  = 32
    MainScript.IME_JobPool_T4[20].quantity      = 250
    MainScript.IME_JobPool_T4[20].baseValue     = 111
    MainScript.IME_JobPool_T4[20].deadlineHours = 210
    MainScript.IME_JobPool_T4[20].rarity        = "Rare"

    ; [ 21] Trident Luxury Lines — Supercooled Magnet x250  TCV=27,750  210h
    MainScript.IME_JobPool_T4[21] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[21].resourceName  = "Supercooled Magnet"
    MainScript.IME_JobPool_T4[21].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T4[21].companyIndex  = 45
    MainScript.IME_JobPool_T4[21].quantity      = 250
    MainScript.IME_JobPool_T4[21].baseValue     = 111
    MainScript.IME_JobPool_T4[21].deadlineHours = 210
    MainScript.IME_JobPool_T4[21].rarity        = "Rare"

    ; [ 22] Shinigami — Monopropellant x375  TCV=28,500  168h
    MainScript.IME_JobPool_T4[22] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[22].resourceName  = "Monopropellant"
    MainScript.IME_JobPool_T4[22].companyName   = "Shinigami"
    MainScript.IME_JobPool_T4[22].companyIndex  = 39
    MainScript.IME_JobPool_T4[22].quantity      = 375
    MainScript.IME_JobPool_T4[22].baseValue     = 76
    MainScript.IME_JobPool_T4[22].deadlineHours = 168
    MainScript.IME_JobPool_T4[22].rarity        = "Uncommon"

    ; [ 23] Amun Dunn — Ionic Liquids x1250  TCV=28,750  588h
    MainScript.IME_JobPool_T4[23] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[23].resourceName  = "Ionic Liquids"
    MainScript.IME_JobPool_T4[23].companyName   = "Amun Dunn"
    MainScript.IME_JobPool_T4[23].companyIndex  = 3
    MainScript.IME_JobPool_T4[23].quantity      = 1250
    MainScript.IME_JobPool_T4[23].baseValue     = 23
    MainScript.IME_JobPool_T4[23].deadlineHours = 588
    MainScript.IME_JobPool_T4[23].rarity        = "Exotic"

    ; [ 24] Horizon Defence — Tantalum x1250  TCV=28,750  315h
    MainScript.IME_JobPool_T4[24] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[24].resourceName  = "Tantalum"
    MainScript.IME_JobPool_T4[24].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T4[24].companyIndex  = 24
    MainScript.IME_JobPool_T4[24].quantity      = 1250
    MainScript.IME_JobPool_T4[24].baseValue     = 23
    MainScript.IME_JobPool_T4[24].deadlineHours = 315
    MainScript.IME_JobPool_T4[24].rarity        = "Rare"

    ; [ 25] Shinigami — Tantalum x1250  TCV=28,750  315h
    MainScript.IME_JobPool_T4[25] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[25].resourceName  = "Tantalum"
    MainScript.IME_JobPool_T4[25].companyName   = "Shinigami"
    MainScript.IME_JobPool_T4[25].companyIndex  = 39
    MainScript.IME_JobPool_T4[25].quantity      = 1250
    MainScript.IME_JobPool_T4[25].baseValue     = 23
    MainScript.IME_JobPool_T4[25].deadlineHours = 315
    MainScript.IME_JobPool_T4[25].rarity        = "Rare"

    ; [ 26] Reliant Medical — Immunostimulant x500  TCV=29,000  840h
    MainScript.IME_JobPool_T4[26] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[26].resourceName  = "Immunostimulant"
    MainScript.IME_JobPool_T4[26].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T4[26].companyIndex  = 36
    MainScript.IME_JobPool_T4[26].quantity      = 500
    MainScript.IME_JobPool_T4[26].baseValue     = 58
    MainScript.IME_JobPool_T4[26].deadlineHours = 840
    MainScript.IME_JobPool_T4[26].rarity        = "Unique"

    ; [ 27] Axion Energy — Vytinium x250  TCV=29,000  630h
    MainScript.IME_JobPool_T4[27] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[27].resourceName  = "Vytinium"
    MainScript.IME_JobPool_T4[27].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T4[27].companyIndex  = 7
    MainScript.IME_JobPool_T4[27].quantity      = 250
    MainScript.IME_JobPool_T4[27].baseValue     = 116
    MainScript.IME_JobPool_T4[27].deadlineHours = 630
    MainScript.IME_JobPool_T4[27].rarity        = "Unique"

    ; [ 28] Argos Extractors — Veryl-Treated Manifold x100  TCV=29,500  504h
    MainScript.IME_JobPool_T4[28] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[28].resourceName  = "Veryl-Treated Manifold"
    MainScript.IME_JobPool_T4[28].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T4[28].companyIndex  = 5
    MainScript.IME_JobPool_T4[28].quantity      = 100
    MainScript.IME_JobPool_T4[28].baseValue     = 295
    MainScript.IME_JobPool_T4[28].deadlineHours = 504
    MainScript.IME_JobPool_T4[28].rarity        = "Unique"

    ; [ 29] Vanguard — Veryl-Treated Manifold x100  TCV=29,500  504h
    MainScript.IME_JobPool_T4[29] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[29].resourceName  = "Veryl-Treated Manifold"
    MainScript.IME_JobPool_T4[29].companyName   = "Vanguard"
    MainScript.IME_JobPool_T4[29].companyIndex  = 46
    MainScript.IME_JobPool_T4[29].quantity      = 100
    MainScript.IME_JobPool_T4[29].baseValue     = 295
    MainScript.IME_JobPool_T4[29].deadlineHours = 504
    MainScript.IME_JobPool_T4[29].rarity        = "Unique"

    ; [ 30] Argos Extractors — Austenitic Manifold x375  TCV=29,625  168h
    MainScript.IME_JobPool_T4[30] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[30].resourceName  = "Austenitic Manifold"
    MainScript.IME_JobPool_T4[30].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T4[30].companyIndex  = 5
    MainScript.IME_JobPool_T4[30].quantity      = 375
    MainScript.IME_JobPool_T4[30].baseValue     = 79
    MainScript.IME_JobPool_T4[30].deadlineHours = 168
    MainScript.IME_JobPool_T4[30].rarity        = "Uncommon"

    ; [ 31] Consolidated Mining — Austenitic Manifold x375  TCV=29,625  168h
    MainScript.IME_JobPool_T4[31] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[31].resourceName  = "Austenitic Manifold"
    MainScript.IME_JobPool_T4[31].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T4[31].companyIndex  = 14
    MainScript.IME_JobPool_T4[31].quantity      = 375
    MainScript.IME_JobPool_T4[31].baseValue     = 79
    MainScript.IME_JobPool_T4[31].deadlineHours = 168
    MainScript.IME_JobPool_T4[31].rarity        = "Uncommon"

    ; [ 32] Galbank — Gold x1250  TCV=30,000  315h
    MainScript.IME_JobPool_T4[32] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[32].resourceName  = "Gold"
    MainScript.IME_JobPool_T4[32].companyName   = "Galbank"
    MainScript.IME_JobPool_T4[32].companyIndex  = 21
    MainScript.IME_JobPool_T4[32].quantity      = 1250
    MainScript.IME_JobPool_T4[32].baseValue     = 24
    MainScript.IME_JobPool_T4[32].deadlineHours = 315
    MainScript.IME_JobPool_T4[32].rarity        = "Rare"

    ; [ 33] Galbank — Platinum x1250  TCV=30,000  315h
    MainScript.IME_JobPool_T4[33] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[33].resourceName  = "Platinum"
    MainScript.IME_JobPool_T4[33].companyName   = "Galbank"
    MainScript.IME_JobPool_T4[33].companyIndex  = 21
    MainScript.IME_JobPool_T4[33].quantity      = 1250
    MainScript.IME_JobPool_T4[33].baseValue     = 24
    MainScript.IME_JobPool_T4[33].deadlineHours = 315
    MainScript.IME_JobPool_T4[33].rarity        = "Rare"

    ; [ 34] Hopetech — Sealant x5000  TCV=30,000  252h
    MainScript.IME_JobPool_T4[34] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[34].resourceName  = "Sealant"
    MainScript.IME_JobPool_T4[34].companyName   = "Hopetech"
    MainScript.IME_JobPool_T4[34].companyIndex  = 23
    MainScript.IME_JobPool_T4[34].quantity      = 5000
    MainScript.IME_JobPool_T4[34].baseValue     = 6
    MainScript.IME_JobPool_T4[34].deadlineHours = 252
    MainScript.IME_JobPool_T4[34].rarity        = "Common"

    ; [ 35] Muybridge Pharmaceuticals — Sedative x2500  TCV=30,000  420h
    MainScript.IME_JobPool_T4[35] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[35].resourceName  = "Sedative"
    MainScript.IME_JobPool_T4[35].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T4[35].companyIndex  = 30
    MainScript.IME_JobPool_T4[35].quantity      = 2500
    MainScript.IME_JobPool_T4[35].baseValue     = 12
    MainScript.IME_JobPool_T4[35].deadlineHours = 420
    MainScript.IME_JobPool_T4[35].rarity        = "Rare"

    ; [ 36] Arc Might — Titanium x2500  TCV=30,000  420h
    MainScript.IME_JobPool_T4[36] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[36].resourceName  = "Titanium"
    MainScript.IME_JobPool_T4[36].companyName   = "Arc Might"
    MainScript.IME_JobPool_T4[36].companyIndex  = 4
    MainScript.IME_JobPool_T4[36].quantity      = 2500
    MainScript.IME_JobPool_T4[36].baseValue     = 12
    MainScript.IME_JobPool_T4[36].deadlineHours = 420
    MainScript.IME_JobPool_T4[36].rarity        = "Rare"

    ; [ 37] Deimos Staryards — Titanium x2500  TCV=30,000  420h
    MainScript.IME_JobPool_T4[37] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[37].resourceName  = "Titanium"
    MainScript.IME_JobPool_T4[37].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T4[37].companyIndex  = 16
    MainScript.IME_JobPool_T4[37].quantity      = 2500
    MainScript.IME_JobPool_T4[37].baseValue     = 12
    MainScript.IME_JobPool_T4[37].deadlineHours = 420
    MainScript.IME_JobPool_T4[37].rarity        = "Rare"

    ; [ 38] Horizon Defence — Tungsten x1875  TCV=30,000  252h
    MainScript.IME_JobPool_T4[38] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[38].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T4[38].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T4[38].companyIndex  = 24
    MainScript.IME_JobPool_T4[38].quantity      = 1875
    MainScript.IME_JobPool_T4[38].baseValue     = 16
    MainScript.IME_JobPool_T4[38].deadlineHours = 252
    MainScript.IME_JobPool_T4[38].rarity        = "Uncommon"

    ; [ 39] Generdyne Industries — Tau Grade Rheostat x375  TCV=30,750  168h
    MainScript.IME_JobPool_T4[39] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[39].resourceName  = "Tau Grade Rheostat"
    MainScript.IME_JobPool_T4[39].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T4[39].companyIndex  = 22
    MainScript.IME_JobPool_T4[39].quantity      = 375
    MainScript.IME_JobPool_T4[39].baseValue     = 82
    MainScript.IME_JobPool_T4[39].deadlineHours = 168
    MainScript.IME_JobPool_T4[39].rarity        = "Uncommon"

    ; [ 40] Ryujin — High-Tensile Spidroin x500  TCV=31,000  840h
    MainScript.IME_JobPool_T4[40] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[40].resourceName  = "High-Tensile Spidroin"
    MainScript.IME_JobPool_T4[40].companyName   = "Ryujin"
    MainScript.IME_JobPool_T4[40].companyIndex  = 37
    MainScript.IME_JobPool_T4[40].quantity      = 500
    MainScript.IME_JobPool_T4[40].baseValue     = 62
    MainScript.IME_JobPool_T4[40].deadlineHours = 840
    MainScript.IME_JobPool_T4[40].rarity        = "Unique"

    ; [ 41] Light Scythe — Caesium x1250  TCV=31,250  588h
    MainScript.IME_JobPool_T4[41] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[41].resourceName  = "Caesium"
    MainScript.IME_JobPool_T4[41].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T4[41].companyIndex  = 28
    MainScript.IME_JobPool_T4[41].quantity      = 1250
    MainScript.IME_JobPool_T4[41].baseValue     = 25
    MainScript.IME_JobPool_T4[41].deadlineHours = 588
    MainScript.IME_JobPool_T4[41].rarity        = "Exotic"

    ; [ 42] Light Scythe — Palladium x1250  TCV=31,250  588h
    MainScript.IME_JobPool_T4[42] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[42].resourceName  = "Palladium"
    MainScript.IME_JobPool_T4[42].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T4[42].companyIndex  = 28
    MainScript.IME_JobPool_T4[42].quantity      = 1250
    MainScript.IME_JobPool_T4[42].baseValue     = 25
    MainScript.IME_JobPool_T4[42].deadlineHours = 588
    MainScript.IME_JobPool_T4[42].rarity        = "Exotic"

    ; [ 43] Ryujin — Memory Substrate x500  TCV=32,500  840h
    MainScript.IME_JobPool_T4[43] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[43].resourceName  = "Memory Substrate"
    MainScript.IME_JobPool_T4[43].companyName   = "Ryujin"
    MainScript.IME_JobPool_T4[43].companyIndex  = 37
    MainScript.IME_JobPool_T4[43].quantity      = 500
    MainScript.IME_JobPool_T4[43].baseValue     = 65
    MainScript.IME_JobPool_T4[43].deadlineHours = 840
    MainScript.IME_JobPool_T4[43].rarity        = "Unique"

    ; [ 44] Nautilus — Sterile Nanotubes x250  TCV=32,500  353h
    MainScript.IME_JobPool_T4[44] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[44].resourceName  = "Sterile Nanotubes"
    MainScript.IME_JobPool_T4[44].companyName   = "Nautilus"
    MainScript.IME_JobPool_T4[44].companyIndex  = 31
    MainScript.IME_JobPool_T4[44].quantity      = 250
    MainScript.IME_JobPool_T4[44].baseValue     = 130
    MainScript.IME_JobPool_T4[44].deadlineHours = 353
    MainScript.IME_JobPool_T4[44].rarity        = "Exotic"

    ; [ 45] Protectorate Systems — Sterile Nanotubes x250  TCV=32,500  353h
    MainScript.IME_JobPool_T4[45] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[45].resourceName  = "Sterile Nanotubes"
    MainScript.IME_JobPool_T4[45].companyName   = "Protectorate Systems"
    MainScript.IME_JobPool_T4[45].companyIndex  = 34
    MainScript.IME_JobPool_T4[45].quantity      = 250
    MainScript.IME_JobPool_T4[45].baseValue     = 130
    MainScript.IME_JobPool_T4[45].deadlineHours = 353
    MainScript.IME_JobPool_T4[45].rarity        = "Exotic"

    ; [ 46] Ballistics Solutions — Positron Battery x250  TCV=33,250  210h
    MainScript.IME_JobPool_T4[46] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[46].resourceName  = "Positron Battery"
    MainScript.IME_JobPool_T4[46].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T4[46].companyIndex  = 8
    MainScript.IME_JobPool_T4[46].quantity      = 250
    MainScript.IME_JobPool_T4[46].baseValue     = 133
    MainScript.IME_JobPool_T4[46].deadlineHours = 210
    MainScript.IME_JobPool_T4[46].rarity        = "Rare"

    ; [ 47] Trident Luxury Lines — Aluminum x5000  TCV=35,000  252h
    MainScript.IME_JobPool_T4[47] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[47].resourceName  = "Aluminum"
    MainScript.IME_JobPool_T4[47].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T4[47].companyIndex  = 45
    MainScript.IME_JobPool_T4[47].quantity      = 5000
    MainScript.IME_JobPool_T4[47].baseValue     = 7
    MainScript.IME_JobPool_T4[47].deadlineHours = 252
    MainScript.IME_JobPool_T4[47].rarity        = "Common"

    ; [ 48] Muybridge Pharmaceuticals — Hallucinogen x2500  TCV=35,000  420h
    MainScript.IME_JobPool_T4[48] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[48].resourceName  = "Hallucinogen"
    MainScript.IME_JobPool_T4[48].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T4[48].companyIndex  = 30
    MainScript.IME_JobPool_T4[48].quantity      = 2500
    MainScript.IME_JobPool_T4[48].baseValue     = 14
    MainScript.IME_JobPool_T4[48].deadlineHours = 420
    MainScript.IME_JobPool_T4[48].rarity        = "Rare"

    ; [ 49] Hopetech — Lithium x2500  TCV=35,000  420h
    MainScript.IME_JobPool_T4[49] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[49].resourceName  = "Lithium"
    MainScript.IME_JobPool_T4[49].companyName   = "Hopetech"
    MainScript.IME_JobPool_T4[49].companyIndex  = 23
    MainScript.IME_JobPool_T4[49].quantity      = 2500
    MainScript.IME_JobPool_T4[49].baseValue     = 14
    MainScript.IME_JobPool_T4[49].deadlineHours = 420
    MainScript.IME_JobPool_T4[49].rarity        = "Rare"

    ; [ 50] Ballistics Solutions — Uranium x2500  TCV=35,000  189h
    MainScript.IME_JobPool_T4[50] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[50].resourceName  = "Uranium"
    MainScript.IME_JobPool_T4[50].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T4[50].companyIndex  = 8
    MainScript.IME_JobPool_T4[50].quantity      = 2500
    MainScript.IME_JobPool_T4[50].baseValue     = 14
    MainScript.IME_JobPool_T4[50].deadlineHours = 189
    MainScript.IME_JobPool_T4[50].rarity        = "Common"

    ; [ 51] Horizon Defence — Uranium x2500  TCV=35,000  189h
    MainScript.IME_JobPool_T4[51] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[51].resourceName  = "Uranium"
    MainScript.IME_JobPool_T4[51].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T4[51].companyIndex  = 24
    MainScript.IME_JobPool_T4[51].quantity      = 2500
    MainScript.IME_JobPool_T4[51].baseValue     = 14
    MainScript.IME_JobPool_T4[51].deadlineHours = 189
    MainScript.IME_JobPool_T4[51].rarity        = "Common"

    ; [ 52] Reliant Medical — Benzene x1875  TCV=35,625  252h
    MainScript.IME_JobPool_T4[52] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[52].resourceName  = "Benzene"
    MainScript.IME_JobPool_T4[52].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T4[52].companyIndex  = 36
    MainScript.IME_JobPool_T4[52].quantity      = 1875
    MainScript.IME_JobPool_T4[52].baseValue     = 19
    MainScript.IME_JobPool_T4[52].deadlineHours = 252
    MainScript.IME_JobPool_T4[52].rarity        = "Uncommon"

    ; [ 53] Ballistics Solutions — Isocentered Magnet x1000  TCV=36,000  151h
    MainScript.IME_JobPool_T4[53] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[53].resourceName  = "Isocentered Magnet"
    MainScript.IME_JobPool_T4[53].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T4[53].companyIndex  = 8
    MainScript.IME_JobPool_T4[53].quantity      = 1000
    MainScript.IME_JobPool_T4[53].baseValue     = 36
    MainScript.IME_JobPool_T4[53].deadlineHours = 151
    MainScript.IME_JobPool_T4[53].rarity        = "Common"

    ; [ 54] Horizon Defence — Isocentered Magnet x1000  TCV=36,000  151h
    MainScript.IME_JobPool_T4[54] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[54].resourceName  = "Isocentered Magnet"
    MainScript.IME_JobPool_T4[54].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T4[54].companyIndex  = 24
    MainScript.IME_JobPool_T4[54].quantity      = 1000
    MainScript.IME_JobPool_T4[54].baseValue     = 36
    MainScript.IME_JobPool_T4[54].deadlineHours = 151
    MainScript.IME_JobPool_T4[54].rarity        = "Common"

    ; [ 55] Arc Might — Semimetal Wafer x250  TCV=37,250  210h
    MainScript.IME_JobPool_T4[55] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[55].resourceName  = "Semimetal Wafer"
    MainScript.IME_JobPool_T4[55].companyName   = "Arc Might"
    MainScript.IME_JobPool_T4[55].companyIndex  = 4
    MainScript.IME_JobPool_T4[55].quantity      = 250
    MainScript.IME_JobPool_T4[55].baseValue     = 149
    MainScript.IME_JobPool_T4[55].deadlineHours = 210
    MainScript.IME_JobPool_T4[55].rarity        = "Rare"

    ; [ 56] Consolidated Mining — Semimetal Wafer x250  TCV=37,250  210h
    MainScript.IME_JobPool_T4[56] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[56].resourceName  = "Semimetal Wafer"
    MainScript.IME_JobPool_T4[56].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T4[56].companyIndex  = 14
    MainScript.IME_JobPool_T4[56].quantity      = 250
    MainScript.IME_JobPool_T4[56].baseValue     = 149
    MainScript.IME_JobPool_T4[56].deadlineHours = 210
    MainScript.IME_JobPool_T4[56].rarity        = "Rare"

    ; [ 57] Reliant Medical — Antimicrobial x3750  TCV=37,500  336h
    MainScript.IME_JobPool_T4[57] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[57].resourceName  = "Antimicrobial"
    MainScript.IME_JobPool_T4[57].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T4[57].companyIndex  = 36
    MainScript.IME_JobPool_T4[57].quantity      = 3750
    MainScript.IME_JobPool_T4[57].baseValue     = 10
    MainScript.IME_JobPool_T4[57].deadlineHours = 336
    MainScript.IME_JobPool_T4[57].rarity        = "Uncommon"

    ; [ 58] Sextant Shield Systems — Antimony x1250  TCV=37,500  588h
    MainScript.IME_JobPool_T4[58] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[58].resourceName  = "Antimony"
    MainScript.IME_JobPool_T4[58].companyName   = "Sextant Shield Systems"
    MainScript.IME_JobPool_T4[58].companyIndex  = 38
    MainScript.IME_JobPool_T4[58].quantity      = 1250
    MainScript.IME_JobPool_T4[58].baseValue     = 30
    MainScript.IME_JobPool_T4[58].deadlineHours = 588
    MainScript.IME_JobPool_T4[58].rarity        = "Exotic"

    ; [ 59] Arc Might — Silver x1875  TCV=37,500  252h
    MainScript.IME_JobPool_T4[59] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[59].resourceName  = "Silver"
    MainScript.IME_JobPool_T4[59].companyName   = "Arc Might"
    MainScript.IME_JobPool_T4[59].companyIndex  = 4
    MainScript.IME_JobPool_T4[59].quantity      = 1875
    MainScript.IME_JobPool_T4[59].baseValue     = 20
    MainScript.IME_JobPool_T4[59].deadlineHours = 252
    MainScript.IME_JobPool_T4[59].rarity        = "Uncommon"

    ; [ 60] Xiang — Paramagnon Conductor x250  TCV=38,250  210h
    MainScript.IME_JobPool_T4[60] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[60].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T4[60].companyName   = "Xiang"
    MainScript.IME_JobPool_T4[60].companyIndex  = 48
    MainScript.IME_JobPool_T4[60].quantity      = 250
    MainScript.IME_JobPool_T4[60].baseValue     = 153
    MainScript.IME_JobPool_T4[60].deadlineHours = 210
    MainScript.IME_JobPool_T4[60].rarity        = "Rare"

    ; [ 61] Arc Might — Iron x5000  TCV=40,000  252h
    MainScript.IME_JobPool_T4[61] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[61].resourceName  = "Iron"
    MainScript.IME_JobPool_T4[61].companyName   = "Arc Might"
    MainScript.IME_JobPool_T4[61].companyIndex  = 4
    MainScript.IME_JobPool_T4[61].quantity      = 5000
    MainScript.IME_JobPool_T4[61].baseValue     = 8
    MainScript.IME_JobPool_T4[61].deadlineHours = 252
    MainScript.IME_JobPool_T4[61].rarity        = "Common"

    ; [ 62] Hopetech — Iron x5000  TCV=40,000  252h
    MainScript.IME_JobPool_T4[62] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[62].resourceName  = "Iron"
    MainScript.IME_JobPool_T4[62].companyName   = "Hopetech"
    MainScript.IME_JobPool_T4[62].companyIndex  = 23
    MainScript.IME_JobPool_T4[62].quantity      = 5000
    MainScript.IME_JobPool_T4[62].baseValue     = 8
    MainScript.IME_JobPool_T4[62].deadlineHours = 252
    MainScript.IME_JobPool_T4[62].rarity        = "Common"

    ; [ 63] Muybridge Pharmaceuticals — Toxin x5000  TCV=40,000  252h
    MainScript.IME_JobPool_T4[63] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[63].resourceName  = "Toxin"
    MainScript.IME_JobPool_T4[63].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T4[63].companyIndex  = 30
    MainScript.IME_JobPool_T4[63].quantity      = 5000
    MainScript.IME_JobPool_T4[63].baseValue     = 8
    MainScript.IME_JobPool_T4[63].deadlineHours = 252
    MainScript.IME_JobPool_T4[63].rarity        = "Common"

    ; [ 64] Deep Core — Vytinium Fuel Rod x50  TCV=41,800  420h
    MainScript.IME_JobPool_T4[64] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[64].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T4[64].companyName   = "Deep Core"
    MainScript.IME_JobPool_T4[64].companyIndex  = 15
    MainScript.IME_JobPool_T4[64].quantity      = 50
    MainScript.IME_JobPool_T4[64].baseValue     = 836
    MainScript.IME_JobPool_T4[64].deadlineHours = 420
    MainScript.IME_JobPool_T4[64].rarity        = "Unique"

    ; [ 65] Xiang — Vytinium Fuel Rod x50  TCV=41,800  420h
    MainScript.IME_JobPool_T4[65] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[65].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T4[65].companyName   = "Xiang"
    MainScript.IME_JobPool_T4[65].companyIndex  = 48
    MainScript.IME_JobPool_T4[65].quantity      = 50
    MainScript.IME_JobPool_T4[65].baseValue     = 836
    MainScript.IME_JobPool_T4[65].deadlineHours = 420
    MainScript.IME_JobPool_T4[65].rarity        = "Unique"

    ; [ 66] Consolidated Mining — Aldumite Drilling Rig x100  TCV=42,100  504h
    MainScript.IME_JobPool_T4[66] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[66].resourceName  = "Aldumite Drilling Rig"
    MainScript.IME_JobPool_T4[66].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T4[66].companyIndex  = 14
    MainScript.IME_JobPool_T4[66].quantity      = 100
    MainScript.IME_JobPool_T4[66].baseValue     = 421
    MainScript.IME_JobPool_T4[66].deadlineHours = 504
    MainScript.IME_JobPool_T4[66].rarity        = "Unique"

    ; [ 67] Infinity Ltd — Control Rod x250  TCV=45,000  353h
    MainScript.IME_JobPool_T4[67] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[67].resourceName  = "Control Rod"
    MainScript.IME_JobPool_T4[67].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T4[67].companyIndex  = 25
    MainScript.IME_JobPool_T4[67].quantity      = 250
    MainScript.IME_JobPool_T4[67].baseValue     = 180
    MainScript.IME_JobPool_T4[67].deadlineHours = 353
    MainScript.IME_JobPool_T4[67].rarity        = "Exotic"

    ; [ 68] Advanced Nutrition — Molecular Sieve x500  TCV=45,500  252h
    MainScript.IME_JobPool_T4[68] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[68].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T4[68].companyName   = "Advanced Nutrition"
    MainScript.IME_JobPool_T4[68].companyIndex  = 1
    MainScript.IME_JobPool_T4[68].quantity      = 500
    MainScript.IME_JobPool_T4[68].baseValue     = 91
    MainScript.IME_JobPool_T4[68].deadlineHours = 252
    MainScript.IME_JobPool_T4[68].rarity        = "Rare"

    ; [ 69] Chunks — Molecular Sieve x500  TCV=45,500  252h
    MainScript.IME_JobPool_T4[69] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[69].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T4[69].companyName   = "Chunks"
    MainScript.IME_JobPool_T4[69].companyIndex  = 12
    MainScript.IME_JobPool_T4[69].quantity      = 500
    MainScript.IME_JobPool_T4[69].baseValue     = 91
    MainScript.IME_JobPool_T4[69].deadlineHours = 252
    MainScript.IME_JobPool_T4[69].rarity        = "Rare"

    ; [ 70] Ryujin — Molecular Sieve x500  TCV=45,500  252h
    MainScript.IME_JobPool_T4[70] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[70].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T4[70].companyName   = "Ryujin"
    MainScript.IME_JobPool_T4[70].companyIndex  = 37
    MainScript.IME_JobPool_T4[70].quantity      = 500
    MainScript.IME_JobPool_T4[70].baseValue     = 91
    MainScript.IME_JobPool_T4[70].deadlineHours = 252
    MainScript.IME_JobPool_T4[70].rarity        = "Rare"

    ; [ 71] Horizon Defence — Zero-G Gimbal x500  TCV=46,500  252h
    MainScript.IME_JobPool_T4[71] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[71].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T4[71].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T4[71].companyIndex  = 24
    MainScript.IME_JobPool_T4[71].quantity      = 500
    MainScript.IME_JobPool_T4[71].baseValue     = 93
    MainScript.IME_JobPool_T4[71].deadlineHours = 252
    MainScript.IME_JobPool_T4[71].rarity        = "Rare"

    ; [ 72] Nova Galactic — Zero-G Gimbal x500  TCV=46,500  252h
    MainScript.IME_JobPool_T4[72] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[72].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T4[72].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T4[72].companyIndex  = 32
    MainScript.IME_JobPool_T4[72].quantity      = 500
    MainScript.IME_JobPool_T4[72].baseValue     = 93
    MainScript.IME_JobPool_T4[72].deadlineHours = 252
    MainScript.IME_JobPool_T4[72].rarity        = "Rare"

    ; [ 73] Stroud Eklund — Zero-G Gimbal x500  TCV=46,500  252h
    MainScript.IME_JobPool_T4[73] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[73].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T4[73].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T4[73].companyIndex  = 43
    MainScript.IME_JobPool_T4[73].quantity      = 500
    MainScript.IME_JobPool_T4[73].baseValue     = 93
    MainScript.IME_JobPool_T4[73].deadlineHours = 252
    MainScript.IME_JobPool_T4[73].rarity        = "Rare"

    ; [ 74] Taiyo Astroneering — Zero-G Gimbal x500  TCV=46,500  252h
    MainScript.IME_JobPool_T4[74] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[74].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T4[74].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T4[74].companyIndex  = 44
    MainScript.IME_JobPool_T4[74].quantity      = 500
    MainScript.IME_JobPool_T4[74].baseValue     = 93
    MainScript.IME_JobPool_T4[74].deadlineHours = 252
    MainScript.IME_JobPool_T4[74].rarity        = "Rare"

    ; [ 75] Infinity Ltd — Mag Pressure Tank x1875  TCV=46,875  252h
    MainScript.IME_JobPool_T4[75] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[75].resourceName  = "Mag Pressure Tank"
    MainScript.IME_JobPool_T4[75].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T4[75].companyIndex  = 25
    MainScript.IME_JobPool_T4[75].quantity      = 1875
    MainScript.IME_JobPool_T4[75].baseValue     = 25
    MainScript.IME_JobPool_T4[75].deadlineHours = 252
    MainScript.IME_JobPool_T4[75].rarity        = "Uncommon"

    ; [ 76] Ryujin — Polytextile x1875  TCV=46,875  252h
    MainScript.IME_JobPool_T4[76] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[76].resourceName  = "Polytextile"
    MainScript.IME_JobPool_T4[76].companyName   = "Ryujin"
    MainScript.IME_JobPool_T4[76].companyIndex  = 37
    MainScript.IME_JobPool_T4[76].quantity      = 1875
    MainScript.IME_JobPool_T4[76].baseValue     = 25
    MainScript.IME_JobPool_T4[76].deadlineHours = 252
    MainScript.IME_JobPool_T4[76].rarity        = "Uncommon"

    ; [ 77] Trident Luxury Lines — Ytterbium x1250  TCV=47,500  588h
    MainScript.IME_JobPool_T4[77] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[77].resourceName  = "Ytterbium"
    MainScript.IME_JobPool_T4[77].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T4[77].companyIndex  = 45
    MainScript.IME_JobPool_T4[77].quantity      = 1250
    MainScript.IME_JobPool_T4[77].baseValue     = 38
    MainScript.IME_JobPool_T4[77].deadlineHours = 588
    MainScript.IME_JobPool_T4[77].rarity        = "Exotic"

    ; [ 78] Vanguard — Neodymium x2500  TCV=50,000  420h
    MainScript.IME_JobPool_T4[78] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[78].resourceName  = "Neodymium"
    MainScript.IME_JobPool_T4[78].companyName   = "Vanguard"
    MainScript.IME_JobPool_T4[78].companyIndex  = 46
    MainScript.IME_JobPool_T4[78].quantity      = 2500
    MainScript.IME_JobPool_T4[78].baseValue     = 20
    MainScript.IME_JobPool_T4[78].deadlineHours = 420
    MainScript.IME_JobPool_T4[78].rarity        = "Rare"

    ; [ 79] Armco — Zero Wire x1000  TCV=52,000  151h
    MainScript.IME_JobPool_T4[79] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[79].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T4[79].companyName   = "Armco"
    MainScript.IME_JobPool_T4[79].companyIndex  = 6
    MainScript.IME_JobPool_T4[79].quantity      = 1000
    MainScript.IME_JobPool_T4[79].baseValue     = 52
    MainScript.IME_JobPool_T4[79].deadlineHours = 151
    MainScript.IME_JobPool_T4[79].rarity        = "Common"

    ; [ 80] Deimos Staryards — Zero Wire x1000  TCV=52,000  151h
    MainScript.IME_JobPool_T4[80] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[80].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T4[80].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T4[80].companyIndex  = 16
    MainScript.IME_JobPool_T4[80].quantity      = 1000
    MainScript.IME_JobPool_T4[80].baseValue     = 52
    MainScript.IME_JobPool_T4[80].deadlineHours = 151
    MainScript.IME_JobPool_T4[80].rarity        = "Common"

    ; [ 81] Hopetech — Zero Wire x1000  TCV=52,000  151h
    MainScript.IME_JobPool_T4[81] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[81].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T4[81].companyName   = "Hopetech"
    MainScript.IME_JobPool_T4[81].companyIndex  = 23
    MainScript.IME_JobPool_T4[81].quantity      = 1000
    MainScript.IME_JobPool_T4[81].baseValue     = 52
    MainScript.IME_JobPool_T4[81].deadlineHours = 151
    MainScript.IME_JobPool_T4[81].rarity        = "Common"

    ; [ 82] Stroud Eklund — Zero Wire x1000  TCV=52,000  151h
    MainScript.IME_JobPool_T4[82] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[82].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T4[82].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T4[82].companyIndex  = 43
    MainScript.IME_JobPool_T4[82].quantity      = 1000
    MainScript.IME_JobPool_T4[82].baseValue     = 52
    MainScript.IME_JobPool_T4[82].deadlineHours = 151
    MainScript.IME_JobPool_T4[82].rarity        = "Common"

    ; [ 83] Taiyo Astroneering — Zero Wire x1000  TCV=52,000  151h
    MainScript.IME_JobPool_T4[83] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[83].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T4[83].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T4[83].companyIndex  = 44
    MainScript.IME_JobPool_T4[83].quantity      = 1000
    MainScript.IME_JobPool_T4[83].baseValue     = 52
    MainScript.IME_JobPool_T4[83].deadlineHours = 151
    MainScript.IME_JobPool_T4[83].rarity        = "Common"

    ; [ 84] Light Scythe — Iridium x3750  TCV=52,500  336h
    MainScript.IME_JobPool_T4[84] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[84].resourceName  = "Iridium"
    MainScript.IME_JobPool_T4[84].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T4[84].companyIndex  = 28
    MainScript.IME_JobPool_T4[84].quantity      = 3750
    MainScript.IME_JobPool_T4[84].baseValue     = 14
    MainScript.IME_JobPool_T4[84].deadlineHours = 336
    MainScript.IME_JobPool_T4[84].rarity        = "Uncommon"

    ; [ 85] Ryujin — Microsecond Regulator x250  TCV=53,000  353h
    MainScript.IME_JobPool_T4[85] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[85].resourceName  = "Microsecond Regulator"
    MainScript.IME_JobPool_T4[85].companyName   = "Ryujin"
    MainScript.IME_JobPool_T4[85].companyIndex  = 37
    MainScript.IME_JobPool_T4[85].quantity      = 250
    MainScript.IME_JobPool_T4[85].baseValue     = 212
    MainScript.IME_JobPool_T4[85].deadlineHours = 353
    MainScript.IME_JobPool_T4[85].rarity        = "Exotic"

    ; [ 86] Generdyne Industries — Supercooled Magnet x500  TCV=55,500  252h
    MainScript.IME_JobPool_T4[86] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[86].resourceName  = "Supercooled Magnet"
    MainScript.IME_JobPool_T4[86].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T4[86].companyIndex  = 22
    MainScript.IME_JobPool_T4[86].quantity      = 500
    MainScript.IME_JobPool_T4[86].baseValue     = 111
    MainScript.IME_JobPool_T4[86].deadlineHours = 252
    MainScript.IME_JobPool_T4[86].rarity        = "Rare"

    ; [ 87] Stroud Eklund — Supercooled Magnet x500  TCV=55,500  252h
    MainScript.IME_JobPool_T4[87] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[87].resourceName  = "Supercooled Magnet"
    MainScript.IME_JobPool_T4[87].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T4[87].companyIndex  = 43
    MainScript.IME_JobPool_T4[87].quantity      = 500
    MainScript.IME_JobPool_T4[87].baseValue     = 111
    MainScript.IME_JobPool_T4[87].deadlineHours = 252
    MainScript.IME_JobPool_T4[87].rarity        = "Rare"

    ; [ 88] Taiyo Astroneering — Supercooled Magnet x500  TCV=55,500  252h
    MainScript.IME_JobPool_T4[88] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[88].resourceName  = "Supercooled Magnet"
    MainScript.IME_JobPool_T4[88].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T4[88].companyIndex  = 44
    MainScript.IME_JobPool_T4[88].quantity      = 500
    MainScript.IME_JobPool_T4[88].baseValue     = 111
    MainScript.IME_JobPool_T4[88].deadlineHours = 252
    MainScript.IME_JobPool_T4[88].rarity        = "Rare"

    ; [ 89] Generdyne Industries — Nuclear Fuel Rod x250  TCV=56,250  353h
    MainScript.IME_JobPool_T4[89] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[89].resourceName  = "Nuclear Fuel Rod"
    MainScript.IME_JobPool_T4[89].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T4[89].companyIndex  = 22
    MainScript.IME_JobPool_T4[89].quantity      = 250
    MainScript.IME_JobPool_T4[89].baseValue     = 225
    MainScript.IME_JobPool_T4[89].deadlineHours = 353
    MainScript.IME_JobPool_T4[89].rarity        = "Exotic"

    ; [ 90] Light Scythe — Monopropellant x750  TCV=57,000  202h
    MainScript.IME_JobPool_T4[90] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[90].resourceName  = "Monopropellant"
    MainScript.IME_JobPool_T4[90].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T4[90].companyIndex  = 28
    MainScript.IME_JobPool_T4[90].quantity      = 750
    MainScript.IME_JobPool_T4[90].baseValue     = 76
    MainScript.IME_JobPool_T4[90].deadlineHours = 202
    MainScript.IME_JobPool_T4[90].rarity        = "Uncommon"

    ; [ 91] Light Scythe — Tantalum x2500  TCV=57,500  420h
    MainScript.IME_JobPool_T4[91] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[91].resourceName  = "Tantalum"
    MainScript.IME_JobPool_T4[91].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T4[91].companyIndex  = 28
    MainScript.IME_JobPool_T4[91].quantity      = 2500
    MainScript.IME_JobPool_T4[91].baseValue     = 23
    MainScript.IME_JobPool_T4[91].deadlineHours = 420
    MainScript.IME_JobPool_T4[91].rarity        = "Rare"

    ; [ 92] Nova Galactic — Austenitic Manifold x750  TCV=59,250  202h
    MainScript.IME_JobPool_T4[92] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[92].resourceName  = "Austenitic Manifold"
    MainScript.IME_JobPool_T4[92].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T4[92].companyIndex  = 32
    MainScript.IME_JobPool_T4[92].quantity      = 750
    MainScript.IME_JobPool_T4[92].baseValue     = 79
    MainScript.IME_JobPool_T4[92].deadlineHours = 202
    MainScript.IME_JobPool_T4[92].rarity        = "Uncommon"

    ; [ 93] Taiyo Astroneering — Austenitic Manifold x750  TCV=59,250  202h
    MainScript.IME_JobPool_T4[93] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[93].resourceName  = "Austenitic Manifold"
    MainScript.IME_JobPool_T4[93].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T4[93].companyIndex  = 44
    MainScript.IME_JobPool_T4[93].quantity      = 750
    MainScript.IME_JobPool_T4[93].baseValue     = 79
    MainScript.IME_JobPool_T4[93].deadlineHours = 202
    MainScript.IME_JobPool_T4[93].rarity        = "Uncommon"

    ; [ 94] Trident Luxury Lines — Austenitic Manifold x750  TCV=59,250  202h
    MainScript.IME_JobPool_T4[94] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[94].resourceName  = "Austenitic Manifold"
    MainScript.IME_JobPool_T4[94].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T4[94].companyIndex  = 45
    MainScript.IME_JobPool_T4[94].quantity      = 750
    MainScript.IME_JobPool_T4[94].baseValue     = 79
    MainScript.IME_JobPool_T4[94].deadlineHours = 202
    MainScript.IME_JobPool_T4[94].rarity        = "Uncommon"

    ; [ 95] Arc Might — Adaptive Frame x2500  TCV=60,000  189h
    MainScript.IME_JobPool_T4[95] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[95].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T4[95].companyName   = "Arc Might"
    MainScript.IME_JobPool_T4[95].companyIndex  = 4
    MainScript.IME_JobPool_T4[95].quantity      = 2500
    MainScript.IME_JobPool_T4[95].baseValue     = 24
    MainScript.IME_JobPool_T4[95].deadlineHours = 189
    MainScript.IME_JobPool_T4[95].rarity        = "Common"

    ; [ 96] Nova Galactic — Adaptive Frame x2500  TCV=60,000  189h
    MainScript.IME_JobPool_T4[96] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[96].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T4[96].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T4[96].companyIndex  = 32
    MainScript.IME_JobPool_T4[96].quantity      = 2500
    MainScript.IME_JobPool_T4[96].baseValue     = 24
    MainScript.IME_JobPool_T4[96].deadlineHours = 189
    MainScript.IME_JobPool_T4[96].rarity        = "Common"

    ; [ 97] Stroud Eklund — Adaptive Frame x2500  TCV=60,000  189h
    MainScript.IME_JobPool_T4[97] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[97].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T4[97].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T4[97].companyIndex  = 43
    MainScript.IME_JobPool_T4[97].quantity      = 2500
    MainScript.IME_JobPool_T4[97].baseValue     = 24
    MainScript.IME_JobPool_T4[97].deadlineHours = 189
    MainScript.IME_JobPool_T4[97].rarity        = "Common"

    ; [ 98] Taiyo Astroneering — Adaptive Frame x2500  TCV=60,000  189h
    MainScript.IME_JobPool_T4[98] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[98].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T4[98].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T4[98].companyIndex  = 44
    MainScript.IME_JobPool_T4[98].quantity      = 2500
    MainScript.IME_JobPool_T4[98].baseValue     = 24
    MainScript.IME_JobPool_T4[98].deadlineHours = 189
    MainScript.IME_JobPool_T4[98].rarity        = "Common"

    ; [ 99] Ballistics Solutions — Tungsten x3750  TCV=60,000  336h
    MainScript.IME_JobPool_T4[99] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[99].resourceName  = "Tungsten"
    MainScript.IME_JobPool_T4[99].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T4[99].companyIndex  = 8
    MainScript.IME_JobPool_T4[99].quantity      = 3750
    MainScript.IME_JobPool_T4[99].baseValue     = 16
    MainScript.IME_JobPool_T4[99].deadlineHours = 336
    MainScript.IME_JobPool_T4[99].rarity        = "Uncommon"

    ; [100] Ryujin — Indicite Wafer x250  TCV=60,750  630h
    MainScript.IME_JobPool_T4[100] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[100].resourceName  = "Indicite Wafer"
    MainScript.IME_JobPool_T4[100].companyName   = "Ryujin"
    MainScript.IME_JobPool_T4[100].companyIndex  = 37
    MainScript.IME_JobPool_T4[100].quantity      = 250
    MainScript.IME_JobPool_T4[100].baseValue     = 243
    MainScript.IME_JobPool_T4[100].deadlineHours = 630
    MainScript.IME_JobPool_T4[100].rarity        = "Unique"

    ; [101] Dogstar — Tau Grade Rheostat x750  TCV=61,500  202h
    MainScript.IME_JobPool_T4[101] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[101].resourceName  = "Tau Grade Rheostat"
    MainScript.IME_JobPool_T4[101].companyName   = "Dogstar"
    MainScript.IME_JobPool_T4[101].companyIndex  = 17
    MainScript.IME_JobPool_T4[101].quantity      = 750
    MainScript.IME_JobPool_T4[101].baseValue     = 82
    MainScript.IME_JobPool_T4[101].deadlineHours = 202
    MainScript.IME_JobPool_T4[101].rarity        = "Uncommon"

    ; [102] Argos Extractors — Isotopic Coolant x2500  TCV=62,500  189h
    MainScript.IME_JobPool_T4[102] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[102].resourceName  = "Isotopic Coolant"
    MainScript.IME_JobPool_T4[102].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T4[102].companyIndex  = 5
    MainScript.IME_JobPool_T4[102].quantity      = 2500
    MainScript.IME_JobPool_T4[102].baseValue     = 25
    MainScript.IME_JobPool_T4[102].deadlineHours = 189
    MainScript.IME_JobPool_T4[102].rarity        = "Common"

    ; [103] Generdyne Industries — Isotopic Coolant x2500  TCV=62,500  189h
    MainScript.IME_JobPool_T4[103] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[103].resourceName  = "Isotopic Coolant"
    MainScript.IME_JobPool_T4[103].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T4[103].companyIndex  = 22
    MainScript.IME_JobPool_T4[103].quantity      = 2500
    MainScript.IME_JobPool_T4[103].baseValue     = 25
    MainScript.IME_JobPool_T4[103].deadlineHours = 189
    MainScript.IME_JobPool_T4[103].rarity        = "Common"

    ; [104] Slayton Aerospace — Isotopic Coolant x2500  TCV=62,500  189h
    MainScript.IME_JobPool_T4[104] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[104].resourceName  = "Isotopic Coolant"
    MainScript.IME_JobPool_T4[104].companyName   = "Slayton Aerospace"
    MainScript.IME_JobPool_T4[104].companyIndex  = 41
    MainScript.IME_JobPool_T4[104].quantity      = 2500
    MainScript.IME_JobPool_T4[104].baseValue     = 25
    MainScript.IME_JobPool_T4[104].deadlineHours = 189
    MainScript.IME_JobPool_T4[104].rarity        = "Common"

    ; [105] Arc Might — Reactive Gauge x2500  TCV=62,500  189h
    MainScript.IME_JobPool_T4[105] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[105].resourceName  = "Reactive Gauge"
    MainScript.IME_JobPool_T4[105].companyName   = "Arc Might"
    MainScript.IME_JobPool_T4[105].companyIndex  = 4
    MainScript.IME_JobPool_T4[105].quantity      = 2500
    MainScript.IME_JobPool_T4[105].baseValue     = 25
    MainScript.IME_JobPool_T4[105].deadlineHours = 189
    MainScript.IME_JobPool_T4[105].rarity        = "Common"

    ; [106] Horizon Defence — Positron Battery x500  TCV=66,500  252h
    MainScript.IME_JobPool_T4[106] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[106].resourceName  = "Positron Battery"
    MainScript.IME_JobPool_T4[106].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T4[106].companyIndex  = 24
    MainScript.IME_JobPool_T4[106].quantity      = 500
    MainScript.IME_JobPool_T4[106].baseValue     = 133
    MainScript.IME_JobPool_T4[106].deadlineHours = 252
    MainScript.IME_JobPool_T4[106].rarity        = "Rare"

    ; [107] Vanguard — Positron Battery x500  TCV=66,500  252h
    MainScript.IME_JobPool_T4[107] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[107].resourceName  = "Positron Battery"
    MainScript.IME_JobPool_T4[107].companyName   = "Vanguard"
    MainScript.IME_JobPool_T4[107].companyIndex  = 46
    MainScript.IME_JobPool_T4[107].quantity      = 500
    MainScript.IME_JobPool_T4[107].baseValue     = 133
    MainScript.IME_JobPool_T4[107].deadlineHours = 252
    MainScript.IME_JobPool_T4[107].rarity        = "Rare"

    ; [108] Muybridge Pharmaceuticals — Substrate Molecule Sieve x250  TCV=68,500  630h
    MainScript.IME_JobPool_T4[108] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[108].resourceName  = "Substrate Molecule Sieve"
    MainScript.IME_JobPool_T4[108].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T4[108].companyIndex  = 30
    MainScript.IME_JobPool_T4[108].quantity      = 250
    MainScript.IME_JobPool_T4[108].baseValue     = 274
    MainScript.IME_JobPool_T4[108].deadlineHours = 630
    MainScript.IME_JobPool_T4[108].rarity        = "Unique"

    ; [109] Axion Energy — Uranium x5000  TCV=70,000  252h
    MainScript.IME_JobPool_T4[109] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[109].resourceName  = "Uranium"
    MainScript.IME_JobPool_T4[109].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T4[109].companyIndex  = 7
    MainScript.IME_JobPool_T4[109].quantity      = 5000
    MainScript.IME_JobPool_T4[109].baseValue     = 14
    MainScript.IME_JobPool_T4[109].deadlineHours = 252
    MainScript.IME_JobPool_T4[109].rarity        = "Common"

    ; [110] Six Sisters — Drilling Rig x500  TCV=71,500  252h
    MainScript.IME_JobPool_T4[110] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[110].resourceName  = "Drilling Rig"
    MainScript.IME_JobPool_T4[110].companyName   = "Six Sisters"
    MainScript.IME_JobPool_T4[110].companyIndex  = 40
    MainScript.IME_JobPool_T4[110].quantity      = 500
    MainScript.IME_JobPool_T4[110].baseValue     = 143
    MainScript.IME_JobPool_T4[110].deadlineHours = 252
    MainScript.IME_JobPool_T4[110].rarity        = "Rare"

    ; [111] Generdyne Industries — Rothicite Magnet x250  TCV=73,750  630h
    MainScript.IME_JobPool_T4[111] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[111].resourceName  = "Rothicite Magnet"
    MainScript.IME_JobPool_T4[111].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T4[111].companyIndex  = 22
    MainScript.IME_JobPool_T4[111].quantity      = 250
    MainScript.IME_JobPool_T4[111].baseValue     = 295
    MainScript.IME_JobPool_T4[111].deadlineHours = 630
    MainScript.IME_JobPool_T4[111].rarity        = "Unique"

    ; [112] Ballistics Solutions — Veryl-Treated Manifold x250  TCV=73,750  630h
    MainScript.IME_JobPool_T4[112] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[112].resourceName  = "Veryl-Treated Manifold"
    MainScript.IME_JobPool_T4[112].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T4[112].companyIndex  = 8
    MainScript.IME_JobPool_T4[112].quantity      = 250
    MainScript.IME_JobPool_T4[112].baseValue     = 295
    MainScript.IME_JobPool_T4[112].deadlineHours = 630
    MainScript.IME_JobPool_T4[112].rarity        = "Unique"

    ; [113] Light Scythe — Veryl-Treated Manifold x250  TCV=73,750  630h
    MainScript.IME_JobPool_T4[113] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[113].resourceName  = "Veryl-Treated Manifold"
    MainScript.IME_JobPool_T4[113].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T4[113].companyIndex  = 28
    MainScript.IME_JobPool_T4[113].quantity      = 250
    MainScript.IME_JobPool_T4[113].baseValue     = 295
    MainScript.IME_JobPool_T4[113].deadlineHours = 630
    MainScript.IME_JobPool_T4[113].rarity        = "Unique"

    ; [114] Argos Extractors — Semimetal Wafer x500  TCV=74,500  252h
    MainScript.IME_JobPool_T4[114] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[114].resourceName  = "Semimetal Wafer"
    MainScript.IME_JobPool_T4[114].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T4[114].companyIndex  = 5
    MainScript.IME_JobPool_T4[114].quantity      = 500
    MainScript.IME_JobPool_T4[114].baseValue     = 149
    MainScript.IME_JobPool_T4[114].deadlineHours = 252
    MainScript.IME_JobPool_T4[114].rarity        = "Rare"

    ; [115] Galbank — Silver x3750  TCV=75,000  336h
    MainScript.IME_JobPool_T4[115] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[115].resourceName  = "Silver"
    MainScript.IME_JobPool_T4[115].companyName   = "Galbank"
    MainScript.IME_JobPool_T4[115].companyIndex  = 21
    MainScript.IME_JobPool_T4[115].quantity      = 3750
    MainScript.IME_JobPool_T4[115].baseValue     = 20
    MainScript.IME_JobPool_T4[115].deadlineHours = 336
    MainScript.IME_JobPool_T4[115].rarity        = "Uncommon"

    ; [116] Amun Dunn — Paramagnon Conductor x500  TCV=76,500  252h
    MainScript.IME_JobPool_T4[116] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[116].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T4[116].companyName   = "Amun Dunn"
    MainScript.IME_JobPool_T4[116].companyIndex  = 3
    MainScript.IME_JobPool_T4[116].quantity      = 500
    MainScript.IME_JobPool_T4[116].baseValue     = 153
    MainScript.IME_JobPool_T4[116].deadlineHours = 252
    MainScript.IME_JobPool_T4[116].rarity        = "Rare"

    ; [117] Deep Core — Paramagnon Conductor x500  TCV=76,500  252h
    MainScript.IME_JobPool_T4[117] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[117].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T4[117].companyName   = "Deep Core"
    MainScript.IME_JobPool_T4[117].companyIndex  = 15
    MainScript.IME_JobPool_T4[117].quantity      = 500
    MainScript.IME_JobPool_T4[117].baseValue     = 153
    MainScript.IME_JobPool_T4[117].deadlineHours = 252
    MainScript.IME_JobPool_T4[117].rarity        = "Rare"

    ; [118] Shinigami — Paramagnon Conductor x500  TCV=76,500  252h
    MainScript.IME_JobPool_T4[118] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[118].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T4[118].companyName   = "Shinigami"
    MainScript.IME_JobPool_T4[118].companyIndex  = 39
    MainScript.IME_JobPool_T4[118].quantity      = 500
    MainScript.IME_JobPool_T4[118].baseValue     = 153
    MainScript.IME_JobPool_T4[118].deadlineHours = 252
    MainScript.IME_JobPool_T4[118].rarity        = "Rare"

    ; [119] Vanguard — Paramagnon Conductor x500  TCV=76,500  252h
    MainScript.IME_JobPool_T4[119] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[119].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T4[119].companyName   = "Vanguard"
    MainScript.IME_JobPool_T4[119].companyIndex  = 46
    MainScript.IME_JobPool_T4[119].quantity      = 500
    MainScript.IME_JobPool_T4[119].baseValue     = 153
    MainScript.IME_JobPool_T4[119].deadlineHours = 252
    MainScript.IME_JobPool_T4[119].rarity        = "Rare"

    ; [120] Axion Energy — Plutonium x1250  TCV=80,000  588h
    MainScript.IME_JobPool_T4[120] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[120].resourceName  = "Plutonium"
    MainScript.IME_JobPool_T4[120].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T4[120].companyIndex  = 7
    MainScript.IME_JobPool_T4[120].quantity      = 1250
    MainScript.IME_JobPool_T4[120].baseValue     = 64
    MainScript.IME_JobPool_T4[120].deadlineHours = 588
    MainScript.IME_JobPool_T4[120].rarity        = "Exotic"

    ; [121] Dogstar — Sterile Nanotubes x625  TCV=81,250  441h
    MainScript.IME_JobPool_T4[121] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[121].resourceName  = "Sterile Nanotubes"
    MainScript.IME_JobPool_T4[121].companyName   = "Dogstar"
    MainScript.IME_JobPool_T4[121].companyIndex  = 17
    MainScript.IME_JobPool_T4[121].quantity      = 625
    MainScript.IME_JobPool_T4[121].baseValue     = 130
    MainScript.IME_JobPool_T4[121].deadlineHours = 441
    MainScript.IME_JobPool_T4[121].rarity        = "Exotic"

    ; [122] Nova Galactic — Vytinium Fuel Rod x100  TCV=83,600  504h
    MainScript.IME_JobPool_T4[122] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[122].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T4[122].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T4[122].companyIndex  = 32
    MainScript.IME_JobPool_T4[122].quantity      = 100
    MainScript.IME_JobPool_T4[122].baseValue     = 836
    MainScript.IME_JobPool_T4[122].deadlineHours = 504
    MainScript.IME_JobPool_T4[122].rarity        = "Unique"

    ; [123] Vanguard — Vytinium Fuel Rod x100  TCV=83,600  504h
    MainScript.IME_JobPool_T4[123] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[123].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T4[123].companyName   = "Vanguard"
    MainScript.IME_JobPool_T4[123].companyIndex  = 46
    MainScript.IME_JobPool_T4[123].quantity      = 100
    MainScript.IME_JobPool_T4[123].baseValue     = 836
    MainScript.IME_JobPool_T4[123].deadlineHours = 504
    MainScript.IME_JobPool_T4[123].rarity        = "Unique"

    ; [124] Nova Galactic — Comm Relay x750  TCV=87,750  202h
    MainScript.IME_JobPool_T4[124] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[124].resourceName  = "Comm Relay"
    MainScript.IME_JobPool_T4[124].companyName   = "Nova Galactic"
    MainScript.IME_JobPool_T4[124].companyIndex  = 32
    MainScript.IME_JobPool_T4[124].quantity      = 750
    MainScript.IME_JobPool_T4[124].baseValue     = 117
    MainScript.IME_JobPool_T4[124].deadlineHours = 202
    MainScript.IME_JobPool_T4[124].rarity        = "Uncommon"

    ; [125] Trident Luxury Lines — Comm Relay x750  TCV=87,750  202h
    MainScript.IME_JobPool_T4[125] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[125].resourceName  = "Comm Relay"
    MainScript.IME_JobPool_T4[125].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T4[125].companyIndex  = 45
    MainScript.IME_JobPool_T4[125].quantity      = 750
    MainScript.IME_JobPool_T4[125].baseValue     = 117
    MainScript.IME_JobPool_T4[125].deadlineHours = 202
    MainScript.IME_JobPool_T4[125].rarity        = "Uncommon"

    ; [126] Vanguard — Isocentered Magnet x2500  TCV=90,000  189h
    MainScript.IME_JobPool_T4[126] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[126].resourceName  = "Isocentered Magnet"
    MainScript.IME_JobPool_T4[126].companyName   = "Vanguard"
    MainScript.IME_JobPool_T4[126].companyIndex  = 46
    MainScript.IME_JobPool_T4[126].quantity      = 2500
    MainScript.IME_JobPool_T4[126].baseValue     = 36
    MainScript.IME_JobPool_T4[126].deadlineHours = 189
    MainScript.IME_JobPool_T4[126].rarity        = "Common"

    ; [127] Eit Clothiers — Polytextile x3750  TCV=93,750  336h
    MainScript.IME_JobPool_T4[127] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T4[127].resourceName  = "Polytextile"
    MainScript.IME_JobPool_T4[127].companyName   = "Eit Clothiers"
    MainScript.IME_JobPool_T4[127].companyIndex  = 18
    MainScript.IME_JobPool_T4[127].quantity      = 3750
    MainScript.IME_JobPool_T4[127].baseValue     = 25
    MainScript.IME_JobPool_T4[127].deadlineHours = 336
    MainScript.IME_JobPool_T4[127].rarity        = "Uncommon"

EndFunction

; ── TIER 5 (53 jobs | TCV 112,500 - 438,750) ──────────────────────────────────────────
Function InitTier5Jobs()
    MainScript.IME_Tier5_JobCount = 53
    MainScript.IME_JobPool_T5 = new IME_MainQuestScript:JobTemplate[53]

    ; [  0] Axion Energy — Control Rod x625  TCV=112,500  441h
    MainScript.IME_JobPool_T5[0] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[0].resourceName  = "Control Rod"
    MainScript.IME_JobPool_T5[0].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T5[0].companyIndex  = 7
    MainScript.IME_JobPool_T5[0].quantity      = 625
    MainScript.IME_JobPool_T5[0].baseValue     = 180
    MainScript.IME_JobPool_T5[0].deadlineHours = 441
    MainScript.IME_JobPool_T5[0].rarity        = "Exotic"

    ; [  1] Infinity Ltd — Molecular Sieve x1250  TCV=113,750  315h
    MainScript.IME_JobPool_T5[1] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[1].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T5[1].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T5[1].companyIndex  = 25
    MainScript.IME_JobPool_T5[1].quantity      = 1250
    MainScript.IME_JobPool_T5[1].baseValue     = 91
    MainScript.IME_JobPool_T5[1].deadlineHours = 315
    MainScript.IME_JobPool_T5[1].rarity        = "Rare"

    ; [  2] Reliant Medical — Molecular Sieve x1250  TCV=113,750  315h
    MainScript.IME_JobPool_T5[2] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[2].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T5[2].companyName   = "Reliant Medical"
    MainScript.IME_JobPool_T5[2].companyIndex  = 36
    MainScript.IME_JobPool_T5[2].quantity      = 1250
    MainScript.IME_JobPool_T5[2].baseValue     = 91
    MainScript.IME_JobPool_T5[2].deadlineHours = 315
    MainScript.IME_JobPool_T5[2].rarity        = "Rare"

    ; [  3] Deimos Staryards — Zero-G Gimbal x1250  TCV=116,250  315h
    MainScript.IME_JobPool_T5[3] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[3].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T5[3].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T5[3].companyIndex  = 16
    MainScript.IME_JobPool_T5[3].quantity      = 1250
    MainScript.IME_JobPool_T5[3].baseValue     = 93
    MainScript.IME_JobPool_T5[3].deadlineHours = 315
    MainScript.IME_JobPool_T5[3].rarity        = "Rare"

    ; [  4] Hopetech — Zero-G Gimbal x1250  TCV=116,250  315h
    MainScript.IME_JobPool_T5[4] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[4].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T5[4].companyName   = "Hopetech"
    MainScript.IME_JobPool_T5[4].companyIndex  = 23
    MainScript.IME_JobPool_T5[4].quantity      = 1250
    MainScript.IME_JobPool_T5[4].baseValue     = 93
    MainScript.IME_JobPool_T5[4].deadlineHours = 315
    MainScript.IME_JobPool_T5[4].rarity        = "Rare"

    ; [  5] Trident Luxury Lines — Zero-G Gimbal x1250  TCV=116,250  315h
    MainScript.IME_JobPool_T5[5] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[5].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T5[5].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T5[5].companyIndex  = 45
    MainScript.IME_JobPool_T5[5].quantity      = 1250
    MainScript.IME_JobPool_T5[5].baseValue     = 93
    MainScript.IME_JobPool_T5[5].deadlineHours = 315
    MainScript.IME_JobPool_T5[5].rarity        = "Rare"

    ; [  6] Deimos Staryards — Adaptive Frame x5000  TCV=120,000  252h
    MainScript.IME_JobPool_T5[6] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[6].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T5[6].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T5[6].companyIndex  = 16
    MainScript.IME_JobPool_T5[6].quantity      = 5000
    MainScript.IME_JobPool_T5[6].baseValue     = 24
    MainScript.IME_JobPool_T5[6].deadlineHours = 252
    MainScript.IME_JobPool_T5[6].rarity        = "Common"

    ; [  7] Hopetech — Adaptive Frame x5000  TCV=120,000  252h
    MainScript.IME_JobPool_T5[7] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[7].resourceName  = "Adaptive Frame"
    MainScript.IME_JobPool_T5[7].companyName   = "Hopetech"
    MainScript.IME_JobPool_T5[7].companyIndex  = 23
    MainScript.IME_JobPool_T5[7].quantity      = 5000
    MainScript.IME_JobPool_T5[7].baseValue     = 24
    MainScript.IME_JobPool_T5[7].deadlineHours = 252
    MainScript.IME_JobPool_T5[7].rarity        = "Common"

    ; [  8] Axion Energy — Power Circuit x625  TCV=121,875  441h
    MainScript.IME_JobPool_T5[8] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[8].resourceName  = "Power Circuit"
    MainScript.IME_JobPool_T5[8].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T5[8].companyIndex  = 7
    MainScript.IME_JobPool_T5[8].quantity      = 625
    MainScript.IME_JobPool_T5[8].baseValue     = 195
    MainScript.IME_JobPool_T5[8].deadlineHours = 441
    MainScript.IME_JobPool_T5[8].rarity        = "Exotic"

    ; [  9] Amun Dunn — Isotopic Coolant x5000  TCV=125,000  252h
    MainScript.IME_JobPool_T5[9] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[9].resourceName  = "Isotopic Coolant"
    MainScript.IME_JobPool_T5[9].companyName   = "Amun Dunn"
    MainScript.IME_JobPool_T5[9].companyIndex  = 3
    MainScript.IME_JobPool_T5[9].quantity      = 5000
    MainScript.IME_JobPool_T5[9].baseValue     = 25
    MainScript.IME_JobPool_T5[9].deadlineHours = 252
    MainScript.IME_JobPool_T5[9].rarity        = "Common"

    ; [ 10] Arc Might — Zero Wire x2500  TCV=130,000  189h
    MainScript.IME_JobPool_T5[10] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[10].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T5[10].companyName   = "Arc Might"
    MainScript.IME_JobPool_T5[10].companyIndex  = 4
    MainScript.IME_JobPool_T5[10].quantity      = 2500
    MainScript.IME_JobPool_T5[10].baseValue     = 52
    MainScript.IME_JobPool_T5[10].deadlineHours = 189
    MainScript.IME_JobPool_T5[10].rarity        = "Common"

    ; [ 11] Generdyne Industries — Zero Wire x2500  TCV=130,000  189h
    MainScript.IME_JobPool_T5[11] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[11].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T5[11].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T5[11].companyIndex  = 22
    MainScript.IME_JobPool_T5[11].quantity      = 2500
    MainScript.IME_JobPool_T5[11].baseValue     = 52
    MainScript.IME_JobPool_T5[11].deadlineHours = 189
    MainScript.IME_JobPool_T5[11].rarity        = "Common"

    ; [ 12] Trident Luxury Lines — Zero Wire x2500  TCV=130,000  189h
    MainScript.IME_JobPool_T5[12] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[12].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T5[12].companyName   = "Trident Luxury Lines"
    MainScript.IME_JobPool_T5[12].companyIndex  = 45
    MainScript.IME_JobPool_T5[12].quantity      = 2500
    MainScript.IME_JobPool_T5[12].baseValue     = 52
    MainScript.IME_JobPool_T5[12].deadlineHours = 189
    MainScript.IME_JobPool_T5[12].rarity        = "Common"

    ; [ 13] Infinity Ltd — Microsecond Regulator x625  TCV=132,500  441h
    MainScript.IME_JobPool_T5[13] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[13].resourceName  = "Microsecond Regulator"
    MainScript.IME_JobPool_T5[13].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T5[13].companyIndex  = 25
    MainScript.IME_JobPool_T5[13].quantity      = 625
    MainScript.IME_JobPool_T5[13].baseValue     = 212
    MainScript.IME_JobPool_T5[13].deadlineHours = 441
    MainScript.IME_JobPool_T5[13].rarity        = "Exotic"

    ; [ 14] Infinity Ltd — Substrate Molecule Sieve x500  TCV=137,000  840h
    MainScript.IME_JobPool_T5[14] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[14].resourceName  = "Substrate Molecule Sieve"
    MainScript.IME_JobPool_T5[14].companyName   = "Infinity Ltd"
    MainScript.IME_JobPool_T5[14].companyIndex  = 25
    MainScript.IME_JobPool_T5[14].quantity      = 500
    MainScript.IME_JobPool_T5[14].baseValue     = 274
    MainScript.IME_JobPool_T5[14].deadlineHours = 840
    MainScript.IME_JobPool_T5[14].rarity        = "Unique"

    ; [ 15] Horizon Defence — Monopropellant x1875  TCV=142,500  252h
    MainScript.IME_JobPool_T5[15] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[15].resourceName  = "Monopropellant"
    MainScript.IME_JobPool_T5[15].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T5[15].companyIndex  = 24
    MainScript.IME_JobPool_T5[15].quantity      = 1875
    MainScript.IME_JobPool_T5[15].baseValue     = 76
    MainScript.IME_JobPool_T5[15].deadlineHours = 252
    MainScript.IME_JobPool_T5[15].rarity        = "Uncommon"

    ; [ 16] Horizon Defence — Veryl-Treated Manifold x500  TCV=147,500  840h
    MainScript.IME_JobPool_T5[16] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[16].resourceName  = "Veryl-Treated Manifold"
    MainScript.IME_JobPool_T5[16].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T5[16].companyIndex  = 24
    MainScript.IME_JobPool_T5[16].quantity      = 500
    MainScript.IME_JobPool_T5[16].baseValue     = 295
    MainScript.IME_JobPool_T5[16].deadlineHours = 840
    MainScript.IME_JobPool_T5[16].rarity        = "Unique"

    ; [ 17] Deimos Staryards — Austenitic Manifold x1875  TCV=148,125  252h
    MainScript.IME_JobPool_T5[17] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[17].resourceName  = "Austenitic Manifold"
    MainScript.IME_JobPool_T5[17].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T5[17].companyIndex  = 16
    MainScript.IME_JobPool_T5[17].quantity      = 1875
    MainScript.IME_JobPool_T5[17].baseValue     = 79
    MainScript.IME_JobPool_T5[17].deadlineHours = 252
    MainScript.IME_JobPool_T5[17].rarity        = "Uncommon"

    ; [ 18] Hopetech — Austenitic Manifold x1875  TCV=148,125  252h
    MainScript.IME_JobPool_T5[18] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[18].resourceName  = "Austenitic Manifold"
    MainScript.IME_JobPool_T5[18].companyName   = "Hopetech"
    MainScript.IME_JobPool_T5[18].companyIndex  = 23
    MainScript.IME_JobPool_T5[18].quantity      = 1875
    MainScript.IME_JobPool_T5[18].baseValue     = 79
    MainScript.IME_JobPool_T5[18].deadlineHours = 252
    MainScript.IME_JobPool_T5[18].rarity        = "Uncommon"

    ; [ 19] Stroud Eklund — Austenitic Manifold x1875  TCV=148,125  252h
    MainScript.IME_JobPool_T5[19] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[19].resourceName  = "Austenitic Manifold"
    MainScript.IME_JobPool_T5[19].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T5[19].companyIndex  = 43
    MainScript.IME_JobPool_T5[19].quantity      = 1875
    MainScript.IME_JobPool_T5[19].baseValue     = 79
    MainScript.IME_JobPool_T5[19].deadlineHours = 252
    MainScript.IME_JobPool_T5[19].rarity        = "Uncommon"

    ; [ 20] Generdyne Industries — Tasine Superconductor x500  TCV=149,500  840h
    MainScript.IME_JobPool_T5[20] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[20].resourceName  = "Tasine Superconductor"
    MainScript.IME_JobPool_T5[20].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T5[20].companyIndex  = 22
    MainScript.IME_JobPool_T5[20].quantity      = 500
    MainScript.IME_JobPool_T5[20].baseValue     = 299
    MainScript.IME_JobPool_T5[20].deadlineHours = 840
    MainScript.IME_JobPool_T5[20].rarity        = "Unique"

    ; [ 21] Amun Dunn — Tau Grade Rheostat x1875  TCV=153,750  252h
    MainScript.IME_JobPool_T5[21] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[21].resourceName  = "Tau Grade Rheostat"
    MainScript.IME_JobPool_T5[21].companyName   = "Amun Dunn"
    MainScript.IME_JobPool_T5[21].companyIndex  = 3
    MainScript.IME_JobPool_T5[21].quantity      = 1875
    MainScript.IME_JobPool_T5[21].baseValue     = 82
    MainScript.IME_JobPool_T5[21].deadlineHours = 252
    MainScript.IME_JobPool_T5[21].rarity        = "Uncommon"

    ; [ 22] Axion Energy — Tau Grade Rheostat x1875  TCV=153,750  252h
    MainScript.IME_JobPool_T5[22] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[22].resourceName  = "Tau Grade Rheostat"
    MainScript.IME_JobPool_T5[22].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T5[22].companyIndex  = 7
    MainScript.IME_JobPool_T5[22].quantity      = 1875
    MainScript.IME_JobPool_T5[22].baseValue     = 82
    MainScript.IME_JobPool_T5[22].deadlineHours = 252
    MainScript.IME_JobPool_T5[22].rarity        = "Uncommon"

    ; [ 23] Sextant Shield Systems — Sterile Nanotubes x1250  TCV=162,500  588h
    MainScript.IME_JobPool_T5[23] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[23].resourceName  = "Sterile Nanotubes"
    MainScript.IME_JobPool_T5[23].companyName   = "Sextant Shield Systems"
    MainScript.IME_JobPool_T5[23].companyIndex  = 38
    MainScript.IME_JobPool_T5[23].quantity      = 1250
    MainScript.IME_JobPool_T5[23].baseValue     = 130
    MainScript.IME_JobPool_T5[23].deadlineHours = 588
    MainScript.IME_JobPool_T5[23].rarity        = "Exotic"

    ; [ 24] Shinigami — Positron Battery x1250  TCV=166,250  315h
    MainScript.IME_JobPool_T5[24] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[24].resourceName  = "Positron Battery"
    MainScript.IME_JobPool_T5[24].companyName   = "Shinigami"
    MainScript.IME_JobPool_T5[24].companyIndex  = 39
    MainScript.IME_JobPool_T5[24].quantity      = 1250
    MainScript.IME_JobPool_T5[24].baseValue     = 133
    MainScript.IME_JobPool_T5[24].deadlineHours = 315
    MainScript.IME_JobPool_T5[24].rarity        = "Rare"

    ; [ 25] Consolidated Mining — Drilling Rig x1250  TCV=178,750  315h
    MainScript.IME_JobPool_T5[25] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[25].resourceName  = "Drilling Rig"
    MainScript.IME_JobPool_T5[25].companyName   = "Consolidated Mining"
    MainScript.IME_JobPool_T5[25].companyIndex  = 14
    MainScript.IME_JobPool_T5[25].quantity      = 1250
    MainScript.IME_JobPool_T5[25].baseValue     = 143
    MainScript.IME_JobPool_T5[25].deadlineHours = 315
    MainScript.IME_JobPool_T5[25].rarity        = "Rare"

    ; [ 26] Light Scythe — Isocentered Magnet x5000  TCV=180,000  252h
    MainScript.IME_JobPool_T5[26] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[26].resourceName  = "Isocentered Magnet"
    MainScript.IME_JobPool_T5[26].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T5[26].companyIndex  = 28
    MainScript.IME_JobPool_T5[26].quantity      = 5000
    MainScript.IME_JobPool_T5[26].baseValue     = 36
    MainScript.IME_JobPool_T5[26].deadlineHours = 252
    MainScript.IME_JobPool_T5[26].rarity        = "Common"

    ; [ 27] Ryujin — Semimetal Wafer x1250  TCV=186,250  315h
    MainScript.IME_JobPool_T5[27] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[27].resourceName  = "Semimetal Wafer"
    MainScript.IME_JobPool_T5[27].companyName   = "Ryujin"
    MainScript.IME_JobPool_T5[27].companyIndex  = 37
    MainScript.IME_JobPool_T5[27].quantity      = 1250
    MainScript.IME_JobPool_T5[27].baseValue     = 149
    MainScript.IME_JobPool_T5[27].deadlineHours = 315
    MainScript.IME_JobPool_T5[27].rarity        = "Rare"

    ; [ 28] Axion Energy — Paramagnon Conductor x1250  TCV=191,250  315h
    MainScript.IME_JobPool_T5[28] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[28].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T5[28].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T5[28].companyIndex  = 7
    MainScript.IME_JobPool_T5[28].quantity      = 1250
    MainScript.IME_JobPool_T5[28].baseValue     = 153
    MainScript.IME_JobPool_T5[28].deadlineHours = 315
    MainScript.IME_JobPool_T5[28].rarity        = "Rare"

    ; [ 29] Dogstar — Paramagnon Conductor x1250  TCV=191,250  315h
    MainScript.IME_JobPool_T5[29] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[29].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T5[29].companyName   = "Dogstar"
    MainScript.IME_JobPool_T5[29].companyIndex  = 17
    MainScript.IME_JobPool_T5[29].quantity      = 1250
    MainScript.IME_JobPool_T5[29].baseValue     = 153
    MainScript.IME_JobPool_T5[29].deadlineHours = 315
    MainScript.IME_JobPool_T5[29].rarity        = "Rare"

    ; [ 30] Horizon Defence — Paramagnon Conductor x1250  TCV=191,250  315h
    MainScript.IME_JobPool_T5[30] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[30].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T5[30].companyName   = "Horizon Defence"
    MainScript.IME_JobPool_T5[30].companyIndex  = 24
    MainScript.IME_JobPool_T5[30].quantity      = 1250
    MainScript.IME_JobPool_T5[30].baseValue     = 153
    MainScript.IME_JobPool_T5[30].deadlineHours = 315
    MainScript.IME_JobPool_T5[30].rarity        = "Rare"

    ; [ 31] Axion Energy — Vytinium Fuel Rod x250  TCV=209,000  630h
    MainScript.IME_JobPool_T5[31] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[31].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T5[31].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T5[31].companyIndex  = 7
    MainScript.IME_JobPool_T5[31].quantity      = 250
    MainScript.IME_JobPool_T5[31].baseValue     = 836
    MainScript.IME_JobPool_T5[31].deadlineHours = 630
    MainScript.IME_JobPool_T5[31].rarity        = "Unique"

    ; [ 32] Dogstar — Vytinium Fuel Rod x250  TCV=209,000  630h
    MainScript.IME_JobPool_T5[32] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[32].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T5[32].companyName   = "Dogstar"
    MainScript.IME_JobPool_T5[32].companyIndex  = 17
    MainScript.IME_JobPool_T5[32].quantity      = 250
    MainScript.IME_JobPool_T5[32].baseValue     = 836
    MainScript.IME_JobPool_T5[32].deadlineHours = 630
    MainScript.IME_JobPool_T5[32].rarity        = "Unique"

    ; [ 33] Reladyne — Vytinium Fuel Rod x250  TCV=209,000  630h
    MainScript.IME_JobPool_T5[33] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[33].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T5[33].companyName   = "Reladyne"
    MainScript.IME_JobPool_T5[33].companyIndex  = 35
    MainScript.IME_JobPool_T5[33].quantity      = 250
    MainScript.IME_JobPool_T5[33].baseValue     = 836
    MainScript.IME_JobPool_T5[33].deadlineHours = 630
    MainScript.IME_JobPool_T5[33].rarity        = "Unique"

    ; [ 34] Slayton Aerospace — Vytinium Fuel Rod x250  TCV=209,000  630h
    MainScript.IME_JobPool_T5[34] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[34].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T5[34].companyName   = "Slayton Aerospace"
    MainScript.IME_JobPool_T5[34].companyIndex  = 41
    MainScript.IME_JobPool_T5[34].quantity      = 250
    MainScript.IME_JobPool_T5[34].baseValue     = 836
    MainScript.IME_JobPool_T5[34].deadlineHours = 630
    MainScript.IME_JobPool_T5[34].rarity        = "Unique"

    ; [ 35] Argos Extractors — Aldumite Drilling Rig x500  TCV=210,500  840h
    MainScript.IME_JobPool_T5[35] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[35].resourceName  = "Aldumite Drilling Rig"
    MainScript.IME_JobPool_T5[35].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T5[35].companyIndex  = 5
    MainScript.IME_JobPool_T5[35].quantity      = 500
    MainScript.IME_JobPool_T5[35].baseValue     = 421
    MainScript.IME_JobPool_T5[35].deadlineHours = 840
    MainScript.IME_JobPool_T5[35].rarity        = "Unique"

    ; [ 36] Hopetech — Comm Relay x1875  TCV=219,375  252h
    MainScript.IME_JobPool_T5[36] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[36].resourceName  = "Comm Relay"
    MainScript.IME_JobPool_T5[36].companyName   = "Hopetech"
    MainScript.IME_JobPool_T5[36].companyIndex  = 23
    MainScript.IME_JobPool_T5[36].quantity      = 1875
    MainScript.IME_JobPool_T5[36].baseValue     = 117
    MainScript.IME_JobPool_T5[36].deadlineHours = 252
    MainScript.IME_JobPool_T5[36].rarity        = "Uncommon"

    ; [ 37] Stroud Eklund — Comm Relay x1875  TCV=219,375  252h
    MainScript.IME_JobPool_T5[37] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[37].resourceName  = "Comm Relay"
    MainScript.IME_JobPool_T5[37].companyName   = "Stroud Eklund"
    MainScript.IME_JobPool_T5[37].companyIndex  = 43
    MainScript.IME_JobPool_T5[37].quantity      = 1875
    MainScript.IME_JobPool_T5[37].baseValue     = 117
    MainScript.IME_JobPool_T5[37].deadlineHours = 252
    MainScript.IME_JobPool_T5[37].rarity        = "Uncommon"

    ; [ 38] Taiyo Astroneering — Comm Relay x1875  TCV=219,375  252h
    MainScript.IME_JobPool_T5[38] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[38].resourceName  = "Comm Relay"
    MainScript.IME_JobPool_T5[38].companyName   = "Taiyo Astroneering"
    MainScript.IME_JobPool_T5[38].companyIndex  = 44
    MainScript.IME_JobPool_T5[38].quantity      = 1875
    MainScript.IME_JobPool_T5[38].baseValue     = 117
    MainScript.IME_JobPool_T5[38].deadlineHours = 252
    MainScript.IME_JobPool_T5[38].rarity        = "Uncommon"

    ; [ 39] Muybridge Pharmaceuticals — Molecular Sieve x2500  TCV=227,500  420h
    MainScript.IME_JobPool_T5[39] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[39].resourceName  = "Molecular Sieve"
    MainScript.IME_JobPool_T5[39].companyName   = "Muybridge Pharmaceuticals"
    MainScript.IME_JobPool_T5[39].companyIndex  = 30
    MainScript.IME_JobPool_T5[39].quantity      = 2500
    MainScript.IME_JobPool_T5[39].baseValue     = 91
    MainScript.IME_JobPool_T5[39].deadlineHours = 420
    MainScript.IME_JobPool_T5[39].rarity        = "Rare"

    ; [ 40] Ballistics Solutions — Zero-G Gimbal x2500  TCV=232,500  420h
    MainScript.IME_JobPool_T5[40] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[40].resourceName  = "Zero-G Gimbal"
    MainScript.IME_JobPool_T5[40].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T5[40].companyIndex  = 8
    MainScript.IME_JobPool_T5[40].quantity      = 2500
    MainScript.IME_JobPool_T5[40].baseValue     = 93
    MainScript.IME_JobPool_T5[40].deadlineHours = 420
    MainScript.IME_JobPool_T5[40].rarity        = "Rare"

    ; [ 41] Generdyne Industries — Power Circuit x1250  TCV=243,750  588h
    MainScript.IME_JobPool_T5[41] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[41].resourceName  = "Power Circuit"
    MainScript.IME_JobPool_T5[41].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T5[41].companyIndex  = 22
    MainScript.IME_JobPool_T5[41].quantity      = 1250
    MainScript.IME_JobPool_T5[41].baseValue     = 195
    MainScript.IME_JobPool_T5[41].deadlineHours = 588
    MainScript.IME_JobPool_T5[41].rarity        = "Exotic"

    ; [ 42] Axion Energy — Zero Wire x5000  TCV=260,000  252h
    MainScript.IME_JobPool_T5[42] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[42].resourceName  = "Zero Wire"
    MainScript.IME_JobPool_T5[42].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T5[42].companyIndex  = 7
    MainScript.IME_JobPool_T5[42].quantity      = 5000
    MainScript.IME_JobPool_T5[42].baseValue     = 52
    MainScript.IME_JobPool_T5[42].deadlineHours = 252
    MainScript.IME_JobPool_T5[42].rarity        = "Common"

    ; [ 43] Axion Energy — Supercooled Magnet x2500  TCV=277,500  420h
    MainScript.IME_JobPool_T5[43] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[43].resourceName  = "Supercooled Magnet"
    MainScript.IME_JobPool_T5[43].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T5[43].companyIndex  = 7
    MainScript.IME_JobPool_T5[43].quantity      = 2500
    MainScript.IME_JobPool_T5[43].baseValue     = 111
    MainScript.IME_JobPool_T5[43].deadlineHours = 420
    MainScript.IME_JobPool_T5[43].rarity        = "Rare"

    ; [ 44] Axion Energy — Nuclear Fuel Rod x1250  TCV=281,250  588h
    MainScript.IME_JobPool_T5[44] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[44].resourceName  = "Nuclear Fuel Rod"
    MainScript.IME_JobPool_T5[44].companyName   = "Axion Energy"
    MainScript.IME_JobPool_T5[44].companyIndex  = 7
    MainScript.IME_JobPool_T5[44].quantity      = 1250
    MainScript.IME_JobPool_T5[44].baseValue     = 225
    MainScript.IME_JobPool_T5[44].deadlineHours = 588
    MainScript.IME_JobPool_T5[44].rarity        = "Exotic"

    ; [ 45] Ballistics Solutions — Monopropellant x3750  TCV=285,000  336h
    MainScript.IME_JobPool_T5[45] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[45].resourceName  = "Monopropellant"
    MainScript.IME_JobPool_T5[45].companyName   = "Ballistics Solutions"
    MainScript.IME_JobPool_T5[45].companyIndex  = 8
    MainScript.IME_JobPool_T5[45].quantity      = 3750
    MainScript.IME_JobPool_T5[45].baseValue     = 76
    MainScript.IME_JobPool_T5[45].deadlineHours = 336
    MainScript.IME_JobPool_T5[45].rarity        = "Uncommon"

    ; [ 46] Deep Core — Tau Grade Rheostat x3750  TCV=307,500  336h
    MainScript.IME_JobPool_T5[46] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[46].resourceName  = "Tau Grade Rheostat"
    MainScript.IME_JobPool_T5[46].companyName   = "Deep Core"
    MainScript.IME_JobPool_T5[46].companyIndex  = 15
    MainScript.IME_JobPool_T5[46].quantity      = 3750
    MainScript.IME_JobPool_T5[46].baseValue     = 82
    MainScript.IME_JobPool_T5[46].deadlineHours = 336
    MainScript.IME_JobPool_T5[46].rarity        = "Uncommon"

    ; [ 47] Light Scythe — Positron Battery x2500  TCV=332,500  420h
    MainScript.IME_JobPool_T5[47] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[47].resourceName  = "Positron Battery"
    MainScript.IME_JobPool_T5[47].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T5[47].companyIndex  = 28
    MainScript.IME_JobPool_T5[47].quantity      = 2500
    MainScript.IME_JobPool_T5[47].baseValue     = 133
    MainScript.IME_JobPool_T5[47].deadlineHours = 420
    MainScript.IME_JobPool_T5[47].rarity        = "Rare"

    ; [ 48] Argos Extractors — Drilling Rig x2500  TCV=357,500  420h
    MainScript.IME_JobPool_T5[48] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[48].resourceName  = "Drilling Rig"
    MainScript.IME_JobPool_T5[48].companyName   = "Argos Extractors"
    MainScript.IME_JobPool_T5[48].companyIndex  = 5
    MainScript.IME_JobPool_T5[48].quantity      = 2500
    MainScript.IME_JobPool_T5[48].baseValue     = 143
    MainScript.IME_JobPool_T5[48].deadlineHours = 420
    MainScript.IME_JobPool_T5[48].rarity        = "Rare"

    ; [ 49] Generdyne Industries — Paramagnon Conductor x2500  TCV=382,500  420h
    MainScript.IME_JobPool_T5[49] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[49].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T5[49].companyName   = "Generdyne Industries"
    MainScript.IME_JobPool_T5[49].companyIndex  = 22
    MainScript.IME_JobPool_T5[49].quantity      = 2500
    MainScript.IME_JobPool_T5[49].baseValue     = 153
    MainScript.IME_JobPool_T5[49].deadlineHours = 420
    MainScript.IME_JobPool_T5[49].rarity        = "Rare"

    ; [ 50] Light Scythe — Paramagnon Conductor x2500  TCV=382,500  420h
    MainScript.IME_JobPool_T5[50] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[50].resourceName  = "Paramagnon Conductor"
    MainScript.IME_JobPool_T5[50].companyName   = "Light Scythe"
    MainScript.IME_JobPool_T5[50].companyIndex  = 28
    MainScript.IME_JobPool_T5[50].quantity      = 2500
    MainScript.IME_JobPool_T5[50].baseValue     = 153
    MainScript.IME_JobPool_T5[50].deadlineHours = 420
    MainScript.IME_JobPool_T5[50].rarity        = "Rare"

    ; [ 51] Amun Dunn — Vytinium Fuel Rod x500  TCV=418,000  840h
    MainScript.IME_JobPool_T5[51] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[51].resourceName  = "Vytinium Fuel Rod"
    MainScript.IME_JobPool_T5[51].companyName   = "Amun Dunn"
    MainScript.IME_JobPool_T5[51].companyIndex  = 3
    MainScript.IME_JobPool_T5[51].quantity      = 500
    MainScript.IME_JobPool_T5[51].baseValue     = 836
    MainScript.IME_JobPool_T5[51].deadlineHours = 840
    MainScript.IME_JobPool_T5[51].rarity        = "Unique"

    ; [ 52] Deimos Staryards — Comm Relay x3750  TCV=438,750  336h
    MainScript.IME_JobPool_T5[52] = new IME_MainQuestScript:JobTemplate
    MainScript.IME_JobPool_T5[52].resourceName  = "Comm Relay"
    MainScript.IME_JobPool_T5[52].companyName   = "Deimos Staryards"
    MainScript.IME_JobPool_T5[52].companyIndex  = 16
    MainScript.IME_JobPool_T5[52].quantity      = 3750
    MainScript.IME_JobPool_T5[52].baseValue     = 117
    MainScript.IME_JobPool_T5[52].deadlineHours = 336
    MainScript.IME_JobPool_T5[52].rarity        = "Uncommon"

EndFunction
