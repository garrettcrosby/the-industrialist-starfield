; ═══════════════════════════════════════════════════════════════════════════════
; IME_CompanyLookup.psc
; Attached to: IME_MainQuest
; Auto-generated from the_industrialist_mod_v2.xlsx
;
; Provides GetIndex(tier, resIdx, pickIdx) -> company index
; Papyrus has no array-of-arrays, so each resource's company list
; is a separate Int[] property populated in InitCompanyLists().
; Called once from IME_MainQuestScript.OnInit().
; ═══════════════════════════════════════════════════════════════════════════════

ScriptName IME_CompanyLookup Extends Quest

; Wire in CK
IME_MainQuestScript Property MainScript Auto

; ── Tier 1 company lists ──────────────────────────────────────────────────
Int[] Property IME_T1_R00_Companies Auto ; Alkanes (5)
Int[] Property IME_T1_R01_Companies Auto ; Aluminum (27)
Int[] Property IME_T1_R02_Companies Auto ; Antimicrobial (6)
Int[] Property IME_T1_R03_Companies Auto ; Argon (3)
Int[] Property IME_T1_R04_Companies Auto ; Benzene (2)
Int[] Property IME_T1_R05_Companies Auto ; Beryllium (5)
Int[] Property IME_T1_R06_Companies Auto ; Chlorine (6)
Int[] Property IME_T1_R07_Companies Auto ; Chlorosilanes (5)
Int[] Property IME_T1_R08_Companies Auto ; Cobalt (3)
Int[] Property IME_T1_R09_Companies Auto ; Copper (6)
Int[] Property IME_T1_R10_Companies Auto ; Cosmetic (3)
Int[] Property IME_T1_R11_Companies Auto ; Fiber (2)
Int[] Property IME_T1_R12_Companies Auto ; Fluorine (3)
Int[] Property IME_T1_R13_Companies Auto ; Helium-3 (21)
Int[] Property IME_T1_R14_Companies Auto ; Iridium (24)
Int[] Property IME_T1_R15_Companies Auto ; Iron (30)
Int[] Property IME_T1_R16_Companies Auto ; Lead (3)
Int[] Property IME_T1_R17_Companies Auto ; Membrane (7)
Int[] Property IME_T1_R18_Companies Auto ; Metabolic Agent (2)
Int[] Property IME_T1_R19_Companies Auto ; Nickel (6)
Int[] Property IME_T1_R20_Companies Auto ; Nutrient (5)
Int[] Property IME_T1_R21_Companies Auto ; Ornamental Material (3)
Int[] Property IME_T1_R22_Companies Auto ; Pigment (3)
Int[] Property IME_T1_R23_Companies Auto ; Sealant (27)
Int[] Property IME_T1_R24_Companies Auto ; Silver (4)
Int[] Property IME_T1_R25_Companies Auto ; Spice (5)
Int[] Property IME_T1_R26_Companies Auto ; Structural Material (3)
Int[] Property IME_T1_R27_Companies Auto ; Toxin (7)
Int[] Property IME_T1_R28_Companies Auto ; Tungsten (27)
Int[] Property IME_T1_R29_Companies Auto ; Uranium (22)
Int[] Property IME_T1_R30_Companies Auto ; Water (32)

; ── Tier 2 company lists ──────────────────────────────────────────────────
Int[] Property IME_T2_R00_Companies Auto ; Adaptive Frame (24)
Int[] Property IME_T2_R01_Companies Auto ; Adhesive (3)
Int[] Property IME_T2_R02_Companies Auto ; Amino Acids (2)
Int[] Property IME_T2_R03_Companies Auto ; Analgesic (3)
Int[] Property IME_T2_R04_Companies Auto ; Aromatic (1)
Int[] Property IME_T2_R05_Companies Auto ; Austenitic Manifold (24)
Int[] Property IME_T2_R06_Companies Auto ; Carboxylic Acids (2)
Int[] Property IME_T2_R07_Companies Auto ; Comm Relay (21)
Int[] Property IME_T2_R08_Companies Auto ; Gold (4)
Int[] Property IME_T2_R09_Companies Auto ; Hallucinogen (2)
Int[] Property IME_T2_R10_Companies Auto ; Isocentered Magnet (24)
Int[] Property IME_T2_R11_Companies Auto ; Isotopic Coolant (25)
Int[] Property IME_T2_R12_Companies Auto ; Lithium (25)
Int[] Property IME_T2_R13_Companies Auto ; Mag Pressure Tank (10)
Int[] Property IME_T2_R14_Companies Auto ; Mercury (2)
Int[] Property IME_T2_R15_Companies Auto ; Monopropellant (21)
Int[] Property IME_T2_R16_Companies Auto ; Neodymium (24)
Int[] Property IME_T2_R17_Companies Auto ; Platinum (6)
Int[] Property IME_T2_R18_Companies Auto ; Polytextile (4)
Int[] Property IME_T2_R19_Companies Auto ; Reactive Gauge (3)
Int[] Property IME_T2_R20_Companies Auto ; Sedative (7)
Int[] Property IME_T2_R21_Companies Auto ; Tantalum (24)
Int[] Property IME_T2_R22_Companies Auto ; Tau Grade Rheostat (22)
Int[] Property IME_T2_R23_Companies Auto ; Tetrafluorides (2)
Int[] Property IME_T2_R24_Companies Auto ; Titanium (30)
Int[] Property IME_T2_R25_Companies Auto ; Vanadium (6)
Int[] Property IME_T2_R26_Companies Auto ; Zero Wire (28)

; ── Tier 3 company lists ──────────────────────────────────────────────────
Int[] Property IME_T3_R00_Companies Auto ; Antimony (21)
Int[] Property IME_T3_R01_Companies Auto ; Biosuppressant (2)
Int[] Property IME_T3_R02_Companies Auto ; Caesium (25)
Int[] Property IME_T3_R03_Companies Auto ; Drilling Rig (3)
Int[] Property IME_T3_R04_Companies Auto ; Dysprosium (4)
Int[] Property IME_T3_R05_Companies Auto ; Europium (21)
Int[] Property IME_T3_R06_Companies Auto ; Hypercatalyst (2)
Int[] Property IME_T3_R07_Companies Auto ; Ionic Liquids (27)
Int[] Property IME_T3_R08_Companies Auto ; Lubricant (6)
Int[] Property IME_T3_R09_Companies Auto ; Molecular Sieve (12)
Int[] Property IME_T3_R10_Companies Auto ; Neon (3)
Int[] Property IME_T3_R11_Companies Auto ; Palladium (21)
Int[] Property IME_T3_R12_Companies Auto ; Paramagnon Conductor (22)
Int[] Property IME_T3_R13_Companies Auto ; Plutonium (6)
Int[] Property IME_T3_R14_Companies Auto ; Polymer (7)
Int[] Property IME_T3_R15_Companies Auto ; Positron Battery (21)
Int[] Property IME_T3_R16_Companies Auto ; Semimetal Wafer (6)
Int[] Property IME_T3_R17_Companies Auto ; Solvent (9)
Int[] Property IME_T3_R18_Companies Auto ; Stimulant (7)
Int[] Property IME_T3_R19_Companies Auto ; Supercooled Magnet (22)
Int[] Property IME_T3_R20_Companies Auto ; Xenon (3)
Int[] Property IME_T3_R21_Companies Auto ; Ytterbium (21)
Int[] Property IME_T3_R22_Companies Auto ; Zero-G Gimbal (21)

; ── Tier 4 company lists ──────────────────────────────────────────────────
Int[] Property IME_T4_R00_Companies Auto ; Aldumite (3)
Int[] Property IME_T4_R01_Companies Auto ; Control Rod (28)
Int[] Property IME_T4_R02_Companies Auto ; Gastronomic Delight (5)
Int[] Property IME_T4_R03_Companies Auto ; High-Tensile Spidroin (2)
Int[] Property IME_T4_R04_Companies Auto ; Immunostimulant (2)
Int[] Property IME_T4_R05_Companies Auto ; Luxury Textile (2)
Int[] Property IME_T4_R06_Companies Auto ; Memory Substrate (6)
Int[] Property IME_T4_R07_Companies Auto ; Microsecond Regulator (8)
Int[] Property IME_T4_R08_Companies Auto ; Neurologic (6)
Int[] Property IME_T4_R09_Companies Auto ; Nuclear Fuel Rod (1)
Int[] Property IME_T4_R10_Companies Auto ; Power Circuit (1)
Int[] Property IME_T4_R11_Companies Auto ; Quark-Degenerate Tissues (5)
Int[] Property IME_T4_R12_Companies Auto ; Sterile Nanotubes (21)
Int[] Property IME_T4_R13_Companies Auto ; Vytinium (1)

; ── Tier 5 company lists ──────────────────────────────────────────────────
Int[] Property IME_T5_R00_Companies Auto ; Aldumite Drilling Rig (3)
Int[] Property IME_T5_R01_Companies Auto ; Indicite Wafer (8)
Int[] Property IME_T5_R02_Companies Auto ; Rothicite Magnet (1)
Int[] Property IME_T5_R03_Companies Auto ; Substrate Molecule Sieve (6)
Int[] Property IME_T5_R04_Companies Auto ; Tasine Superconductor (1)
Int[] Property IME_T5_R05_Companies Auto ; Veryl-Treated Manifold (24)
Int[] Property IME_T5_R06_Companies Auto ; Vytinium Fuel Rod (22)

