# IME CK Wiring Guide
Complete reference for building the plugin from scratch.

---

## Forms to Create

### Keywords
| Editor ID | Purpose |
|---|---|
| `IME_FilterKeyword` | Tags all IME job quests — passed to `Game.ShowMissionBoardMenu()` so only IME jobs appear on this board. Must be added to the keyword list of every `IME_JobQuest_XX`. |

### Global Variables — Shared (5)
| Editor ID | Type | Initial | Purpose |
|---|---|---|---|
| `IME_Reputation` | Float | 0 | Player rep score |
| `IME_LastRefreshTime` | Float | 0 | Game time of last board refresh |
| `IME_BidGlobal_Low` | Int | 0 | Lowball bid price — updated just before bid message shows |
| `IME_BidGlobal_Fair` | Int | 0 | Fair bid price |
| `IME_BidGlobal_High` | Int | 0 | High bid price |

### Global Variables — Per Job Quest (5 × 12 = 60)
Create 60 globals. Naming convention: `IME_Job_XX_<Field>` where XX is 00–11.

For each slot 00–11 create:
| Editor ID | Type | Initial |
|---|---|---|
| `IME_Job_XX_Tier` | Int | 0 |
| `IME_Job_XX_Urgency` | Int | 0 |
| `IME_Job_XX_Qty` | Int | 0 |
| `IME_Job_XX_Hours` | Int | 0 |
| `IME_Job_XX_Fair` | Int | 0 |

### Global Variables — Dropoff Terminal (5)
| Editor ID | Type | Initial | Purpose |
|---|---|---|---|
| `IME_DropoffResultGlobal` | Int | 0 | 0=none, 1=complete, 2=no cargo, 3=no contract, 4=expired, 5=partial |
| `IME_Local_Vis_0` | Int | 0 | Contract slot 0 visibility on dropoff terminal |
| `IME_Local_Vis_1` | Int | 0 | Contract slot 1 visibility |
| `IME_Local_Vis_2` | Int | 0 | Contract slot 2 visibility |
| `IME_Local_Vis_3` | Int | 0 | Contract slot 3 visibility |

### Messages (3)
| Editor ID | Buttons | Notes |
|---|---|---|
| `IME_BidSelectMessage` | Lowball Bid / Fair Offer / High Bid / Cancel | Use `<Global=IME_BidGlobal_Low>`, `<Global=IME_BidGlobal_Fair>`, `<Global=IME_BidGlobal_High>` as tokens for prices |
| `IME_BidWinMessage` | OK | "Bid accepted." or flavour text |
| `IME_BidLoseMessage` | OK | "Bid not accepted — another contractor won the order." |

---

## Quests

### IME_MainQuest
- **Script:** `IME_MainQuestScript`
- **Start game enabled:** Yes
- **No stages or aliases needed**

#### Script Properties
| Property | Wire to |
|---|---|
| `DataInit` | IME_DataInit quest (must be created separately — populates job pool arrays on init) |
| `Credits` | Vanilla credits MiscObject |
| `IME_Reputation` | `IME_Reputation` global |
| `IME_LastRefreshTime` | `IME_LastRefreshTime` global |
| `IME_BidGlobal_Low` | `IME_BidGlobal_Low` global |
| `IME_BidGlobal_Fair` | `IME_BidGlobal_Fair` global |
| `IME_BidGlobal_High` | `IME_BidGlobal_High` global |
| `IME_BidSelectMessage` | `IME_BidSelectMessage` message |
| `IME_BidWinMessage` | `IME_BidWinMessage` message |
| `IME_BidLoseMessage` | `IME_BidLoseMessage` message |
| `IME_JobQuests` | Array — add `IME_JobQuest_00` through `IME_JobQuest_11` in order (12 entries) |
| `IME_ContractQuests` | Array — add `IME_Contract_00` through `IME_Contract_03` in order (4 entries) |

---

### IME_JobQuest_00 through IME_JobQuest_11 (12 quests)
- **Script:** `IME_JobQuestScript`
- **Start game enabled:** No — started directly by `IME_MainQuestScript.PopulateSingleSlot()`
- **Keywords:** Add `IME_FilterKeyword` to each quest's keyword list — required for the board to display it

