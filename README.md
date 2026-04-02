# The Industrialist Mod
### A Starfield mod adding an industrial contract system to the Settled Systems

---

## Overview

The Industrialist adds a job board terminal at the New Atlantis spaceport where players can browse and bid on bulk material supply contracts posted by in-universe companies. Orders require delivering large quantities of resources — raw minerals, organics, and manufactured components — within a deadline. The system is designed to make outpost building and supply chain management feel economically meaningful rather than optional.

**Core loop:**
1. Browse the job board for open RFPs (Request for Proposals)
2. Bid on a contract — lowball for better odds, high bid for more credits
3. Fulfill the order by delivering the required items to the dropoff terminal before the deadline
4. Earn credits and reputation; build rep to access higher-tier contracts

---

## Features

- **565 hand-balanced contracts** across 5 tiers, spanning 100 resources and 49 in-universe companies
- **Bidding system** with three bid options (Lowball / Fair Offer / High Bid) affecting both win probability and payout
- **Reputation system** — a global score that gates access to higher tiers and modifies bid win chances. Early delivery and cheap bids earn bonus rep
- **Urgency modifier** — contracts randomly roll as Normal, Tight (65% deadline, 125% pay), or Rush (40% deadline, 150% pay)
- **Deadline enforcement** — missed contracts apply reputation penalties
- **Quest journal integration** — active contracts tracked in the journal with quantity progress

---

## Tier Structure

| Tier | TCV Range | Representative Jobs |
|---|---|---|
| 1 | 375 – 3,000 | Small quantities of common minerals and organics |
| 2 | 3,100 – 7,000 | Mid-volume rares, basic manufactured components |
| 3 | 7,450 – 24,300 | Large volumes of exotics, complex components |
| 4 | 25,000 – 93,750 | Industrial-scale orders, rare manufactured goods |
| 5 | 112,500 – 438,750 | Endgame quantities, unique manufactured items |

Tier access is gated by reputation. New players can bid on Tier 1-2 freely; Tier 3 requires Rep 50, Tier 4 requires Rep 150, Tier 5 requires Rep 300.

---

## Reputation System

| Event | Rep Change |
|---|---|
| Tier 1 complete | +2 (up to +3 with early bonus) |
| Tier 2 complete | +5 (up to +7) |
| Tier 3 complete | +10 (up to +15) |
| Tier 4 complete | +20 (up to +30) |
| Tier 5 complete | +35 (up to +52) |
| Tier 1 fail | -1 |
| Tier 2 fail | -3 |
| Tier 3 fail | -8 |
| Tier 4 fail | -20 |
| Tier 5 fail | -40 |

Lowball bid adds +1 rep on completion; High bid subtracts -1. Early delivery adds a linear bonus up to 50% of the flat award (instant delivery = max bonus, at-wire delivery = no bonus).

---

## Drop Off

**v1: Single terminal at New Atlantis spaceport.** All contracts regardless of company deliver here. The procurement hub fiction is that companies route deliveries through a central exchange rather than staffing individual outposts.

---

## File Structure

```
Scripts/Source/
    IME_MainQuestScript.psc      — Core brain: slot management, bidding, fulfillment, rep
    IME_DataInit.psc             — Static job pool arrays (565 jobs, 49 companies); generated from rfp_master_list.csv
    IME_ContractQuestScript.psc  — Per-contract quest: deadline monitoring, journal objectives
    IME_ExchangeTerminalScript.psc — Job board terminal logic and display
    IME_DropoffTerminalScript.psc  — Delivery terminal: inventory check, item removal, fulfillment

Data/
    rfp_master_list.csv          — Source of truth for all 565 job definitions
    the_industrialist_mod_v2.xlsx — Spreadsheet: companies, resources, industry assignments
    rfp.py                       — Python script that generated rfp_master_list.csv from spreadsheet data
```

---

## Installation (Development)

1. Open Starfield Creation Kit
2. Create a new plugin: `TheIndustrialist.esm`
3. Create CK records per the wiring checklist below
4. Compile all `.psc` files via CK script compiler
5. Test via console: `StartQuest IME_MainQuest`

---

## CK Wiring Checklist

### Global Variables (create as Float/Int globals)
- `IME_Reputation` — Int, initial value 0
- `IME_LastRefreshTime` — Float, initial value 0.0
- `IME_BidResultGlobal` — Int
- `IME_DropoffResultGlobal` — Int
- `IME_SlotVisible_00` through `IME_SlotVisible_10` — Int × 11
- `IME_SlotAwarded_00` through `IME_SlotAwarded_10` — Int × 11
- `IME_SlotUrgency_00` through `IME_SlotUrgency_10` — Int × 11
- `IME_SlotTier_00` through `IME_SlotTier_10` — Int × 11
- `IME_SlotHours_00` through `IME_SlotHours_10` — Int × 11
- `IME_Local_Visible_0` through `IME_Local_Visible_3` — Int × 4

### Quests
- **`IME_MainQuest`** — Start game enabled, runs always. Attach `IME_MainQuestScript`. Wire `DataInit` property to this same quest (attach `IME_DataInit` as a second script). Wire `IME_ContractQuests[]` array to the 8 contract quests below
- **`IME_Contract_01` through `IME_Contract_08`** — Each gets `IME_ContractQuestScript`. Wire `MainScript` property back to `IME_MainQuest`. Set up stages: 0 (dormant), 10 (active with objective), 100 (complete), 200 (failed). Objective text: "Deliver [qty] [resource] to [company], New Atlantis"

### Terminals
- **`IME_ExchangeTerminal`** — Place at New Atlantis spaceport. Attach `IME_ExchangeTerminalScript`. Wire `MainScript`, all slot global arrays, `IME_BidResultGlobal`
- **`IME_DropoffTerminal`** — Place at New Atlantis spaceport (procurement office interior). Attach `IME_DropoffTerminalScript`. Set `SettlementIndex = 0`. Wire `MainScript`, `IME_DropoffResultGlobal`, all `IME_Local_*` display properties, and all 100 `IME_Item_*` MiscObject properties to their base game Form IDs

### Terminal Menu Structure (Exchange Terminal)
```
[Main Menu]
├── Browse Open Orders
│   ├── [Slot 0 — condition: IME_SlotVisible_00 == 1]
│   │   └── View Details
│   │       ├── Lowball Bid   → script fragment: BidOnSelectedSlot(0)
│   │       ├── Fair Offer    → script fragment: BidOnSelectedSlot(1)
│   │       └── High Bid      → script fragment: BidOnSelectedSlot(2)
│   ├── [Slot 1..10 — same pattern]
├── Active Contracts          → reads IME_Active_* properties
└── Contractor Status         → reads IME_Display_Rep, IME_Display_TierUnlock
```

### Item Form Properties (IME_DropoffTerminalScript)
Wire all 100 `IME_Item_*` MiscObject properties to their base game Form IDs in the CK. The property names map to resource names — e.g. `IME_Item_Aluminum`, `IME_Item_VytiniumFuelRod`. A missing wire will produce a `Debug.Trace` warning in the Papyrus log rather than a silent failure.

---

## Debugging

Set `IME_DebugLogging = True` on `IME_MainQuestScript` (default). All significant events log to:
```
%USERPROFILE%\Documents\My Games\Starfield\Logs\Script\Papyrus.0.log
```

Filter for `[IME]` prefix. Key events logged: slot population, bid rolls, fulfillment, failures, rep changes.

Set `IME_DebugLogging = False` before release build.