; Call this from IME_MainQuestScript.OnInit() after data init
Function InitCompanyLists()
    ; Tier 1
    IME_T1_R00_Companies = new Int[5]  ; Alkanes
    IME_T1_R00_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T1_R00_Companies[1] =  5  ; Filburn Agriculture
    IME_T1_R00_Companies[2] =  6  ; Chunks
    IME_T1_R00_Companies[3] =  7  ; Centauri Mills
    IME_T1_R00_Companies[4] =  8  ; Chandra Vineyards

    IME_T1_R01_Companies = new Int[27]  ; Aluminum
    IME_T1_R01_Companies[0] =  9  ; Arc Might
    IME_T1_R01_Companies[1] = 10  ; Celtcorp
    IME_T1_R01_Companies[2] = 15  ; Taiyo Astroneering
    IME_T1_R01_Companies[3] = 16  ; Trident Luxury Lines
    IME_T1_R01_Companies[4] = 17  ; Stroud Eklund
    IME_T1_R01_Companies[5] = 18  ; Deimos Staryards
    IME_T1_R01_Companies[6] = 19  ; Hopetech
    IME_T1_R01_Companies[7] = 20  ; Nova Galactic
    IME_T1_R01_Companies[8] = 21  ; Slayton Aerospace
    IME_T1_R01_Companies[9] = 22  ; Amun Dunn
    IME_T1_R01_Companies[10] = 23  ; Panoptes
    IME_T1_R01_Companies[11] = 24  ; Reladyne
    IME_T1_R01_Companies[12] = 25  ; Dogstar
    IME_T1_R01_Companies[13] = 26  ; Sextant Shield Systems
    IME_T1_R01_Companies[14] = 27  ; Nautilus
    IME_T1_R01_Companies[15] = 28  ; Protectorate Systems
    IME_T1_R01_Companies[16] = 29  ; Vanguard
    IME_T1_R01_Companies[17] = 30  ; Deep Core
    IME_T1_R01_Companies[18] = 31  ; Xiang
    IME_T1_R01_Companies[19] = 32  ; Ballistics Solutions
    IME_T1_R01_Companies[20] = 33  ; Light Scythe
    IME_T1_R01_Companies[21] = 34  ; Shinigami
    IME_T1_R01_Companies[22] = 35  ; Horizon Defence
    IME_T1_R01_Companies[23] = 39  ; Ryujin
    IME_T1_R01_Companies[24] = 40  ; Kore Kinetics
    IME_T1_R01_Companies[25] = 41  ; Laredo
    IME_T1_R01_Companies[26] = 42  ; Aboron

    IME_T1_R02_Companies = new Int[6]  ; Antimicrobial
    IME_T1_R02_Companies[0] = 10  ; Celtcorp
    IME_T1_R02_Companies[1] = 11  ; Reliant Medical
    IME_T1_R02_Companies[2] = 36  ; Son
    IME_T1_R02_Companies[3] = 37  ; Lunar Robotics
    IME_T1_R02_Companies[4] = 38  ; Infinity Ltd
    IME_T1_R02_Companies[5] = 39  ; Ryujin

    IME_T1_R03_Companies = new Int[3]  ; Argon
    IME_T1_R03_Companies[0] =  9  ; Arc Might
    IME_T1_R03_Companies[1] = 10  ; Celtcorp
    IME_T1_R03_Companies[2] = 39  ; Ryujin

    IME_T1_R04_Companies = new Int[2]  ; Benzene
    IME_T1_R04_Companies[0] = 11  ; Reliant Medical
    IME_T1_R04_Companies[1] = 39  ; Ryujin

    IME_T1_R05_Companies = new Int[5]  ; Beryllium
    IME_T1_R05_Companies[0] = 10  ; Celtcorp
    IME_T1_R05_Companies[1] = 36  ; Son
    IME_T1_R05_Companies[2] = 37  ; Lunar Robotics
    IME_T1_R05_Companies[3] = 38  ; Infinity Ltd
    IME_T1_R05_Companies[4] = 39  ; Ryujin

    IME_T1_R06_Companies = new Int[6]  ; Chlorine
    IME_T1_R06_Companies[0] = 10  ; Celtcorp
    IME_T1_R06_Companies[1] = 11  ; Reliant Medical
    IME_T1_R06_Companies[2] = 36  ; Son
    IME_T1_R06_Companies[3] = 37  ; Lunar Robotics
    IME_T1_R06_Companies[4] = 38  ; Infinity Ltd
    IME_T1_R06_Companies[5] = 39  ; Ryujin

    IME_T1_R07_Companies = new Int[5]  ; Chlorosilanes
    IME_T1_R07_Companies[0] = 10  ; Celtcorp
    IME_T1_R07_Companies[1] = 36  ; Son
    IME_T1_R07_Companies[2] = 37  ; Lunar Robotics
    IME_T1_R07_Companies[3] = 38  ; Infinity Ltd
    IME_T1_R07_Companies[4] = 39  ; Ryujin

    IME_T1_R08_Companies = new Int[3]  ; Cobalt
    IME_T1_R08_Companies[0] = 40  ; Kore Kinetics
    IME_T1_R08_Companies[1] = 41  ; Laredo
    IME_T1_R08_Companies[2] = 42  ; Aboron

    IME_T1_R09_Companies = new Int[6]  ; Copper
    IME_T1_R09_Companies[0] =  9  ; Arc Might
    IME_T1_R09_Companies[1] = 10  ; Celtcorp
    IME_T1_R09_Companies[2] = 39  ; Ryujin
    IME_T1_R09_Companies[3] = 40  ; Kore Kinetics
    IME_T1_R09_Companies[4] = 41  ; Laredo
    IME_T1_R09_Companies[5] = 42  ; Aboron

    IME_T1_R10_Companies = new Int[3]  ; Cosmetic
    IME_T1_R10_Companies[0] =  0  ; Eit Clothiers
    IME_T1_R10_Companies[1] =  1  ; Enhance
    IME_T1_R10_Companies[2] = 39  ; Ryujin

    IME_T1_R11_Companies = new Int[2]  ; Fiber
    IME_T1_R11_Companies[0] =  0  ; Eit Clothiers
    IME_T1_R11_Companies[1] = 39  ; Ryujin

    IME_T1_R12_Companies = new Int[3]  ; Fluorine
    IME_T1_R12_Companies[0] =  9  ; Arc Might
    IME_T1_R12_Companies[1] = 10  ; Celtcorp
    IME_T1_R12_Companies[2] = 39  ; Ryujin

    IME_T1_R13_Companies = new Int[21]  ; Helium-3
    IME_T1_R13_Companies[0] = 15  ; Taiyo Astroneering
    IME_T1_R13_Companies[1] = 16  ; Trident Luxury Lines
    IME_T1_R13_Companies[2] = 17  ; Stroud Eklund
    IME_T1_R13_Companies[3] = 18  ; Deimos Staryards
    IME_T1_R13_Companies[4] = 19  ; Hopetech
    IME_T1_R13_Companies[5] = 20  ; Nova Galactic
    IME_T1_R13_Companies[6] = 21  ; Slayton Aerospace
    IME_T1_R13_Companies[7] = 22  ; Amun Dunn
    IME_T1_R13_Companies[8] = 23  ; Panoptes
    IME_T1_R13_Companies[9] = 24  ; Reladyne
    IME_T1_R13_Companies[10] = 25  ; Dogstar
    IME_T1_R13_Companies[11] = 26  ; Sextant Shield Systems
    IME_T1_R13_Companies[12] = 27  ; Nautilus
    IME_T1_R13_Companies[13] = 28  ; Protectorate Systems
    IME_T1_R13_Companies[14] = 29  ; Vanguard
    IME_T1_R13_Companies[15] = 30  ; Deep Core
    IME_T1_R13_Companies[16] = 31  ; Xiang
    IME_T1_R13_Companies[17] = 32  ; Ballistics Solutions
    IME_T1_R13_Companies[18] = 33  ; Light Scythe
    IME_T1_R13_Companies[19] = 34  ; Shinigami
    IME_T1_R13_Companies[20] = 35  ; Horizon Defence

    IME_T1_R14_Companies = new Int[24]  ; Iridium
    IME_T1_R14_Companies[0] = 15  ; Taiyo Astroneering
    IME_T1_R14_Companies[1] = 16  ; Trident Luxury Lines
    IME_T1_R14_Companies[2] = 17  ; Stroud Eklund
    IME_T1_R14_Companies[3] = 18  ; Deimos Staryards
    IME_T1_R14_Companies[4] = 19  ; Hopetech
    IME_T1_R14_Companies[5] = 20  ; Nova Galactic
    IME_T1_R14_Companies[6] = 21  ; Slayton Aerospace
    IME_T1_R14_Companies[7] = 22  ; Amun Dunn
    IME_T1_R14_Companies[8] = 23  ; Panoptes
    IME_T1_R14_Companies[9] = 24  ; Reladyne
    IME_T1_R14_Companies[10] = 25  ; Dogstar
    IME_T1_R14_Companies[11] = 26  ; Sextant Shield Systems
    IME_T1_R14_Companies[12] = 27  ; Nautilus
    IME_T1_R14_Companies[13] = 28  ; Protectorate Systems
    IME_T1_R14_Companies[14] = 29  ; Vanguard
    IME_T1_R14_Companies[15] = 30  ; Deep Core
    IME_T1_R14_Companies[16] = 31  ; Xiang
    IME_T1_R14_Companies[17] = 32  ; Ballistics Solutions
    IME_T1_R14_Companies[18] = 33  ; Light Scythe
    IME_T1_R14_Companies[19] = 34  ; Shinigami
    IME_T1_R14_Companies[20] = 35  ; Horizon Defence
    IME_T1_R14_Companies[21] = 40  ; Kore Kinetics
    IME_T1_R14_Companies[22] = 41  ; Laredo
    IME_T1_R14_Companies[23] = 42  ; Aboron

    IME_T1_R15_Companies = new Int[30]  ; Iron
    IME_T1_R15_Companies[0] =  9  ; Arc Might
    IME_T1_R15_Companies[1] = 10  ; Celtcorp
    IME_T1_R15_Companies[2] = 12  ; Argos Extractors
    IME_T1_R15_Companies[3] = 13  ; Consolidated Mining
    IME_T1_R15_Companies[4] = 14  ; Six Sisters
    IME_T1_R15_Companies[5] = 15  ; Taiyo Astroneering
    IME_T1_R15_Companies[6] = 16  ; Trident Luxury Lines
    IME_T1_R15_Companies[7] = 17  ; Stroud Eklund
    IME_T1_R15_Companies[8] = 18  ; Deimos Staryards
    IME_T1_R15_Companies[9] = 19  ; Hopetech
    IME_T1_R15_Companies[10] = 20  ; Nova Galactic
    IME_T1_R15_Companies[11] = 21  ; Slayton Aerospace
    IME_T1_R15_Companies[12] = 22  ; Amun Dunn
    IME_T1_R15_Companies[13] = 23  ; Panoptes
    IME_T1_R15_Companies[14] = 24  ; Reladyne
    IME_T1_R15_Companies[15] = 25  ; Dogstar
    IME_T1_R15_Companies[16] = 26  ; Sextant Shield Systems
    IME_T1_R15_Companies[17] = 27  ; Nautilus
    IME_T1_R15_Companies[18] = 28  ; Protectorate Systems
    IME_T1_R15_Companies[19] = 29  ; Vanguard
    IME_T1_R15_Companies[20] = 30  ; Deep Core
    IME_T1_R15_Companies[21] = 31  ; Xiang
    IME_T1_R15_Companies[22] = 32  ; Ballistics Solutions
    IME_T1_R15_Companies[23] = 33  ; Light Scythe
    IME_T1_R15_Companies[24] = 34  ; Shinigami
    IME_T1_R15_Companies[25] = 35  ; Horizon Defence
    IME_T1_R15_Companies[26] = 39  ; Ryujin
    IME_T1_R15_Companies[27] = 40  ; Kore Kinetics
    IME_T1_R15_Companies[28] = 41  ; Laredo
    IME_T1_R15_Companies[29] = 42  ; Aboron

    IME_T1_R16_Companies = new Int[3]  ; Lead
    IME_T1_R16_Companies[0] = 40  ; Kore Kinetics
    IME_T1_R16_Companies[1] = 41  ; Laredo
    IME_T1_R16_Companies[2] = 42  ; Aboron

    IME_T1_R17_Companies = new Int[7]  ; Membrane
    IME_T1_R17_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T1_R17_Companies[1] =  5  ; Filburn Agriculture
    IME_T1_R17_Companies[2] =  6  ; Chunks
    IME_T1_R17_Companies[3] =  7  ; Centauri Mills
    IME_T1_R17_Companies[4] =  8  ; Chandra Vineyards
    IME_T1_R17_Companies[5] = 11  ; Reliant Medical
    IME_T1_R17_Companies[6] = 39  ; Ryujin

    IME_T1_R18_Companies = new Int[2]  ; Metabolic Agent
    IME_T1_R18_Companies[0] = 11  ; Reliant Medical
    IME_T1_R18_Companies[1] = 39  ; Ryujin

    IME_T1_R19_Companies = new Int[6]  ; Nickel
    IME_T1_R19_Companies[0] = 12  ; Argos Extractors
    IME_T1_R19_Companies[1] = 13  ; Consolidated Mining
    IME_T1_R19_Companies[2] = 14  ; Six Sisters
    IME_T1_R19_Companies[3] = 40  ; Kore Kinetics
    IME_T1_R19_Companies[4] = 41  ; Laredo
    IME_T1_R19_Companies[5] = 42  ; Aboron

    IME_T1_R20_Companies = new Int[5]  ; Nutrient
    IME_T1_R20_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T1_R20_Companies[1] =  5  ; Filburn Agriculture
    IME_T1_R20_Companies[2] =  6  ; Chunks
    IME_T1_R20_Companies[3] =  7  ; Centauri Mills
    IME_T1_R20_Companies[4] =  8  ; Chandra Vineyards

    IME_T1_R21_Companies = new Int[3]  ; Ornamental Material
    IME_T1_R21_Companies[0] =  0  ; Eit Clothiers
    IME_T1_R21_Companies[1] =  1  ; Enhance
    IME_T1_R21_Companies[2] = 39  ; Ryujin

    IME_T1_R22_Companies = new Int[3]  ; Pigment
    IME_T1_R22_Companies[0] =  0  ; Eit Clothiers
    IME_T1_R22_Companies[1] =  1  ; Enhance
    IME_T1_R22_Companies[2] = 39  ; Ryujin

    IME_T1_R23_Companies = new Int[27]  ; Sealant
    IME_T1_R23_Companies[0] =  9  ; Arc Might
    IME_T1_R23_Companies[1] = 10  ; Celtcorp
    IME_T1_R23_Companies[2] = 15  ; Taiyo Astroneering
    IME_T1_R23_Companies[3] = 16  ; Trident Luxury Lines
    IME_T1_R23_Companies[4] = 17  ; Stroud Eklund
    IME_T1_R23_Companies[5] = 18  ; Deimos Staryards
    IME_T1_R23_Companies[6] = 19  ; Hopetech
    IME_T1_R23_Companies[7] = 20  ; Nova Galactic
    IME_T1_R23_Companies[8] = 21  ; Slayton Aerospace
    IME_T1_R23_Companies[9] = 22  ; Amun Dunn
    IME_T1_R23_Companies[10] = 23  ; Panoptes
    IME_T1_R23_Companies[11] = 24  ; Reladyne
    IME_T1_R23_Companies[12] = 25  ; Dogstar
    IME_T1_R23_Companies[13] = 26  ; Sextant Shield Systems
    IME_T1_R23_Companies[14] = 27  ; Nautilus
    IME_T1_R23_Companies[15] = 28  ; Protectorate Systems
    IME_T1_R23_Companies[16] = 29  ; Vanguard
    IME_T1_R23_Companies[17] = 30  ; Deep Core
    IME_T1_R23_Companies[18] = 31  ; Xiang
    IME_T1_R23_Companies[19] = 32  ; Ballistics Solutions
    IME_T1_R23_Companies[20] = 33  ; Light Scythe
    IME_T1_R23_Companies[21] = 34  ; Shinigami
    IME_T1_R23_Companies[22] = 35  ; Horizon Defence
    IME_T1_R23_Companies[23] = 39  ; Ryujin
    IME_T1_R23_Companies[24] = 40  ; Kore Kinetics
    IME_T1_R23_Companies[25] = 41  ; Laredo
    IME_T1_R23_Companies[26] = 42  ; Aboron

    IME_T1_R24_Companies = new Int[4]  ; Silver
    IME_T1_R24_Companies[0] =  3  ; Galbank
    IME_T1_R24_Companies[1] =  9  ; Arc Might
    IME_T1_R24_Companies[2] = 10  ; Celtcorp
    IME_T1_R24_Companies[3] = 39  ; Ryujin

    IME_T1_R25_Companies = new Int[5]  ; Spice
    IME_T1_R25_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T1_R25_Companies[1] =  5  ; Filburn Agriculture
    IME_T1_R25_Companies[2] =  6  ; Chunks
    IME_T1_R25_Companies[3] =  7  ; Centauri Mills
    IME_T1_R25_Companies[4] =  8  ; Chandra Vineyards

    IME_T1_R26_Companies = new Int[3]  ; Structural Material
    IME_T1_R26_Companies[0] =  9  ; Arc Might
    IME_T1_R26_Companies[1] = 10  ; Celtcorp
    IME_T1_R26_Companies[2] = 39  ; Ryujin

    IME_T1_R27_Companies = new Int[7]  ; Toxin
    IME_T1_R27_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T1_R27_Companies[1] =  5  ; Filburn Agriculture
    IME_T1_R27_Companies[2] =  6  ; Chunks
    IME_T1_R27_Companies[3] =  7  ; Centauri Mills
    IME_T1_R27_Companies[4] =  8  ; Chandra Vineyards
    IME_T1_R27_Companies[5] = 11  ; Reliant Medical
    IME_T1_R27_Companies[6] = 39  ; Ryujin

    IME_T1_R28_Companies = new Int[27]  ; Tungsten
    IME_T1_R28_Companies[0] =  9  ; Arc Might
    IME_T1_R28_Companies[1] = 10  ; Celtcorp
    IME_T1_R28_Companies[2] = 12  ; Argos Extractors
    IME_T1_R28_Companies[3] = 13  ; Consolidated Mining
    IME_T1_R28_Companies[4] = 14  ; Six Sisters
    IME_T1_R28_Companies[5] = 15  ; Taiyo Astroneering
    IME_T1_R28_Companies[6] = 16  ; Trident Luxury Lines
    IME_T1_R28_Companies[7] = 17  ; Stroud Eklund
    IME_T1_R28_Companies[8] = 18  ; Deimos Staryards
    IME_T1_R28_Companies[9] = 19  ; Hopetech
    IME_T1_R28_Companies[10] = 20  ; Nova Galactic
    IME_T1_R28_Companies[11] = 21  ; Slayton Aerospace
    IME_T1_R28_Companies[12] = 22  ; Amun Dunn
    IME_T1_R28_Companies[13] = 23  ; Panoptes
    IME_T1_R28_Companies[14] = 24  ; Reladyne
    IME_T1_R28_Companies[15] = 25  ; Dogstar
    IME_T1_R28_Companies[16] = 26  ; Sextant Shield Systems
    IME_T1_R28_Companies[17] = 27  ; Nautilus
    IME_T1_R28_Companies[18] = 28  ; Protectorate Systems
    IME_T1_R28_Companies[19] = 29  ; Vanguard
    IME_T1_R28_Companies[20] = 30  ; Deep Core
    IME_T1_R28_Companies[21] = 31  ; Xiang
    IME_T1_R28_Companies[22] = 32  ; Ballistics Solutions
    IME_T1_R28_Companies[23] = 33  ; Light Scythe
    IME_T1_R28_Companies[24] = 34  ; Shinigami
    IME_T1_R28_Companies[25] = 35  ; Horizon Defence
    IME_T1_R28_Companies[26] = 39  ; Ryujin

    IME_T1_R29_Companies = new Int[22]  ; Uranium
    IME_T1_R29_Companies[0] =  2  ; Generdyne Industries
    IME_T1_R29_Companies[1] = 15  ; Taiyo Astroneering
    IME_T1_R29_Companies[2] = 16  ; Trident Luxury Lines
    IME_T1_R29_Companies[3] = 17  ; Stroud Eklund
    IME_T1_R29_Companies[4] = 18  ; Deimos Staryards
    IME_T1_R29_Companies[5] = 19  ; Hopetech
    IME_T1_R29_Companies[6] = 20  ; Nova Galactic
    IME_T1_R29_Companies[7] = 21  ; Slayton Aerospace
    IME_T1_R29_Companies[8] = 22  ; Amun Dunn
    IME_T1_R29_Companies[9] = 23  ; Panoptes
    IME_T1_R29_Companies[10] = 24  ; Reladyne
    IME_T1_R29_Companies[11] = 25  ; Dogstar
    IME_T1_R29_Companies[12] = 26  ; Sextant Shield Systems
    IME_T1_R29_Companies[13] = 27  ; Nautilus
    IME_T1_R29_Companies[14] = 28  ; Protectorate Systems
    IME_T1_R29_Companies[15] = 29  ; Vanguard
    IME_T1_R29_Companies[16] = 30  ; Deep Core
    IME_T1_R29_Companies[17] = 31  ; Xiang
    IME_T1_R29_Companies[18] = 32  ; Ballistics Solutions
    IME_T1_R29_Companies[19] = 33  ; Light Scythe
    IME_T1_R29_Companies[20] = 34  ; Shinigami
    IME_T1_R29_Companies[21] = 35  ; Horizon Defence

    IME_T1_R30_Companies = new Int[32]  ; Water
    IME_T1_R30_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T1_R30_Companies[1] =  5  ; Filburn Agriculture
    IME_T1_R30_Companies[2] =  6  ; Chunks
    IME_T1_R30_Companies[3] =  7  ; Centauri Mills
    IME_T1_R30_Companies[4] =  8  ; Chandra Vineyards
    IME_T1_R30_Companies[5] =  9  ; Arc Might
    IME_T1_R30_Companies[6] = 10  ; Celtcorp
    IME_T1_R30_Companies[7] = 15  ; Taiyo Astroneering
    IME_T1_R30_Companies[8] = 16  ; Trident Luxury Lines
    IME_T1_R30_Companies[9] = 17  ; Stroud Eklund
    IME_T1_R30_Companies[10] = 18  ; Deimos Staryards
    IME_T1_R30_Companies[11] = 19  ; Hopetech
    IME_T1_R30_Companies[12] = 20  ; Nova Galactic
    IME_T1_R30_Companies[13] = 21  ; Slayton Aerospace
    IME_T1_R30_Companies[14] = 22  ; Amun Dunn
    IME_T1_R30_Companies[15] = 23  ; Panoptes
    IME_T1_R30_Companies[16] = 24  ; Reladyne
    IME_T1_R30_Companies[17] = 25  ; Dogstar
    IME_T1_R30_Companies[18] = 26  ; Sextant Shield Systems
    IME_T1_R30_Companies[19] = 27  ; Nautilus
    IME_T1_R30_Companies[20] = 28  ; Protectorate Systems
    IME_T1_R30_Companies[21] = 29  ; Vanguard
    IME_T1_R30_Companies[22] = 30  ; Deep Core
    IME_T1_R30_Companies[23] = 31  ; Xiang
    IME_T1_R30_Companies[24] = 32  ; Ballistics Solutions
    IME_T1_R30_Companies[25] = 33  ; Light Scythe
    IME_T1_R30_Companies[26] = 34  ; Shinigami
    IME_T1_R30_Companies[27] = 35  ; Horizon Defence
    IME_T1_R30_Companies[28] = 36  ; Son
    IME_T1_R30_Companies[29] = 37  ; Lunar Robotics
    IME_T1_R30_Companies[30] = 38  ; Infinity Ltd
    IME_T1_R30_Companies[31] = 39  ; Ryujin

    ; Tier 2
    IME_T2_R00_Companies = new Int[24]  ; Adaptive Frame
    IME_T2_R00_Companies[0] =  9  ; Arc Might
    IME_T2_R00_Companies[1] = 10  ; Celtcorp
    IME_T2_R00_Companies[2] = 15  ; Taiyo Astroneering
    IME_T2_R00_Companies[3] = 16  ; Trident Luxury Lines
    IME_T2_R00_Companies[4] = 17  ; Stroud Eklund
    IME_T2_R00_Companies[5] = 18  ; Deimos Staryards
    IME_T2_R00_Companies[6] = 19  ; Hopetech
    IME_T2_R00_Companies[7] = 20  ; Nova Galactic
    IME_T2_R00_Companies[8] = 21  ; Slayton Aerospace
    IME_T2_R00_Companies[9] = 22  ; Amun Dunn
    IME_T2_R00_Companies[10] = 23  ; Panoptes
    IME_T2_R00_Companies[11] = 24  ; Reladyne
    IME_T2_R00_Companies[12] = 25  ; Dogstar
    IME_T2_R00_Companies[13] = 26  ; Sextant Shield Systems
    IME_T2_R00_Companies[14] = 27  ; Nautilus
    IME_T2_R00_Companies[15] = 28  ; Protectorate Systems
    IME_T2_R00_Companies[16] = 29  ; Vanguard
    IME_T2_R00_Companies[17] = 30  ; Deep Core
    IME_T2_R00_Companies[18] = 31  ; Xiang
    IME_T2_R00_Companies[19] = 32  ; Ballistics Solutions
    IME_T2_R00_Companies[20] = 33  ; Light Scythe
    IME_T2_R00_Companies[21] = 34  ; Shinigami
    IME_T2_R00_Companies[22] = 35  ; Horizon Defence
    IME_T2_R00_Companies[23] = 39  ; Ryujin

    IME_T2_R01_Companies = new Int[3]  ; Adhesive
    IME_T2_R01_Companies[0] =  9  ; Arc Might
    IME_T2_R01_Companies[1] = 10  ; Celtcorp
    IME_T2_R01_Companies[2] = 39  ; Ryujin

    IME_T2_R02_Companies = new Int[2]  ; Amino Acids
    IME_T2_R02_Companies[0] = 11  ; Reliant Medical
    IME_T2_R02_Companies[1] = 39  ; Ryujin

    IME_T2_R03_Companies = new Int[3]  ; Analgesic
    IME_T2_R03_Companies[0] =  1  ; Enhance
    IME_T2_R03_Companies[1] = 11  ; Reliant Medical
    IME_T2_R03_Companies[2] = 39  ; Ryujin

    IME_T2_R04_Companies = new Int[1]  ; Aromatic
    IME_T2_R04_Companies[0] =  1  ; Enhance

    IME_T2_R05_Companies = new Int[24]  ; Austenitic Manifold
    IME_T2_R05_Companies[0] = 12  ; Argos Extractors
    IME_T2_R05_Companies[1] = 13  ; Consolidated Mining
    IME_T2_R05_Companies[2] = 14  ; Six Sisters
    IME_T2_R05_Companies[3] = 15  ; Taiyo Astroneering
    IME_T2_R05_Companies[4] = 16  ; Trident Luxury Lines
    IME_T2_R05_Companies[5] = 17  ; Stroud Eklund
    IME_T2_R05_Companies[6] = 18  ; Deimos Staryards
    IME_T2_R05_Companies[7] = 19  ; Hopetech
    IME_T2_R05_Companies[8] = 20  ; Nova Galactic
    IME_T2_R05_Companies[9] = 21  ; Slayton Aerospace
    IME_T2_R05_Companies[10] = 22  ; Amun Dunn
    IME_T2_R05_Companies[11] = 23  ; Panoptes
    IME_T2_R05_Companies[12] = 24  ; Reladyne
    IME_T2_R05_Companies[13] = 25  ; Dogstar
    IME_T2_R05_Companies[14] = 26  ; Sextant Shield Systems
    IME_T2_R05_Companies[15] = 27  ; Nautilus
    IME_T2_R05_Companies[16] = 28  ; Protectorate Systems
    IME_T2_R05_Companies[17] = 29  ; Vanguard
    IME_T2_R05_Companies[18] = 30  ; Deep Core
    IME_T2_R05_Companies[19] = 31  ; Xiang
    IME_T2_R05_Companies[20] = 32  ; Ballistics Solutions
    IME_T2_R05_Companies[21] = 33  ; Light Scythe
    IME_T2_R05_Companies[22] = 34  ; Shinigami
    IME_T2_R05_Companies[23] = 35  ; Horizon Defence

    IME_T2_R06_Companies = new Int[2]  ; Carboxylic Acids
    IME_T2_R06_Companies[0] = 11  ; Reliant Medical
    IME_T2_R06_Companies[1] = 39  ; Ryujin

    IME_T2_R07_Companies = new Int[21]  ; Comm Relay
    IME_T2_R07_Companies[0] = 15  ; Taiyo Astroneering
    IME_T2_R07_Companies[1] = 16  ; Trident Luxury Lines
    IME_T2_R07_Companies[2] = 17  ; Stroud Eklund
    IME_T2_R07_Companies[3] = 18  ; Deimos Staryards
    IME_T2_R07_Companies[4] = 19  ; Hopetech
    IME_T2_R07_Companies[5] = 20  ; Nova Galactic
    IME_T2_R07_Companies[6] = 21  ; Slayton Aerospace
    IME_T2_R07_Companies[7] = 22  ; Amun Dunn
    IME_T2_R07_Companies[8] = 23  ; Panoptes
    IME_T2_R07_Companies[9] = 24  ; Reladyne
    IME_T2_R07_Companies[10] = 25  ; Dogstar
    IME_T2_R07_Companies[11] = 26  ; Sextant Shield Systems
    IME_T2_R07_Companies[12] = 27  ; Nautilus
    IME_T2_R07_Companies[13] = 28  ; Protectorate Systems
    IME_T2_R07_Companies[14] = 29  ; Vanguard
    IME_T2_R07_Companies[15] = 30  ; Deep Core
    IME_T2_R07_Companies[16] = 31  ; Xiang
    IME_T2_R07_Companies[17] = 32  ; Ballistics Solutions
    IME_T2_R07_Companies[18] = 33  ; Light Scythe
    IME_T2_R07_Companies[19] = 34  ; Shinigami
    IME_T2_R07_Companies[20] = 35  ; Horizon Defence

    IME_T2_R08_Companies = new Int[4]  ; Gold
    IME_T2_R08_Companies[0] =  3  ; Galbank
    IME_T2_R08_Companies[1] =  9  ; Arc Might
    IME_T2_R08_Companies[2] = 10  ; Celtcorp
    IME_T2_R08_Companies[3] = 39  ; Ryujin

    IME_T2_R09_Companies = new Int[2]  ; Hallucinogen
    IME_T2_R09_Companies[0] = 11  ; Reliant Medical
    IME_T2_R09_Companies[1] = 39  ; Ryujin

    IME_T2_R10_Companies = new Int[24]  ; Isocentered Magnet
    IME_T2_R10_Companies[0] = 15  ; Taiyo Astroneering
    IME_T2_R10_Companies[1] = 16  ; Trident Luxury Lines
    IME_T2_R10_Companies[2] = 17  ; Stroud Eklund
    IME_T2_R10_Companies[3] = 18  ; Deimos Staryards
    IME_T2_R10_Companies[4] = 19  ; Hopetech
    IME_T2_R10_Companies[5] = 20  ; Nova Galactic
    IME_T2_R10_Companies[6] = 21  ; Slayton Aerospace
    IME_T2_R10_Companies[7] = 22  ; Amun Dunn
    IME_T2_R10_Companies[8] = 23  ; Panoptes
    IME_T2_R10_Companies[9] = 24  ; Reladyne
    IME_T2_R10_Companies[10] = 25  ; Dogstar
    IME_T2_R10_Companies[11] = 26  ; Sextant Shield Systems
    IME_T2_R10_Companies[12] = 27  ; Nautilus
    IME_T2_R10_Companies[13] = 28  ; Protectorate Systems
    IME_T2_R10_Companies[14] = 29  ; Vanguard
    IME_T2_R10_Companies[15] = 30  ; Deep Core
    IME_T2_R10_Companies[16] = 31  ; Xiang
    IME_T2_R10_Companies[17] = 32  ; Ballistics Solutions
    IME_T2_R10_Companies[18] = 33  ; Light Scythe
    IME_T2_R10_Companies[19] = 34  ; Shinigami
    IME_T2_R10_Companies[20] = 35  ; Horizon Defence
    IME_T2_R10_Companies[21] = 40  ; Kore Kinetics
    IME_T2_R10_Companies[22] = 41  ; Laredo
    IME_T2_R10_Companies[23] = 42  ; Aboron

    IME_T2_R11_Companies = new Int[25]  ; Isotopic Coolant
    IME_T2_R11_Companies[0] =  2  ; Generdyne Industries
    IME_T2_R11_Companies[1] = 12  ; Argos Extractors
    IME_T2_R11_Companies[2] = 13  ; Consolidated Mining
    IME_T2_R11_Companies[3] = 14  ; Six Sisters
    IME_T2_R11_Companies[4] = 15  ; Taiyo Astroneering
    IME_T2_R11_Companies[5] = 16  ; Trident Luxury Lines
    IME_T2_R11_Companies[6] = 17  ; Stroud Eklund
    IME_T2_R11_Companies[7] = 18  ; Deimos Staryards
    IME_T2_R11_Companies[8] = 19  ; Hopetech
    IME_T2_R11_Companies[9] = 20  ; Nova Galactic
    IME_T2_R11_Companies[10] = 21  ; Slayton Aerospace
    IME_T2_R11_Companies[11] = 22  ; Amun Dunn
    IME_T2_R11_Companies[12] = 23  ; Panoptes
    IME_T2_R11_Companies[13] = 24  ; Reladyne
    IME_T2_R11_Companies[14] = 25  ; Dogstar
    IME_T2_R11_Companies[15] = 26  ; Sextant Shield Systems
    IME_T2_R11_Companies[16] = 27  ; Nautilus
    IME_T2_R11_Companies[17] = 28  ; Protectorate Systems
    IME_T2_R11_Companies[18] = 29  ; Vanguard
    IME_T2_R11_Companies[19] = 30  ; Deep Core
    IME_T2_R11_Companies[20] = 31  ; Xiang
    IME_T2_R11_Companies[21] = 32  ; Ballistics Solutions
    IME_T2_R11_Companies[22] = 33  ; Light Scythe
    IME_T2_R11_Companies[23] = 34  ; Shinigami
    IME_T2_R11_Companies[24] = 35  ; Horizon Defence

    IME_T2_R12_Companies = new Int[25]  ; Lithium
    IME_T2_R12_Companies[0] =  9  ; Arc Might
    IME_T2_R12_Companies[1] = 10  ; Celtcorp
    IME_T2_R12_Companies[2] = 11  ; Reliant Medical
    IME_T2_R12_Companies[3] = 15  ; Taiyo Astroneering
    IME_T2_R12_Companies[4] = 16  ; Trident Luxury Lines
    IME_T2_R12_Companies[5] = 17  ; Stroud Eklund
    IME_T2_R12_Companies[6] = 18  ; Deimos Staryards
    IME_T2_R12_Companies[7] = 19  ; Hopetech
    IME_T2_R12_Companies[8] = 20  ; Nova Galactic
    IME_T2_R12_Companies[9] = 21  ; Slayton Aerospace
    IME_T2_R12_Companies[10] = 22  ; Amun Dunn
    IME_T2_R12_Companies[11] = 23  ; Panoptes
    IME_T2_R12_Companies[12] = 24  ; Reladyne
    IME_T2_R12_Companies[13] = 25  ; Dogstar
    IME_T2_R12_Companies[14] = 26  ; Sextant Shield Systems
    IME_T2_R12_Companies[15] = 27  ; Nautilus
    IME_T2_R12_Companies[16] = 28  ; Protectorate Systems
    IME_T2_R12_Companies[17] = 29  ; Vanguard
    IME_T2_R12_Companies[18] = 30  ; Deep Core
    IME_T2_R12_Companies[19] = 31  ; Xiang
    IME_T2_R12_Companies[20] = 32  ; Ballistics Solutions
    IME_T2_R12_Companies[21] = 33  ; Light Scythe
    IME_T2_R12_Companies[22] = 34  ; Shinigami
    IME_T2_R12_Companies[23] = 35  ; Horizon Defence
    IME_T2_R12_Companies[24] = 39  ; Ryujin

    IME_T2_R13_Companies = new Int[10]  ; Mag Pressure Tank
    IME_T2_R13_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T2_R13_Companies[1] =  5  ; Filburn Agriculture
    IME_T2_R13_Companies[2] =  6  ; Chunks
    IME_T2_R13_Companies[3] =  7  ; Centauri Mills
    IME_T2_R13_Companies[4] =  8  ; Chandra Vineyards
    IME_T2_R13_Companies[5] = 10  ; Celtcorp
    IME_T2_R13_Companies[6] = 36  ; Son
    IME_T2_R13_Companies[7] = 37  ; Lunar Robotics
    IME_T2_R13_Companies[8] = 38  ; Infinity Ltd
    IME_T2_R13_Companies[9] = 39  ; Ryujin

    IME_T2_R14_Companies = new Int[2]  ; Mercury
    IME_T2_R14_Companies[0] = 11  ; Reliant Medical
    IME_T2_R14_Companies[1] = 39  ; Ryujin

    IME_T2_R15_Companies = new Int[21]  ; Monopropellant
    IME_T2_R15_Companies[0] = 15  ; Taiyo Astroneering
    IME_T2_R15_Companies[1] = 16  ; Trident Luxury Lines
    IME_T2_R15_Companies[2] = 17  ; Stroud Eklund
    IME_T2_R15_Companies[3] = 18  ; Deimos Staryards
    IME_T2_R15_Companies[4] = 19  ; Hopetech
    IME_T2_R15_Companies[5] = 20  ; Nova Galactic
    IME_T2_R15_Companies[6] = 21  ; Slayton Aerospace
    IME_T2_R15_Companies[7] = 22  ; Amun Dunn
    IME_T2_R15_Companies[8] = 23  ; Panoptes
    IME_T2_R15_Companies[9] = 24  ; Reladyne
    IME_T2_R15_Companies[10] = 25  ; Dogstar
    IME_T2_R15_Companies[11] = 26  ; Sextant Shield Systems
    IME_T2_R15_Companies[12] = 27  ; Nautilus
    IME_T2_R15_Companies[13] = 28  ; Protectorate Systems
    IME_T2_R15_Companies[14] = 29  ; Vanguard
    IME_T2_R15_Companies[15] = 30  ; Deep Core
    IME_T2_R15_Companies[16] = 31  ; Xiang
    IME_T2_R15_Companies[17] = 32  ; Ballistics Solutions
    IME_T2_R15_Companies[18] = 33  ; Light Scythe
    IME_T2_R15_Companies[19] = 34  ; Shinigami
    IME_T2_R15_Companies[20] = 35  ; Horizon Defence

    IME_T2_R16_Companies = new Int[24]  ; Neodymium
    IME_T2_R16_Companies[0] =  9  ; Arc Might
    IME_T2_R16_Companies[1] = 10  ; Celtcorp
    IME_T2_R16_Companies[2] = 15  ; Taiyo Astroneering
    IME_T2_R16_Companies[3] = 16  ; Trident Luxury Lines
    IME_T2_R16_Companies[4] = 17  ; Stroud Eklund
    IME_T2_R16_Companies[5] = 18  ; Deimos Staryards
    IME_T2_R16_Companies[6] = 19  ; Hopetech
    IME_T2_R16_Companies[7] = 20  ; Nova Galactic
    IME_T2_R16_Companies[8] = 21  ; Slayton Aerospace
    IME_T2_R16_Companies[9] = 22  ; Amun Dunn
    IME_T2_R16_Companies[10] = 23  ; Panoptes
    IME_T2_R16_Companies[11] = 24  ; Reladyne
    IME_T2_R16_Companies[12] = 25  ; Dogstar
    IME_T2_R16_Companies[13] = 26  ; Sextant Shield Systems
    IME_T2_R16_Companies[14] = 27  ; Nautilus
    IME_T2_R16_Companies[15] = 28  ; Protectorate Systems
    IME_T2_R16_Companies[16] = 29  ; Vanguard
    IME_T2_R16_Companies[17] = 30  ; Deep Core
    IME_T2_R16_Companies[18] = 31  ; Xiang
    IME_T2_R16_Companies[19] = 32  ; Ballistics Solutions
    IME_T2_R16_Companies[20] = 33  ; Light Scythe
    IME_T2_R16_Companies[21] = 34  ; Shinigami
    IME_T2_R16_Companies[22] = 35  ; Horizon Defence
    IME_T2_R16_Companies[23] = 39  ; Ryujin

    IME_T2_R17_Companies = new Int[6]  ; Platinum
    IME_T2_R17_Companies[0] =  3  ; Galbank
    IME_T2_R17_Companies[1] = 10  ; Celtcorp
    IME_T2_R17_Companies[2] = 36  ; Son
    IME_T2_R17_Companies[3] = 37  ; Lunar Robotics
    IME_T2_R17_Companies[4] = 38  ; Infinity Ltd
    IME_T2_R17_Companies[5] = 39  ; Ryujin

    IME_T2_R18_Companies = new Int[4]  ; Polytextile
    IME_T2_R18_Companies[0] =  0  ; Eit Clothiers
    IME_T2_R18_Companies[1] =  9  ; Arc Might
    IME_T2_R18_Companies[2] = 10  ; Celtcorp
    IME_T2_R18_Companies[3] = 39  ; Ryujin

    IME_T2_R19_Companies = new Int[3]  ; Reactive Gauge
    IME_T2_R19_Companies[0] =  9  ; Arc Might
    IME_T2_R19_Companies[1] = 10  ; Celtcorp
    IME_T2_R19_Companies[2] = 39  ; Ryujin

    IME_T2_R20_Companies = new Int[7]  ; Sedative
    IME_T2_R20_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T2_R20_Companies[1] =  5  ; Filburn Agriculture
    IME_T2_R20_Companies[2] =  6  ; Chunks
    IME_T2_R20_Companies[3] =  7  ; Centauri Mills
    IME_T2_R20_Companies[4] =  8  ; Chandra Vineyards
    IME_T2_R20_Companies[5] = 11  ; Reliant Medical
    IME_T2_R20_Companies[6] = 39  ; Ryujin

    IME_T2_R21_Companies = new Int[24]  ; Tantalum
    IME_T2_R21_Companies[0] = 12  ; Argos Extractors
    IME_T2_R21_Companies[1] = 13  ; Consolidated Mining
    IME_T2_R21_Companies[2] = 14  ; Six Sisters
    IME_T2_R21_Companies[3] = 15  ; Taiyo Astroneering
    IME_T2_R21_Companies[4] = 16  ; Trident Luxury Lines
    IME_T2_R21_Companies[5] = 17  ; Stroud Eklund
    IME_T2_R21_Companies[6] = 18  ; Deimos Staryards
    IME_T2_R21_Companies[7] = 19  ; Hopetech
    IME_T2_R21_Companies[8] = 20  ; Nova Galactic
    IME_T2_R21_Companies[9] = 21  ; Slayton Aerospace
    IME_T2_R21_Companies[10] = 22  ; Amun Dunn
    IME_T2_R21_Companies[11] = 23  ; Panoptes
    IME_T2_R21_Companies[12] = 24  ; Reladyne
    IME_T2_R21_Companies[13] = 25  ; Dogstar
    IME_T2_R21_Companies[14] = 26  ; Sextant Shield Systems
    IME_T2_R21_Companies[15] = 27  ; Nautilus
    IME_T2_R21_Companies[16] = 28  ; Protectorate Systems
    IME_T2_R21_Companies[17] = 29  ; Vanguard
    IME_T2_R21_Companies[18] = 30  ; Deep Core
    IME_T2_R21_Companies[19] = 31  ; Xiang
    IME_T2_R21_Companies[20] = 32  ; Ballistics Solutions
    IME_T2_R21_Companies[21] = 33  ; Light Scythe
    IME_T2_R21_Companies[22] = 34  ; Shinigami
    IME_T2_R21_Companies[23] = 35  ; Horizon Defence

    IME_T2_R22_Companies = new Int[22]  ; Tau Grade Rheostat
    IME_T2_R22_Companies[0] =  2  ; Generdyne Industries
    IME_T2_R22_Companies[1] = 15  ; Taiyo Astroneering
    IME_T2_R22_Companies[2] = 16  ; Trident Luxury Lines
    IME_T2_R22_Companies[3] = 17  ; Stroud Eklund
    IME_T2_R22_Companies[4] = 18  ; Deimos Staryards
    IME_T2_R22_Companies[5] = 19  ; Hopetech
    IME_T2_R22_Companies[6] = 20  ; Nova Galactic
    IME_T2_R22_Companies[7] = 21  ; Slayton Aerospace
    IME_T2_R22_Companies[8] = 22  ; Amun Dunn
    IME_T2_R22_Companies[9] = 23  ; Panoptes
    IME_T2_R22_Companies[10] = 24  ; Reladyne
    IME_T2_R22_Companies[11] = 25  ; Dogstar
    IME_T2_R22_Companies[12] = 26  ; Sextant Shield Systems
    IME_T2_R22_Companies[13] = 27  ; Nautilus
    IME_T2_R22_Companies[14] = 28  ; Protectorate Systems
    IME_T2_R22_Companies[15] = 29  ; Vanguard
    IME_T2_R22_Companies[16] = 30  ; Deep Core
    IME_T2_R22_Companies[17] = 31  ; Xiang
    IME_T2_R22_Companies[18] = 32  ; Ballistics Solutions
    IME_T2_R22_Companies[19] = 33  ; Light Scythe
    IME_T2_R22_Companies[20] = 34  ; Shinigami
    IME_T2_R22_Companies[21] = 35  ; Horizon Defence

    IME_T2_R23_Companies = new Int[2]  ; Tetrafluorides
    IME_T2_R23_Companies[0] = 11  ; Reliant Medical
    IME_T2_R23_Companies[1] = 39  ; Ryujin

    IME_T2_R24_Companies = new Int[30]  ; Titanium
    IME_T2_R24_Companies[0] =  9  ; Arc Might
    IME_T2_R24_Companies[1] = 10  ; Celtcorp
    IME_T2_R24_Companies[2] = 12  ; Argos Extractors
    IME_T2_R24_Companies[3] = 13  ; Consolidated Mining
    IME_T2_R24_Companies[4] = 14  ; Six Sisters
    IME_T2_R24_Companies[5] = 15  ; Taiyo Astroneering
    IME_T2_R24_Companies[6] = 16  ; Trident Luxury Lines
    IME_T2_R24_Companies[7] = 17  ; Stroud Eklund
    IME_T2_R24_Companies[8] = 18  ; Deimos Staryards
    IME_T2_R24_Companies[9] = 19  ; Hopetech
    IME_T2_R24_Companies[10] = 20  ; Nova Galactic
    IME_T2_R24_Companies[11] = 21  ; Slayton Aerospace
    IME_T2_R24_Companies[12] = 22  ; Amun Dunn
    IME_T2_R24_Companies[13] = 23  ; Panoptes
    IME_T2_R24_Companies[14] = 24  ; Reladyne
    IME_T2_R24_Companies[15] = 25  ; Dogstar
    IME_T2_R24_Companies[16] = 26  ; Sextant Shield Systems
    IME_T2_R24_Companies[17] = 27  ; Nautilus
    IME_T2_R24_Companies[18] = 28  ; Protectorate Systems
    IME_T2_R24_Companies[19] = 29  ; Vanguard
    IME_T2_R24_Companies[20] = 30  ; Deep Core
    IME_T2_R24_Companies[21] = 31  ; Xiang
    IME_T2_R24_Companies[22] = 32  ; Ballistics Solutions
    IME_T2_R24_Companies[23] = 33  ; Light Scythe
    IME_T2_R24_Companies[24] = 34  ; Shinigami
    IME_T2_R24_Companies[25] = 35  ; Horizon Defence
    IME_T2_R24_Companies[26] = 39  ; Ryujin
    IME_T2_R24_Companies[27] = 40  ; Kore Kinetics
    IME_T2_R24_Companies[28] = 41  ; Laredo
    IME_T2_R24_Companies[29] = 42  ; Aboron

    IME_T2_R25_Companies = new Int[6]  ; Vanadium
    IME_T2_R25_Companies[0] = 12  ; Argos Extractors
    IME_T2_R25_Companies[1] = 13  ; Consolidated Mining
    IME_T2_R25_Companies[2] = 14  ; Six Sisters
    IME_T2_R25_Companies[3] = 40  ; Kore Kinetics
    IME_T2_R25_Companies[4] = 41  ; Laredo
    IME_T2_R25_Companies[5] = 42  ; Aboron

    IME_T2_R26_Companies = new Int[28]  ; Zero Wire
    IME_T2_R26_Companies[0] =  2  ; Generdyne Industries
    IME_T2_R26_Companies[1] =  9  ; Arc Might
    IME_T2_R26_Companies[2] = 10  ; Celtcorp
    IME_T2_R26_Companies[3] = 15  ; Taiyo Astroneering
    IME_T2_R26_Companies[4] = 16  ; Trident Luxury Lines
    IME_T2_R26_Companies[5] = 17  ; Stroud Eklund
    IME_T2_R26_Companies[6] = 18  ; Deimos Staryards
    IME_T2_R26_Companies[7] = 19  ; Hopetech
    IME_T2_R26_Companies[8] = 20  ; Nova Galactic
    IME_T2_R26_Companies[9] = 21  ; Slayton Aerospace
    IME_T2_R26_Companies[10] = 22  ; Amun Dunn
    IME_T2_R26_Companies[11] = 23  ; Panoptes
    IME_T2_R26_Companies[12] = 24  ; Reladyne
    IME_T2_R26_Companies[13] = 25  ; Dogstar
    IME_T2_R26_Companies[14] = 26  ; Sextant Shield Systems
    IME_T2_R26_Companies[15] = 27  ; Nautilus
    IME_T2_R26_Companies[16] = 28  ; Protectorate Systems
    IME_T2_R26_Companies[17] = 29  ; Vanguard
    IME_T2_R26_Companies[18] = 30  ; Deep Core
    IME_T2_R26_Companies[19] = 31  ; Xiang
    IME_T2_R26_Companies[20] = 32  ; Ballistics Solutions
    IME_T2_R26_Companies[21] = 33  ; Light Scythe
    IME_T2_R26_Companies[22] = 34  ; Shinigami
    IME_T2_R26_Companies[23] = 35  ; Horizon Defence
    IME_T2_R26_Companies[24] = 39  ; Ryujin
    IME_T2_R26_Companies[25] = 40  ; Kore Kinetics
    IME_T2_R26_Companies[26] = 41  ; Laredo
    IME_T2_R26_Companies[27] = 42  ; Aboron

    ; Tier 3
    IME_T3_R00_Companies = new Int[21]  ; Antimony
    IME_T3_R00_Companies[0] = 15  ; Taiyo Astroneering
    IME_T3_R00_Companies[1] = 16  ; Trident Luxury Lines
    IME_T3_R00_Companies[2] = 17  ; Stroud Eklund
    IME_T3_R00_Companies[3] = 18  ; Deimos Staryards
    IME_T3_R00_Companies[4] = 19  ; Hopetech
    IME_T3_R00_Companies[5] = 20  ; Nova Galactic
    IME_T3_R00_Companies[6] = 21  ; Slayton Aerospace
    IME_T3_R00_Companies[7] = 22  ; Amun Dunn
    IME_T3_R00_Companies[8] = 23  ; Panoptes
    IME_T3_R00_Companies[9] = 24  ; Reladyne
    IME_T3_R00_Companies[10] = 25  ; Dogstar
    IME_T3_R00_Companies[11] = 26  ; Sextant Shield Systems
    IME_T3_R00_Companies[12] = 27  ; Nautilus
    IME_T3_R00_Companies[13] = 28  ; Protectorate Systems
    IME_T3_R00_Companies[14] = 29  ; Vanguard
    IME_T3_R00_Companies[15] = 30  ; Deep Core
    IME_T3_R00_Companies[16] = 31  ; Xiang
    IME_T3_R00_Companies[17] = 32  ; Ballistics Solutions
    IME_T3_R00_Companies[18] = 33  ; Light Scythe
    IME_T3_R00_Companies[19] = 34  ; Shinigami
    IME_T3_R00_Companies[20] = 35  ; Horizon Defence

    IME_T3_R01_Companies = new Int[2]  ; Biosuppressant
    IME_T3_R01_Companies[0] = 11  ; Reliant Medical
    IME_T3_R01_Companies[1] = 39  ; Ryujin

    IME_T3_R02_Companies = new Int[25]  ; Caesium
    IME_T3_R02_Companies[0] =  2  ; Generdyne Industries
    IME_T3_R02_Companies[1] = 12  ; Argos Extractors
    IME_T3_R02_Companies[2] = 13  ; Consolidated Mining
    IME_T3_R02_Companies[3] = 14  ; Six Sisters
    IME_T3_R02_Companies[4] = 15  ; Taiyo Astroneering
    IME_T3_R02_Companies[5] = 16  ; Trident Luxury Lines
    IME_T3_R02_Companies[6] = 17  ; Stroud Eklund
    IME_T3_R02_Companies[7] = 18  ; Deimos Staryards
    IME_T3_R02_Companies[8] = 19  ; Hopetech
    IME_T3_R02_Companies[9] = 20  ; Nova Galactic
    IME_T3_R02_Companies[10] = 21  ; Slayton Aerospace
    IME_T3_R02_Companies[11] = 22  ; Amun Dunn
    IME_T3_R02_Companies[12] = 23  ; Panoptes
    IME_T3_R02_Companies[13] = 24  ; Reladyne
    IME_T3_R02_Companies[14] = 25  ; Dogstar
    IME_T3_R02_Companies[15] = 26  ; Sextant Shield Systems
    IME_T3_R02_Companies[16] = 27  ; Nautilus
    IME_T3_R02_Companies[17] = 28  ; Protectorate Systems
    IME_T3_R02_Companies[18] = 29  ; Vanguard
    IME_T3_R02_Companies[19] = 30  ; Deep Core
    IME_T3_R02_Companies[20] = 31  ; Xiang
    IME_T3_R02_Companies[21] = 32  ; Ballistics Solutions
    IME_T3_R02_Companies[22] = 33  ; Light Scythe
    IME_T3_R02_Companies[23] = 34  ; Shinigami
    IME_T3_R02_Companies[24] = 35  ; Horizon Defence

    IME_T3_R03_Companies = new Int[3]  ; Drilling Rig
    IME_T3_R03_Companies[0] = 12  ; Argos Extractors
    IME_T3_R03_Companies[1] = 13  ; Consolidated Mining
    IME_T3_R03_Companies[2] = 14  ; Six Sisters

    IME_T3_R04_Companies = new Int[4]  ; Dysprosium
    IME_T3_R04_Companies[0] =  2  ; Generdyne Industries
    IME_T3_R04_Companies[1] =  9  ; Arc Might
    IME_T3_R04_Companies[2] = 10  ; Celtcorp
    IME_T3_R04_Companies[3] = 39  ; Ryujin

    IME_T3_R05_Companies = new Int[21]  ; Europium
    IME_T3_R05_Companies[0] = 15  ; Taiyo Astroneering
    IME_T3_R05_Companies[1] = 16  ; Trident Luxury Lines
    IME_T3_R05_Companies[2] = 17  ; Stroud Eklund
    IME_T3_R05_Companies[3] = 18  ; Deimos Staryards
    IME_T3_R05_Companies[4] = 19  ; Hopetech
    IME_T3_R05_Companies[5] = 20  ; Nova Galactic
    IME_T3_R05_Companies[6] = 21  ; Slayton Aerospace
    IME_T3_R05_Companies[7] = 22  ; Amun Dunn
    IME_T3_R05_Companies[8] = 23  ; Panoptes
    IME_T3_R05_Companies[9] = 24  ; Reladyne
    IME_T3_R05_Companies[10] = 25  ; Dogstar
    IME_T3_R05_Companies[11] = 26  ; Sextant Shield Systems
    IME_T3_R05_Companies[12] = 27  ; Nautilus
    IME_T3_R05_Companies[13] = 28  ; Protectorate Systems
    IME_T3_R05_Companies[14] = 29  ; Vanguard
    IME_T3_R05_Companies[15] = 30  ; Deep Core
    IME_T3_R05_Companies[16] = 31  ; Xiang
    IME_T3_R05_Companies[17] = 32  ; Ballistics Solutions
    IME_T3_R05_Companies[18] = 33  ; Light Scythe
    IME_T3_R05_Companies[19] = 34  ; Shinigami
    IME_T3_R05_Companies[20] = 35  ; Horizon Defence

    IME_T3_R06_Companies = new Int[2]  ; Hypercatalyst
    IME_T3_R06_Companies[0] = 11  ; Reliant Medical
    IME_T3_R06_Companies[1] = 39  ; Ryujin

    IME_T3_R07_Companies = new Int[27]  ; Ionic Liquids
    IME_T3_R07_Companies[0] = 10  ; Celtcorp
    IME_T3_R07_Companies[1] = 11  ; Reliant Medical
    IME_T3_R07_Companies[2] = 15  ; Taiyo Astroneering
    IME_T3_R07_Companies[3] = 16  ; Trident Luxury Lines
    IME_T3_R07_Companies[4] = 17  ; Stroud Eklund
    IME_T3_R07_Companies[5] = 18  ; Deimos Staryards
    IME_T3_R07_Companies[6] = 19  ; Hopetech
    IME_T3_R07_Companies[7] = 20  ; Nova Galactic
    IME_T3_R07_Companies[8] = 21  ; Slayton Aerospace
    IME_T3_R07_Companies[9] = 22  ; Amun Dunn
    IME_T3_R07_Companies[10] = 23  ; Panoptes
    IME_T3_R07_Companies[11] = 24  ; Reladyne
    IME_T3_R07_Companies[12] = 25  ; Dogstar
    IME_T3_R07_Companies[13] = 26  ; Sextant Shield Systems
    IME_T3_R07_Companies[14] = 27  ; Nautilus
    IME_T3_R07_Companies[15] = 28  ; Protectorate Systems
    IME_T3_R07_Companies[16] = 29  ; Vanguard
    IME_T3_R07_Companies[17] = 30  ; Deep Core
    IME_T3_R07_Companies[18] = 31  ; Xiang
    IME_T3_R07_Companies[19] = 32  ; Ballistics Solutions
    IME_T3_R07_Companies[20] = 33  ; Light Scythe
    IME_T3_R07_Companies[21] = 34  ; Shinigami
    IME_T3_R07_Companies[22] = 35  ; Horizon Defence
    IME_T3_R07_Companies[23] = 36  ; Son
    IME_T3_R07_Companies[24] = 37  ; Lunar Robotics
    IME_T3_R07_Companies[25] = 38  ; Infinity Ltd
    IME_T3_R07_Companies[26] = 39  ; Ryujin

    IME_T3_R08_Companies = new Int[6]  ; Lubricant
    IME_T3_R08_Companies[0] =  9  ; Arc Might
    IME_T3_R08_Companies[1] = 10  ; Celtcorp
    IME_T3_R08_Companies[2] = 39  ; Ryujin
    IME_T3_R08_Companies[3] = 40  ; Kore Kinetics
    IME_T3_R08_Companies[4] = 41  ; Laredo
    IME_T3_R08_Companies[5] = 42  ; Aboron

    IME_T3_R09_Companies = new Int[12]  ; Molecular Sieve
    IME_T3_R09_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T3_R09_Companies[1] =  5  ; Filburn Agriculture
    IME_T3_R09_Companies[2] =  6  ; Chunks
    IME_T3_R09_Companies[3] =  7  ; Centauri Mills
    IME_T3_R09_Companies[4] =  8  ; Chandra Vineyards
    IME_T3_R09_Companies[5] =  9  ; Arc Might
    IME_T3_R09_Companies[6] = 10  ; Celtcorp
    IME_T3_R09_Companies[7] = 11  ; Reliant Medical
    IME_T3_R09_Companies[8] = 36  ; Son
    IME_T3_R09_Companies[9] = 37  ; Lunar Robotics
    IME_T3_R09_Companies[10] = 38  ; Infinity Ltd
    IME_T3_R09_Companies[11] = 39  ; Ryujin

    IME_T3_R10_Companies = new Int[3]  ; Neon
    IME_T3_R10_Companies[0] = 40  ; Kore Kinetics
    IME_T3_R10_Companies[1] = 41  ; Laredo
    IME_T3_R10_Companies[2] = 42  ; Aboron

    IME_T3_R11_Companies = new Int[21]  ; Palladium
    IME_T3_R11_Companies[0] = 15  ; Taiyo Astroneering
    IME_T3_R11_Companies[1] = 16  ; Trident Luxury Lines
    IME_T3_R11_Companies[2] = 17  ; Stroud Eklund
    IME_T3_R11_Companies[3] = 18  ; Deimos Staryards
    IME_T3_R11_Companies[4] = 19  ; Hopetech
    IME_T3_R11_Companies[5] = 20  ; Nova Galactic
    IME_T3_R11_Companies[6] = 21  ; Slayton Aerospace
    IME_T3_R11_Companies[7] = 22  ; Amun Dunn
    IME_T3_R11_Companies[8] = 23  ; Panoptes
    IME_T3_R11_Companies[9] = 24  ; Reladyne
    IME_T3_R11_Companies[10] = 25  ; Dogstar
    IME_T3_R11_Companies[11] = 26  ; Sextant Shield Systems
    IME_T3_R11_Companies[12] = 27  ; Nautilus
    IME_T3_R11_Companies[13] = 28  ; Protectorate Systems
    IME_T3_R11_Companies[14] = 29  ; Vanguard
    IME_T3_R11_Companies[15] = 30  ; Deep Core
    IME_T3_R11_Companies[16] = 31  ; Xiang
    IME_T3_R11_Companies[17] = 32  ; Ballistics Solutions
    IME_T3_R11_Companies[18] = 33  ; Light Scythe
    IME_T3_R11_Companies[19] = 34  ; Shinigami
    IME_T3_R11_Companies[20] = 35  ; Horizon Defence

    IME_T3_R12_Companies = new Int[22]  ; Paramagnon Conductor
    IME_T3_R12_Companies[0] =  2  ; Generdyne Industries
    IME_T3_R12_Companies[1] = 15  ; Taiyo Astroneering
    IME_T3_R12_Companies[2] = 16  ; Trident Luxury Lines
    IME_T3_R12_Companies[3] = 17  ; Stroud Eklund
    IME_T3_R12_Companies[4] = 18  ; Deimos Staryards
    IME_T3_R12_Companies[5] = 19  ; Hopetech
    IME_T3_R12_Companies[6] = 20  ; Nova Galactic
    IME_T3_R12_Companies[7] = 21  ; Slayton Aerospace
    IME_T3_R12_Companies[8] = 22  ; Amun Dunn
    IME_T3_R12_Companies[9] = 23  ; Panoptes
    IME_T3_R12_Companies[10] = 24  ; Reladyne
    IME_T3_R12_Companies[11] = 25  ; Dogstar
    IME_T3_R12_Companies[12] = 26  ; Sextant Shield Systems
    IME_T3_R12_Companies[13] = 27  ; Nautilus
    IME_T3_R12_Companies[14] = 28  ; Protectorate Systems
    IME_T3_R12_Companies[15] = 29  ; Vanguard
    IME_T3_R12_Companies[16] = 30  ; Deep Core
    IME_T3_R12_Companies[17] = 31  ; Xiang
    IME_T3_R12_Companies[18] = 32  ; Ballistics Solutions
    IME_T3_R12_Companies[19] = 33  ; Light Scythe
    IME_T3_R12_Companies[20] = 34  ; Shinigami
    IME_T3_R12_Companies[21] = 35  ; Horizon Defence

    IME_T3_R13_Companies = new Int[6]  ; Plutonium
    IME_T3_R13_Companies[0] =  2  ; Generdyne Industries
    IME_T3_R13_Companies[1] = 10  ; Celtcorp
    IME_T3_R13_Companies[2] = 36  ; Son
    IME_T3_R13_Companies[3] = 37  ; Lunar Robotics
    IME_T3_R13_Companies[4] = 38  ; Infinity Ltd
    IME_T3_R13_Companies[5] = 39  ; Ryujin

    IME_T3_R14_Companies = new Int[7]  ; Polymer
    IME_T3_R14_Companies[0] =  0  ; Eit Clothiers
    IME_T3_R14_Companies[1] =  9  ; Arc Might
    IME_T3_R14_Companies[2] = 10  ; Celtcorp
    IME_T3_R14_Companies[3] = 39  ; Ryujin
    IME_T3_R14_Companies[4] = 40  ; Kore Kinetics
    IME_T3_R14_Companies[5] = 41  ; Laredo
    IME_T3_R14_Companies[6] = 42  ; Aboron

    IME_T3_R15_Companies = new Int[21]  ; Positron Battery
    IME_T3_R15_Companies[0] = 15  ; Taiyo Astroneering
    IME_T3_R15_Companies[1] = 16  ; Trident Luxury Lines
    IME_T3_R15_Companies[2] = 17  ; Stroud Eklund
    IME_T3_R15_Companies[3] = 18  ; Deimos Staryards
    IME_T3_R15_Companies[4] = 19  ; Hopetech
    IME_T3_R15_Companies[5] = 20  ; Nova Galactic
    IME_T3_R15_Companies[6] = 21  ; Slayton Aerospace
    IME_T3_R15_Companies[7] = 22  ; Amun Dunn
    IME_T3_R15_Companies[8] = 23  ; Panoptes
    IME_T3_R15_Companies[9] = 24  ; Reladyne
    IME_T3_R15_Companies[10] = 25  ; Dogstar
    IME_T3_R15_Companies[11] = 26  ; Sextant Shield Systems
    IME_T3_R15_Companies[12] = 27  ; Nautilus
    IME_T3_R15_Companies[13] = 28  ; Protectorate Systems
    IME_T3_R15_Companies[14] = 29  ; Vanguard
    IME_T3_R15_Companies[15] = 30  ; Deep Core
    IME_T3_R15_Companies[16] = 31  ; Xiang
    IME_T3_R15_Companies[17] = 32  ; Ballistics Solutions
    IME_T3_R15_Companies[18] = 33  ; Light Scythe
    IME_T3_R15_Companies[19] = 34  ; Shinigami
    IME_T3_R15_Companies[20] = 35  ; Horizon Defence

    IME_T3_R16_Companies = new Int[6]  ; Semimetal Wafer
    IME_T3_R16_Companies[0] =  9  ; Arc Might
    IME_T3_R16_Companies[1] = 10  ; Celtcorp
    IME_T3_R16_Companies[2] = 12  ; Argos Extractors
    IME_T3_R16_Companies[3] = 13  ; Consolidated Mining
    IME_T3_R16_Companies[4] = 14  ; Six Sisters
    IME_T3_R16_Companies[5] = 39  ; Ryujin

    IME_T3_R17_Companies = new Int[9]  ; Solvent
    IME_T3_R17_Companies[0] =  9  ; Arc Might
    IME_T3_R17_Companies[1] = 10  ; Celtcorp
    IME_T3_R17_Companies[2] = 36  ; Son
    IME_T3_R17_Companies[3] = 37  ; Lunar Robotics
    IME_T3_R17_Companies[4] = 38  ; Infinity Ltd
    IME_T3_R17_Companies[5] = 39  ; Ryujin
    IME_T3_R17_Companies[6] = 40  ; Kore Kinetics
    IME_T3_R17_Companies[7] = 41  ; Laredo
    IME_T3_R17_Companies[8] = 42  ; Aboron

    IME_T3_R18_Companies = new Int[7]  ; Stimulant
    IME_T3_R18_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T3_R18_Companies[1] =  5  ; Filburn Agriculture
    IME_T3_R18_Companies[2] =  6  ; Chunks
    IME_T3_R18_Companies[3] =  7  ; Centauri Mills
    IME_T3_R18_Companies[4] =  8  ; Chandra Vineyards
    IME_T3_R18_Companies[5] = 11  ; Reliant Medical
    IME_T3_R18_Companies[6] = 39  ; Ryujin

    IME_T3_R19_Companies = new Int[22]  ; Supercooled Magnet
    IME_T3_R19_Companies[0] =  2  ; Generdyne Industries
    IME_T3_R19_Companies[1] = 15  ; Taiyo Astroneering
    IME_T3_R19_Companies[2] = 16  ; Trident Luxury Lines
    IME_T3_R19_Companies[3] = 17  ; Stroud Eklund
    IME_T3_R19_Companies[4] = 18  ; Deimos Staryards
    IME_T3_R19_Companies[5] = 19  ; Hopetech
    IME_T3_R19_Companies[6] = 20  ; Nova Galactic
    IME_T3_R19_Companies[7] = 21  ; Slayton Aerospace
    IME_T3_R19_Companies[8] = 22  ; Amun Dunn
    IME_T3_R19_Companies[9] = 23  ; Panoptes
    IME_T3_R19_Companies[10] = 24  ; Reladyne
    IME_T3_R19_Companies[11] = 25  ; Dogstar
    IME_T3_R19_Companies[12] = 26  ; Sextant Shield Systems
    IME_T3_R19_Companies[13] = 27  ; Nautilus
    IME_T3_R19_Companies[14] = 28  ; Protectorate Systems
    IME_T3_R19_Companies[15] = 29  ; Vanguard
    IME_T3_R19_Companies[16] = 30  ; Deep Core
    IME_T3_R19_Companies[17] = 31  ; Xiang
    IME_T3_R19_Companies[18] = 32  ; Ballistics Solutions
    IME_T3_R19_Companies[19] = 33  ; Light Scythe
    IME_T3_R19_Companies[20] = 34  ; Shinigami
    IME_T3_R19_Companies[21] = 35  ; Horizon Defence

    IME_T3_R20_Companies = new Int[3]  ; Xenon
    IME_T3_R20_Companies[0] =  9  ; Arc Might
    IME_T3_R20_Companies[1] = 10  ; Celtcorp
    IME_T3_R20_Companies[2] = 39  ; Ryujin

    IME_T3_R21_Companies = new Int[21]  ; Ytterbium
    IME_T3_R21_Companies[0] = 15  ; Taiyo Astroneering
    IME_T3_R21_Companies[1] = 16  ; Trident Luxury Lines
    IME_T3_R21_Companies[2] = 17  ; Stroud Eklund
    IME_T3_R21_Companies[3] = 18  ; Deimos Staryards
    IME_T3_R21_Companies[4] = 19  ; Hopetech
    IME_T3_R21_Companies[5] = 20  ; Nova Galactic
    IME_T3_R21_Companies[6] = 21  ; Slayton Aerospace
    IME_T3_R21_Companies[7] = 22  ; Amun Dunn
    IME_T3_R21_Companies[8] = 23  ; Panoptes
    IME_T3_R21_Companies[9] = 24  ; Reladyne
    IME_T3_R21_Companies[10] = 25  ; Dogstar
    IME_T3_R21_Companies[11] = 26  ; Sextant Shield Systems
    IME_T3_R21_Companies[12] = 27  ; Nautilus
    IME_T3_R21_Companies[13] = 28  ; Protectorate Systems
    IME_T3_R21_Companies[14] = 29  ; Vanguard
    IME_T3_R21_Companies[15] = 30  ; Deep Core
    IME_T3_R21_Companies[16] = 31  ; Xiang
    IME_T3_R21_Companies[17] = 32  ; Ballistics Solutions
    IME_T3_R21_Companies[18] = 33  ; Light Scythe
    IME_T3_R21_Companies[19] = 34  ; Shinigami
    IME_T3_R21_Companies[20] = 35  ; Horizon Defence

    IME_T3_R22_Companies = new Int[21]  ; Zero-G Gimbal
    IME_T3_R22_Companies[0] = 15  ; Taiyo Astroneering
    IME_T3_R22_Companies[1] = 16  ; Trident Luxury Lines
    IME_T3_R22_Companies[2] = 17  ; Stroud Eklund
    IME_T3_R22_Companies[3] = 18  ; Deimos Staryards
    IME_T3_R22_Companies[4] = 19  ; Hopetech
    IME_T3_R22_Companies[5] = 20  ; Nova Galactic
    IME_T3_R22_Companies[6] = 21  ; Slayton Aerospace
    IME_T3_R22_Companies[7] = 22  ; Amun Dunn
    IME_T3_R22_Companies[8] = 23  ; Panoptes
    IME_T3_R22_Companies[9] = 24  ; Reladyne
    IME_T3_R22_Companies[10] = 25  ; Dogstar
    IME_T3_R22_Companies[11] = 26  ; Sextant Shield Systems
    IME_T3_R22_Companies[12] = 27  ; Nautilus
    IME_T3_R22_Companies[13] = 28  ; Protectorate Systems
    IME_T3_R22_Companies[14] = 29  ; Vanguard
    IME_T3_R22_Companies[15] = 30  ; Deep Core
    IME_T3_R22_Companies[16] = 31  ; Xiang
    IME_T3_R22_Companies[17] = 32  ; Ballistics Solutions
    IME_T3_R22_Companies[18] = 33  ; Light Scythe
    IME_T3_R22_Companies[19] = 34  ; Shinigami
    IME_T3_R22_Companies[20] = 35  ; Horizon Defence

    ; Tier 4
    IME_T4_R00_Companies = new Int[3]  ; Aldumite
    IME_T4_R00_Companies[0] = 12  ; Argos Extractors
    IME_T4_R00_Companies[1] = 13  ; Consolidated Mining
    IME_T4_R00_Companies[2] = 14  ; Six Sisters

    IME_T4_R01_Companies = new Int[28]  ; Control Rod
    IME_T4_R01_Companies[0] =  2  ; Generdyne Industries
    IME_T4_R01_Companies[1] =  9  ; Arc Might
    IME_T4_R01_Companies[2] = 10  ; Celtcorp
    IME_T4_R01_Companies[3] = 15  ; Taiyo Astroneering
    IME_T4_R01_Companies[4] = 16  ; Trident Luxury Lines
    IME_T4_R01_Companies[5] = 17  ; Stroud Eklund
    IME_T4_R01_Companies[6] = 18  ; Deimos Staryards
    IME_T4_R01_Companies[7] = 19  ; Hopetech
    IME_T4_R01_Companies[8] = 20  ; Nova Galactic
    IME_T4_R01_Companies[9] = 21  ; Slayton Aerospace
    IME_T4_R01_Companies[10] = 22  ; Amun Dunn
    IME_T4_R01_Companies[11] = 23  ; Panoptes
    IME_T4_R01_Companies[12] = 24  ; Reladyne
    IME_T4_R01_Companies[13] = 25  ; Dogstar
    IME_T4_R01_Companies[14] = 26  ; Sextant Shield Systems
    IME_T4_R01_Companies[15] = 27  ; Nautilus
    IME_T4_R01_Companies[16] = 28  ; Protectorate Systems
    IME_T4_R01_Companies[17] = 29  ; Vanguard
    IME_T4_R01_Companies[18] = 30  ; Deep Core
    IME_T4_R01_Companies[19] = 31  ; Xiang
    IME_T4_R01_Companies[20] = 32  ; Ballistics Solutions
    IME_T4_R01_Companies[21] = 33  ; Light Scythe
    IME_T4_R01_Companies[22] = 34  ; Shinigami
    IME_T4_R01_Companies[23] = 35  ; Horizon Defence
    IME_T4_R01_Companies[24] = 36  ; Son
    IME_T4_R01_Companies[25] = 37  ; Lunar Robotics
    IME_T4_R01_Companies[26] = 38  ; Infinity Ltd
    IME_T4_R01_Companies[27] = 39  ; Ryujin

    IME_T4_R02_Companies = new Int[5]  ; Gastronomic Delight
    IME_T4_R02_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T4_R02_Companies[1] =  5  ; Filburn Agriculture
    IME_T4_R02_Companies[2] =  6  ; Chunks
    IME_T4_R02_Companies[3] =  7  ; Centauri Mills
    IME_T4_R02_Companies[4] =  8  ; Chandra Vineyards

    IME_T4_R03_Companies = new Int[2]  ; High-Tensile Spidroin
    IME_T4_R03_Companies[0] =  0  ; Eit Clothiers
    IME_T4_R03_Companies[1] = 39  ; Ryujin

    IME_T4_R04_Companies = new Int[2]  ; Immunostimulant
    IME_T4_R04_Companies[0] = 11  ; Reliant Medical
    IME_T4_R04_Companies[1] = 39  ; Ryujin

    IME_T4_R05_Companies = new Int[2]  ; Luxury Textile
    IME_T4_R05_Companies[0] =  0  ; Eit Clothiers
    IME_T4_R05_Companies[1] = 39  ; Ryujin

    IME_T4_R06_Companies = new Int[6]  ; Memory Substrate
    IME_T4_R06_Companies[0] = 10  ; Celtcorp
    IME_T4_R06_Companies[1] = 11  ; Reliant Medical
    IME_T4_R06_Companies[2] = 36  ; Son
    IME_T4_R06_Companies[3] = 37  ; Lunar Robotics
    IME_T4_R06_Companies[4] = 38  ; Infinity Ltd
    IME_T4_R06_Companies[5] = 39  ; Ryujin

    IME_T4_R07_Companies = new Int[8]  ; Microsecond Regulator
    IME_T4_R07_Companies[0] = 10  ; Celtcorp
    IME_T4_R07_Companies[1] = 36  ; Son
    IME_T4_R07_Companies[2] = 37  ; Lunar Robotics
    IME_T4_R07_Companies[3] = 38  ; Infinity Ltd
    IME_T4_R07_Companies[4] = 39  ; Ryujin
    IME_T4_R07_Companies[5] = 40  ; Kore Kinetics
    IME_T4_R07_Companies[6] = 41  ; Laredo
    IME_T4_R07_Companies[7] = 42  ; Aboron

    IME_T4_R08_Companies = new Int[6]  ; Neurologic
    IME_T4_R08_Companies[0] = 10  ; Celtcorp
    IME_T4_R08_Companies[1] = 11  ; Reliant Medical
    IME_T4_R08_Companies[2] = 36  ; Son
    IME_T4_R08_Companies[3] = 37  ; Lunar Robotics
    IME_T4_R08_Companies[4] = 38  ; Infinity Ltd
    IME_T4_R08_Companies[5] = 39  ; Ryujin

    IME_T4_R09_Companies = new Int[1]  ; Nuclear Fuel Rod
    IME_T4_R09_Companies[0] =  2  ; Generdyne Industries

    IME_T4_R10_Companies = new Int[1]  ; Power Circuit
    IME_T4_R10_Companies[0] =  2  ; Generdyne Industries

    IME_T4_R11_Companies = new Int[5]  ; Quark-Degenerate Tissues
    IME_T4_R11_Companies[0] =  4  ; Xenofresh Fisheries
    IME_T4_R11_Companies[1] =  5  ; Filburn Agriculture
    IME_T4_R11_Companies[2] =  6  ; Chunks
    IME_T4_R11_Companies[3] =  7  ; Centauri Mills
    IME_T4_R11_Companies[4] =  8  ; Chandra Vineyards

    IME_T4_R12_Companies = new Int[21]  ; Sterile Nanotubes
    IME_T4_R12_Companies[0] = 15  ; Taiyo Astroneering
    IME_T4_R12_Companies[1] = 16  ; Trident Luxury Lines
    IME_T4_R12_Companies[2] = 17  ; Stroud Eklund
    IME_T4_R12_Companies[3] = 18  ; Deimos Staryards
    IME_T4_R12_Companies[4] = 19  ; Hopetech
    IME_T4_R12_Companies[5] = 20  ; Nova Galactic
    IME_T4_R12_Companies[6] = 21  ; Slayton Aerospace
    IME_T4_R12_Companies[7] = 22  ; Amun Dunn
    IME_T4_R12_Companies[8] = 23  ; Panoptes
    IME_T4_R12_Companies[9] = 24  ; Reladyne
    IME_T4_R12_Companies[10] = 25  ; Dogstar
    IME_T4_R12_Companies[11] = 26  ; Sextant Shield Systems
    IME_T4_R12_Companies[12] = 27  ; Nautilus
    IME_T4_R12_Companies[13] = 28  ; Protectorate Systems
    IME_T4_R12_Companies[14] = 29  ; Vanguard
    IME_T4_R12_Companies[15] = 30  ; Deep Core
    IME_T4_R12_Companies[16] = 31  ; Xiang
    IME_T4_R12_Companies[17] = 32  ; Ballistics Solutions
    IME_T4_R12_Companies[18] = 33  ; Light Scythe
    IME_T4_R12_Companies[19] = 34  ; Shinigami
    IME_T4_R12_Companies[20] = 35  ; Horizon Defence

    IME_T4_R13_Companies = new Int[1]  ; Vytinium
    IME_T4_R13_Companies[0] =  2  ; Generdyne Industries

    ; Tier 5
    IME_T5_R00_Companies = new Int[3]  ; Aldumite Drilling Rig
    IME_T5_R00_Companies[0] = 12  ; Argos Extractors
    IME_T5_R00_Companies[1] = 13  ; Consolidated Mining
    IME_T5_R00_Companies[2] = 14  ; Six Sisters

    IME_T5_R01_Companies = new Int[8]  ; Indicite Wafer
    IME_T5_R01_Companies[0] = 10  ; Celtcorp
    IME_T5_R01_Companies[1] = 12  ; Argos Extractors
    IME_T5_R01_Companies[2] = 13  ; Consolidated Mining
    IME_T5_R01_Companies[3] = 14  ; Six Sisters
    IME_T5_R01_Companies[4] = 36  ; Son
    IME_T5_R01_Companies[5] = 37  ; Lunar Robotics
    IME_T5_R01_Companies[6] = 38  ; Infinity Ltd
    IME_T5_R01_Companies[7] = 39  ; Ryujin

    IME_T5_R02_Companies = new Int[1]  ; Rothicite Magnet
    IME_T5_R02_Companies[0] =  2  ; Generdyne Industries

    IME_T5_R03_Companies = new Int[6]  ; Substrate Molecule Sieve
    IME_T5_R03_Companies[0] = 10  ; Celtcorp
    IME_T5_R03_Companies[1] = 11  ; Reliant Medical
    IME_T5_R03_Companies[2] = 36  ; Son
    IME_T5_R03_Companies[3] = 37  ; Lunar Robotics
    IME_T5_R03_Companies[4] = 38  ; Infinity Ltd
    IME_T5_R03_Companies[5] = 39  ; Ryujin

    IME_T5_R04_Companies = new Int[1]  ; Tasine Superconductor
    IME_T5_R04_Companies[0] =  2  ; Generdyne Industries

    IME_T5_R05_Companies = new Int[24]  ; Veryl-Treated Manifold
    IME_T5_R05_Companies[0] = 12  ; Argos Extractors
    IME_T5_R05_Companies[1] = 13  ; Consolidated Mining
    IME_T5_R05_Companies[2] = 14  ; Six Sisters
    IME_T5_R05_Companies[3] = 15  ; Taiyo Astroneering
    IME_T5_R05_Companies[4] = 16  ; Trident Luxury Lines
    IME_T5_R05_Companies[5] = 17  ; Stroud Eklund
    IME_T5_R05_Companies[6] = 18  ; Deimos Staryards
    IME_T5_R05_Companies[7] = 19  ; Hopetech
    IME_T5_R05_Companies[8] = 20  ; Nova Galactic
    IME_T5_R05_Companies[9] = 21  ; Slayton Aerospace
    IME_T5_R05_Companies[10] = 22  ; Amun Dunn
    IME_T5_R05_Companies[11] = 23  ; Panoptes
    IME_T5_R05_Companies[12] = 24  ; Reladyne
    IME_T5_R05_Companies[13] = 25  ; Dogstar
    IME_T5_R05_Companies[14] = 26  ; Sextant Shield Systems
    IME_T5_R05_Companies[15] = 27  ; Nautilus
    IME_T5_R05_Companies[16] = 28  ; Protectorate Systems
    IME_T5_R05_Companies[17] = 29  ; Vanguard
    IME_T5_R05_Companies[18] = 30  ; Deep Core
    IME_T5_R05_Companies[19] = 31  ; Xiang
    IME_T5_R05_Companies[20] = 32  ; Ballistics Solutions
    IME_T5_R05_Companies[21] = 33  ; Light Scythe
    IME_T5_R05_Companies[22] = 34  ; Shinigami
    IME_T5_R05_Companies[23] = 35  ; Horizon Defence

    IME_T5_R06_Companies = new Int[22]  ; Vytinium Fuel Rod
    IME_T5_R06_Companies[0] =  2  ; Generdyne Industries
    IME_T5_R06_Companies[1] = 15  ; Taiyo Astroneering
    IME_T5_R06_Companies[2] = 16  ; Trident Luxury Lines
    IME_T5_R06_Companies[3] = 17  ; Stroud Eklund
    IME_T5_R06_Companies[4] = 18  ; Deimos Staryards
    IME_T5_R06_Companies[5] = 19  ; Hopetech
    IME_T5_R06_Companies[6] = 20  ; Nova Galactic
    IME_T5_R06_Companies[7] = 21  ; Slayton Aerospace
    IME_T5_R06_Companies[8] = 22  ; Amun Dunn
    IME_T5_R06_Companies[9] = 23  ; Panoptes
    IME_T5_R06_Companies[10] = 24  ; Reladyne
    IME_T5_R06_Companies[11] = 25  ; Dogstar
    IME_T5_R06_Companies[12] = 26  ; Sextant Shield Systems
    IME_T5_R06_Companies[13] = 27  ; Nautilus
    IME_T5_R06_Companies[14] = 28  ; Protectorate Systems
    IME_T5_R06_Companies[15] = 29  ; Vanguard
    IME_T5_R06_Companies[16] = 30  ; Deep Core
    IME_T5_R06_Companies[17] = 31  ; Xiang
    IME_T5_R06_Companies[18] = 32  ; Ballistics Solutions
    IME_T5_R06_Companies[19] = 33  ; Light Scythe
    IME_T5_R06_Companies[20] = 34  ; Shinigami
    IME_T5_R06_Companies[21] = 35  ; Horizon Defence