#### Stages (identical on all 12)
| Stage | Log Entry | Notes |
|---|---|---|
| 0 | — | Dormant/initial |
| 10 | "Cargo order available at the exchange." | Active, slot on board |
| 100 | "Bid accepted." | Won bid — quest leaves available list |
| 200 | "Order filled by another contractor." | Slot cleared without a win |

#### Quest Description Text (suggested — applied per quest)
Use the per-quest globals as `<Global=...>` tokens. Resource name and company name are strings and cannot appear here — they are visible in the contract quest journal after a bid is won.
```
Tier <Global=IME_Job_XX_Tier> cargo order
Quantity: <Global=IME_Job_XX_Qty> units
Deadline: <Global=IME_Job_XX_Hours>h
Fair value: ~<Global=IME_Job_XX_Fair> credits
```

#### Script Properties (per quest — substitute XX for the slot number)
| Property | Wire to |
|---|---|
| `IMEMain` | `IME_MainQuest` quest |
| `IME_Job_Tier` | `IME_Job_XX_Tier` global |
| `IME_Job_Urgency` | `IME_Job_XX_Urgency` global |
| `IME_Job_Qty` | `IME_Job_XX_Qty` global |
| `IME_Job_Hours` | `IME_Job_XX_Hours` global |
| `IME_Job_Fair` | `IME_Job_XX_Fair` global |

---

### IME_Contract_00 through IME_Contract_03 (4 quests)
- **Script:** `IME_ContractQuestScript`
- **Start game enabled:** No — started by `IME_MainQuestScript.ActivateContractQuest()`

#### Stages (identical on all 4)
| Stage | Log Entry | Notes |
|---|---|---|
| 0 | — | Dormant |
| 10 | Active objective (see below) | Started on bid win |
| 100 | "Contract fulfilled." | Complete |
| 200 | "Contract failed — deadline missed." | Failed |

Stage 10 objective text (suggested):
```
Deliver [QuantityRequired] [ResourceName] to [CompanyName], New Atlantis
```
`ResourceName`, `CompanyName`, and `QuantityRequired` are script properties cached at `InitContract()` time. Wire the objective counter to `QuantityDelivered` / `QuantityRequired` if you want a tracked counter in the journal.

#### Script Properties
| Property | Wire to |
|---|---|
| `MainScript` | `IME_MainQuest` quest |

---

## World Object — Exchange Board (Cydonia)

### Object Record
Use any activator or furniture mesh appropriate for the board. Attach script `IME_BoardActivatorScript`.

### Placed Reference Properties
| Property | Wire to |
|---|---|
| `MainScript` | `IME_MainQuest` quest |
| `IME_FilterKeyword` | `IME_FilterKeyword` keyword |
| `FactionID` | Leave at -1 (default UI), or set 1=UC / 2=Ryujin / 4=Freestar for themed UI |

---

## World Objects — Dropoff Terminals

Use `TERM` records for the dropoff terminals. Attach script `IME_DropoffTerminalScript`.

### Script Properties (all placements)
| Property | Wire to |
|---|---|
| `MainScript` | `IME_MainQuest` quest |
| `SettlementIndex` | 0 = New Atlantis, 1 = Neon, 2 = Akila City, 3 = Cydonia |
| `IME_DropoffResultGlobal` | `IME_DropoffResultGlobal` global |
| `IME_Local_Visible` | GlobalVariable array — add `IME_Local_Vis_0` through `IME_Local_Vis_3` (4 entries) |
| `IME_Local_ResourceName` | String array — 4 empty string entries |
| `IME_Local_Progress` | String array — 4 empty string entries |
| `IME_Local_Company` | String array — 4 empty string entries |
| `IME_Local_HoursRemaining` | String array — 4 empty string entries |

Wire all `IME_Item_*` MiscObject properties to the corresponding base game resource forms:

> Aluminum, Argon, Chlorine, Copper, Iron, Lead, Nickel, Uranium, Water, Alkanes, Benzene,
> Beryllium, Chlorosilanes, Cobalt, Fluorine, Helium3, Iridium, Silver, Tungsten,
> CarboxylicAcids, Gold, Lithium, Mercury, Neodymium, Platinum, Tantalum, Tetrafluorides,
> Titanium, Vanadium, Antimony, Caesium, Dysprosium, Europium, IonicLiquids, Neon, Palladium,
> Plutonium, Xenon, Ytterbium, Aldumite, Vytinium, Fiber, MetabolicAgent, Nutrient, Sealant,
> StructuralMaterial, Toxin, Antimicrobial, Cosmetic, Membrane, OrnamentalMaterial, Pigment,
> Spice, Adhesive, AminoAcids, Analgesic, Aromatic, Hallucinogen, Sedative, Biosuppressant,
> Hypercatalyst, Lubricant, Polymer, Solvent, Stimulant, GastronomicDelight, HighTensileSpidroin,
> Immunostimulant, LuxuryTextile, MemorySubstrate, AdaptiveFrame, AustenicManifold, CommRelay,
> IsocenteredMagnet, IsotopicCoolant, MagPressureTank, Monopropellant, Polytextile,
> ReactiveGauge, TauGradeRheostat, ZeroWire, DrillingRig, MolecularSieve, ParamagnomConductor,
> PositronBattery, SemimetalWafer, SupercooledMagnet, ZeroGGimbal, ControlRod,
> MicrosecondRegulator, NuclearFuelRod, PowerCircuit, SterileNanotubes, AldumiteDrillingRig,
> IndiciteWafer, RothiciteMagnet, SubstrateMoleculeSieve, TasineSuperconductor,
> VerylTreatedManifold, VytiniumFuelRod

### Dropoff TERM Menu Structure
```
[Main Menu]
├── Active Contracts
│   ├── Contract 0  (condition: IME_Local_Vis_0 == 1)
│   │   └── Deliver  → fragment: SelectContract(0) then AttemptFulfill()
│   ├── Contract 1  (condition: IME_Local_Vis_1 == 1)
│   │   └── Deliver  → fragment: SelectContract(1) then AttemptFulfill()
│   ├── Contract 2  (condition: IME_Local_Vis_2 == 1)
│   │   └── Deliver  → fragment: SelectContract(2) then AttemptFulfill()
│   └── Contract 3  (condition: IME_Local_Vis_3 == 1)
│       └── Deliver  → fragment: SelectContract(3) then AttemptFulfill()
├── [Result: Fulfilled]  (condition: IME_DropoffResultGlobal == 1)
├── [Result: No cargo]   (condition: IME_DropoffResultGlobal == 2)
├── [Result: No contract](condition: IME_DropoffResultGlobal == 3)
├── [Result: Expired]    (condition: IME_DropoffResultGlobal == 4)
└── [Result: Partial]    (condition: IME_DropoffResultGlobal == 5)
```

Fragment pattern per contract slot (cast to the script on the TERM's linked reference):
```papyrus
(GetOwningQuest() as IME_DropoffTerminalScript).SelectContract(0)
(GetOwningQuest() as IME_DropoffTerminalScript).AttemptFulfill()
```

---

## Notes

**IME_DataInit** — `IME_MainQuestScript` references a `DataInit` property that calls `InitAll()` on init.
This script must be created to populate `IME_JobPool_T1` through `IME_JobPool_T5` and the company
data arrays. Without it `PopulateSlots()` will find empty pools and generate no jobs.

**Keyword on job quests** — Every `IME_JobQuest_XX` must have `IME_FilterKeyword` in its keyword list
or `Game.ShowMissionBoardMenu(IME_FilterKeyword, ...)` will not display it.

**Contract quest count** — 4 contract quests matches `IME_MaxAwardedContracts = 4`. If you change
that constant, add or remove contract quests and array entries to match.

**String display limitation** — Resource name, company name, and settlement are Papyrus strings.
They cannot appear in mission board list text or message `<Global=...>` tokens. They show up in
the contract quest journal once a bid is won (set in the stage 10 objective).

**Retired** — `IME_ExchangeTerminalScript` is retired (renamed `.psc.retired`). Do not create it
in the CK. The old exchange terminal activator placed in the world should be removed and replaced
with the board object wired to `IME_BoardActivatorScript`.