EndFunction

; Master lookup: given tier + resource index + pick index, returns company index
Int Function GetIndex(Int aiTier, Int aiResIdx, Int aiPickIdx)
    If aiTier == 1
        Return GetTier1Index(aiResIdx, aiPickIdx)
    ElseIf aiTier == 2
        Return GetTier2Index(aiResIdx, aiPickIdx)
    ElseIf aiTier == 3
        Return GetTier3Index(aiResIdx, aiPickIdx)
    ElseIf aiTier == 4
        Return GetTier4Index(aiResIdx, aiPickIdx)
    Else
        Return GetTier5Index(aiResIdx, aiPickIdx)
    EndIf
EndFunction

Int Function GetTier1Index(Int aiResIdx, Int aiPickIdx)
    If aiResIdx == 0  ; Alkanes
        Return IME_T1_R00_Companies[aiPickIdx]
    ElseIf aiResIdx == 1  ; Aluminum
        Return IME_T1_R01_Companies[aiPickIdx]
    ElseIf aiResIdx == 2  ; Antimicrobial
        Return IME_T1_R02_Companies[aiPickIdx]
    ElseIf aiResIdx == 3  ; Argon
        Return IME_T1_R03_Companies[aiPickIdx]
    ElseIf aiResIdx == 4  ; Benzene
        Return IME_T1_R04_Companies[aiPickIdx]
    ElseIf aiResIdx == 5  ; Beryllium
        Return IME_T1_R05_Companies[aiPickIdx]
    ElseIf aiResIdx == 6  ; Chlorine
        Return IME_T1_R06_Companies[aiPickIdx]
    ElseIf aiResIdx == 7  ; Chlorosilanes
        Return IME_T1_R07_Companies[aiPickIdx]
    ElseIf aiResIdx == 8  ; Cobalt
        Return IME_T1_R08_Companies[aiPickIdx]
    ElseIf aiResIdx == 9  ; Copper
        Return IME_T1_R09_Companies[aiPickIdx]
    ElseIf aiResIdx == 10  ; Cosmetic
        Return IME_T1_R10_Companies[aiPickIdx]
    ElseIf aiResIdx == 11  ; Fiber
        Return IME_T1_R11_Companies[aiPickIdx]
    ElseIf aiResIdx == 12  ; Fluorine
        Return IME_T1_R12_Companies[aiPickIdx]
    ElseIf aiResIdx == 13  ; Helium-3
        Return IME_T1_R13_Companies[aiPickIdx]
    ElseIf aiResIdx == 14  ; Iridium
        Return IME_T1_R14_Companies[aiPickIdx]
    ElseIf aiResIdx == 15  ; Iron
        Return IME_T1_R15_Companies[aiPickIdx]
    ElseIf aiResIdx == 16  ; Lead
        Return IME_T1_R16_Companies[aiPickIdx]
    ElseIf aiResIdx == 17  ; Membrane
        Return IME_T1_R17_Companies[aiPickIdx]
    ElseIf aiResIdx == 18  ; Metabolic Agent
        Return IME_T1_R18_Companies[aiPickIdx]
    ElseIf aiResIdx == 19  ; Nickel
        Return IME_T1_R19_Companies[aiPickIdx]
    ElseIf aiResIdx == 20  ; Nutrient
        Return IME_T1_R20_Companies[aiPickIdx]
    ElseIf aiResIdx == 21  ; Ornamental Material
        Return IME_T1_R21_Companies[aiPickIdx]
    ElseIf aiResIdx == 22  ; Pigment
        Return IME_T1_R22_Companies[aiPickIdx]
    ElseIf aiResIdx == 23  ; Sealant
        Return IME_T1_R23_Companies[aiPickIdx]
    ElseIf aiResIdx == 24  ; Silver
        Return IME_T1_R24_Companies[aiPickIdx]
    ElseIf aiResIdx == 25  ; Spice
        Return IME_T1_R25_Companies[aiPickIdx]
    ElseIf aiResIdx == 26  ; Structural Material
        Return IME_T1_R26_Companies[aiPickIdx]
    ElseIf aiResIdx == 27  ; Toxin
        Return IME_T1_R27_Companies[aiPickIdx]
    ElseIf aiResIdx == 28  ; Tungsten
        Return IME_T1_R28_Companies[aiPickIdx]
    ElseIf aiResIdx == 29  ; Uranium
        Return IME_T1_R29_Companies[aiPickIdx]
    ElseIf aiResIdx == 30  ; Water
        Return IME_T1_R30_Companies[aiPickIdx]
    EndIf
    Return 0  ; fallback
EndFunction

Int Function GetTier2Index(Int aiResIdx, Int aiPickIdx)
    If aiResIdx == 0  ; Adaptive Frame
        Return IME_T2_R00_Companies[aiPickIdx]
    ElseIf aiResIdx == 1  ; Adhesive
        Return IME_T2_R01_Companies[aiPickIdx]
    ElseIf aiResIdx == 2  ; Amino Acids
        Return IME_T2_R02_Companies[aiPickIdx]
    ElseIf aiResIdx == 3  ; Analgesic
        Return IME_T2_R03_Companies[aiPickIdx]
    ElseIf aiResIdx == 4  ; Aromatic
        Return IME_T2_R04_Companies[aiPickIdx]
    ElseIf aiResIdx == 5  ; Austenitic Manifold
        Return IME_T2_R05_Companies[aiPickIdx]
    ElseIf aiResIdx == 6  ; Carboxylic Acids
        Return IME_T2_R06_Companies[aiPickIdx]
    ElseIf aiResIdx == 7  ; Comm Relay
        Return IME_T2_R07_Companies[aiPickIdx]
    ElseIf aiResIdx == 8  ; Gold
        Return IME_T2_R08_Companies[aiPickIdx]
    ElseIf aiResIdx == 9  ; Hallucinogen
        Return IME_T2_R09_Companies[aiPickIdx]
    ElseIf aiResIdx == 10  ; Isocentered Magnet
        Return IME_T2_R10_Companies[aiPickIdx]
    ElseIf aiResIdx == 11  ; Isotopic Coolant
        Return IME_T2_R11_Companies[aiPickIdx]
    ElseIf aiResIdx == 12  ; Lithium
        Return IME_T2_R12_Companies[aiPickIdx]
    ElseIf aiResIdx == 13  ; Mag Pressure Tank
        Return IME_T2_R13_Companies[aiPickIdx]
    ElseIf aiResIdx == 14  ; Mercury
        Return IME_T2_R14_Companies[aiPickIdx]
    ElseIf aiResIdx == 15  ; Monopropellant
        Return IME_T2_R15_Companies[aiPickIdx]
    ElseIf aiResIdx == 16  ; Neodymium
        Return IME_T2_R16_Companies[aiPickIdx]
    ElseIf aiResIdx == 17  ; Platinum
        Return IME_T2_R17_Companies[aiPickIdx]
    ElseIf aiResIdx == 18  ; Polytextile
        Return IME_T2_R18_Companies[aiPickIdx]
    ElseIf aiResIdx == 19  ; Reactive Gauge
        Return IME_T2_R19_Companies[aiPickIdx]
    ElseIf aiResIdx == 20  ; Sedative
        Return IME_T2_R20_Companies[aiPickIdx]
    ElseIf aiResIdx == 21  ; Tantalum
        Return IME_T2_R21_Companies[aiPickIdx]
    ElseIf aiResIdx == 22  ; Tau Grade Rheostat
        Return IME_T2_R22_Companies[aiPickIdx]
    ElseIf aiResIdx == 23  ; Tetrafluorides
        Return IME_T2_R23_Companies[aiPickIdx]
    ElseIf aiResIdx == 24  ; Titanium
        Return IME_T2_R24_Companies[aiPickIdx]
    ElseIf aiResIdx == 25  ; Vanadium
        Return IME_T2_R25_Companies[aiPickIdx]
    ElseIf aiResIdx == 26  ; Zero Wire
        Return IME_T2_R26_Companies[aiPickIdx]
    EndIf
    Return 0  ; fallback
EndFunction

Int Function GetTier3Index(Int aiResIdx, Int aiPickIdx)
    If aiResIdx == 0  ; Antimony
        Return IME_T3_R00_Companies[aiPickIdx]
    ElseIf aiResIdx == 1  ; Biosuppressant
        Return IME_T3_R01_Companies[aiPickIdx]
    ElseIf aiResIdx == 2  ; Caesium
        Return IME_T3_R02_Companies[aiPickIdx]
    ElseIf aiResIdx == 3  ; Drilling Rig
        Return IME_T3_R03_Companies[aiPickIdx]
    ElseIf aiResIdx == 4  ; Dysprosium
        Return IME_T3_R04_Companies[aiPickIdx]
    ElseIf aiResIdx == 5  ; Europium
        Return IME_T3_R05_Companies[aiPickIdx]
    ElseIf aiResIdx == 6  ; Hypercatalyst
        Return IME_T3_R06_Companies[aiPickIdx]
    ElseIf aiResIdx == 7  ; Ionic Liquids
        Return IME_T3_R07_Companies[aiPickIdx]
    ElseIf aiResIdx == 8  ; Lubricant
        Return IME_T3_R08_Companies[aiPickIdx]
    ElseIf aiResIdx == 9  ; Molecular Sieve
        Return IME_T3_R09_Companies[aiPickIdx]
    ElseIf aiResIdx == 10  ; Neon
        Return IME_T3_R10_Companies[aiPickIdx]
    ElseIf aiResIdx == 11  ; Palladium
        Return IME_T3_R11_Companies[aiPickIdx]
    ElseIf aiResIdx == 12  ; Paramagnon Conductor
        Return IME_T3_R12_Companies[aiPickIdx]
    ElseIf aiResIdx == 13  ; Plutonium
        Return IME_T3_R13_Companies[aiPickIdx]
    ElseIf aiResIdx == 14  ; Polymer
        Return IME_T3_R14_Companies[aiPickIdx]
    ElseIf aiResIdx == 15  ; Positron Battery
        Return IME_T3_R15_Companies[aiPickIdx]
    ElseIf aiResIdx == 16  ; Semimetal Wafer
        Return IME_T3_R16_Companies[aiPickIdx]
    ElseIf aiResIdx == 17  ; Solvent
        Return IME_T3_R17_Companies[aiPickIdx]
    ElseIf aiResIdx == 18  ; Stimulant
        Return IME_T3_R18_Companies[aiPickIdx]
    ElseIf aiResIdx == 19  ; Supercooled Magnet
        Return IME_T3_R19_Companies[aiPickIdx]
    ElseIf aiResIdx == 20  ; Xenon
        Return IME_T3_R20_Companies[aiPickIdx]
    ElseIf aiResIdx == 21  ; Ytterbium
        Return IME_T3_R21_Companies[aiPickIdx]
    ElseIf aiResIdx == 22  ; Zero-G Gimbal
        Return IME_T3_R22_Companies[aiPickIdx]
    EndIf
    Return 0  ; fallback
EndFunction

Int Function GetTier4Index(Int aiResIdx, Int aiPickIdx)
    If aiResIdx == 0  ; Aldumite
        Return IME_T4_R00_Companies[aiPickIdx]
    ElseIf aiResIdx == 1  ; Control Rod
        Return IME_T4_R01_Companies[aiPickIdx]
    ElseIf aiResIdx == 2  ; Gastronomic Delight
        Return IME_T4_R02_Companies[aiPickIdx]
    ElseIf aiResIdx == 3  ; High-Tensile Spidroin
        Return IME_T4_R03_Companies[aiPickIdx]
    ElseIf aiResIdx == 4  ; Immunostimulant
        Return IME_T4_R04_Companies[aiPickIdx]
    ElseIf aiResIdx == 5  ; Luxury Textile
        Return IME_T4_R05_Companies[aiPickIdx]
    ElseIf aiResIdx == 6  ; Memory Substrate
        Return IME_T4_R06_Companies[aiPickIdx]
    ElseIf aiResIdx == 7  ; Microsecond Regulator
        Return IME_T4_R07_Companies[aiPickIdx]
    ElseIf aiResIdx == 8  ; Neurologic
        Return IME_T4_R08_Companies[aiPickIdx]
    ElseIf aiResIdx == 9  ; Nuclear Fuel Rod
        Return IME_T4_R09_Companies[aiPickIdx]
    ElseIf aiResIdx == 10  ; Power Circuit
        Return IME_T4_R10_Companies[aiPickIdx]
    ElseIf aiResIdx == 11  ; Quark-Degenerate Tissues
        Return IME_T4_R11_Companies[aiPickIdx]
    ElseIf aiResIdx == 12  ; Sterile Nanotubes
        Return IME_T4_R12_Companies[aiPickIdx]
    ElseIf aiResIdx == 13  ; Vytinium
        Return IME_T4_R13_Companies[aiPickIdx]
    EndIf
    Return 0  ; fallback
EndFunction

Int Function GetTier5Index(Int aiResIdx, Int aiPickIdx)
    If aiResIdx == 0  ; Aldumite Drilling Rig
        Return IME_T5_R00_Companies[aiPickIdx]
    ElseIf aiResIdx == 1  ; Indicite Wafer
        Return IME_T5_R01_Companies[aiPickIdx]
    ElseIf aiResIdx == 2  ; Rothicite Magnet
        Return IME_T5_R02_Companies[aiPickIdx]
    ElseIf aiResIdx == 3  ; Substrate Molecule Sieve
        Return IME_T5_R03_Companies[aiPickIdx]
    ElseIf aiResIdx == 4  ; Tasine Superconductor
        Return IME_T5_R04_Companies[aiPickIdx]
    ElseIf aiResIdx == 5  ; Veryl-Treated Manifold
        Return IME_T5_R05_Companies[aiPickIdx]
    ElseIf aiResIdx == 6  ; Vytinium Fuel Rod
        Return IME_T5_R06_Companies[aiPickIdx]
    EndIf
    Return 0  ; fallback
EndFunction
