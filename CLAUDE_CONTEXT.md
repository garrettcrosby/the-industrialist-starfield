# Claude Code Context — The Industrialist Mod

This document provides full architectural context for continued development of The Industrialist Mod for Starfield. It was generated from an extended design session and should be read before making any edits to the Papyrus scripts.

---

## Project Status

All five core Papyrus scripts are written and architecturally consistent. The next phase is:
1. CK record creation and property wiring (see README wiring checklist)
2. Terminal menu construction in the CK
3. In-game testing and debug iteration
4. Script polish based on testing

---

## Architecture Summary

### The Static Job Pool Pattern

The central architectural decision is that all job data is **statically pre-generated** rather than computed at runtime. `IME_DataInit.psc` contains 565 hand-balanced `JobTemplate` structs across 5 tier arrays. At game start, `IME_MainQuestScript.OnInit()` calls `DataInit.InitAll()` which populates these arrays. The board refresh then picks random jobs from these pools.

**Why static:** Papyrus is slow for complex computation; the finite resource set (~100 farmable items) made the job space small enough to enumerate; and static data allows manual balancing of every individual job in the source CSV before code generation.

**The only runtime variance is the urgency modifier** — each job slot rolls Normal (60%), Tight (30%), or Rush (10%) which multiplies the pre-baked deadline and price.

### Script Dependency Graph

```
IME_DataInit
    └── populates arrays on → IME_MainQuestScript (job pools, company data)

IME_MainQuestScript
    ├── drives → IME_ContractQuestScript × 8 (one per active contract slot)
    ├── called by → IME_ExchangeTerminalScript (bid resolution, refresh)
    └── called by → IME_DropoffTerminalScript (fulfillment, failure)

IME_ExchangeTerminalScript
    └── reads display state from → IME_MainQuestScript.IME_Slots[]

IME_DropoffTerminalScript
    └── calls FulfillContract() on → IME_MainQuestScript
```

### Key Data Structures

**`JobTemplate` struct** (defined in `IME_MainQuestScript`, used by `IME_DataInit`):
```papyrus
String  resourceName    ; e.g. "Aluminum"
String  companyName     ; e.g. "Argos Extractors"
Int     companyIndex    ; 0-48, index into IME_CompanyNames[]
Int     quantity        ; pre-balanced order quantity
Int     baseValue       ; per-unit credit value from base game
Int     deadlineHours   ; base hours (before urgency modifier)
String  rarity          ; "Common" / "Uncommon" / "Rare" / "Exotic" / "Unique"
```

**`ActiveOrder` struct** (defined in `IME_MainQuestScript`):
Active board slots. Array of 11 (`IME_MaxSlots`). Each slot is either empty, open (visible on board), or awarded (active contract). Key fields:
- `isActive` + `isAwarded` together determine slot state
- `fairPrice` = qty × baseValue × urgencyPriceMult (computed at populate time)
- `awardedPrice` = fairPrice × bidMultiplier (set at bid time)
- `deadlineGameTime` = absolute game time float (not hours)

### Company Index

49 companies, **alphabetically indexed 0-48**. This is the canonical order used across all scripts. The full list is in `IME_DataInit.InitCompanyData()`. Key ones:
- `[4]` Arc Might, `[5]` Argos Extractors, `[7]` Axion Energy
- `[9]` Celtcorp, `[22]` Generdyne Industries, `[27]` Laredo
- `[36]` Reliant Medical, `[37]` Ryujin, `[43]` Stroud Eklund
- `[44]` Taiyo Astroneering, `[46]` Vanguard

All settlement indices are `0` (New Atlantis) in v1. The settlement field is retained in the struct for future multi-city support.

### Tier System

| Tier | Jobs | TCV Range | Rep Gate |
|------|------|-----------|----------|
| 1 | 128 | 375–3,000 | -100 (open) |
| 2 | 128 | 3,100–7,000 | 0 |
| 3 | 128 | 7,450–24,300 | 50 |
| 4 | 128 | 25,000–93,750 | 150 |
| 5 | 53 | 112,500–438,750 | 300 |

Tier is used for: rep award/penalty calculation, win probability gate multiplier, and slot distribution on the board.

### Board Slot Distribution

Each 24-hour refresh generates:
- T1: 3-4 slots (random)
- T2: 2-3 slots (random)
- T3: 1-2 slots (random)
- T4: 1 slot
- T5: 0-1 slots (30% chance)

Total: 8-11 slots. Awarded (active) slots are never overwritten on refresh — they persist until completed or failed.

### Bid System

Three bid types per contract:
- **Lowball (0):** 0.75× fair price payout, 70% base win chance, +1 rep on complete
- **Fair (1):** 1.0× payout, 45% base win chance, +0 rep mod
- **High (2):** 1.30× payout, 20% base win chance, -1 rep mod

Win chance formula:
```
finalChance = baseChance × repMultiplier × tierGate
repMultiplier = 1.0 + (rep / 500)   ; 0 rep = 1.0x, max rep = 2.0x
tierGate = 1.0 / 0.8 / 0.5 / 0.25 / 0.1 for tiers 1-5
caps: [0.02, 0.95]
```

### Reputation Formula

On completion:
```
total = flatTierBonus + earlyBonus + bidMod
earlyBonus = earlyFraction × (flatBonus × 0.5)
earlyFraction = timeRemaining / totalWindow  (0.0 at wire, 1.0 if instant)
floor: total minimum 1
```

### Urgency System

Rolled at slot population time:
- **Normal (60%):** 1.0× deadline, 1.0× price
- **Tight (30%):** 0.65× deadline, 1.25× price
- **Rush (10%):** 0.40× deadline, 1.50× price

The urgency label `[RUSH]` / `[TIGHT]` is prepended to the terminal listing entry. This is the only source of runtime variance in the system — everything else is pre-baked.

---

## Script-by-Script Notes

### IME_MainQuestScript.psc

The brain. ~788 lines. Key functions to know:

- **`OnInit()`** — calls `DataInit.InitAll()`, then `InitSettlementNames()`, `InitSlots()`, sets globals, calls `PopulateSlots()`, starts timer
- **`PopulateSlots()`** — clears non-awarded slots, rolls slot counts per tier, calls `FillTierSlots()` for each
- **`PopulateSingleSlot(tier, slotIdx)`** — picks random job from tier pool via `GetJobFromPool()`, rolls urgency, computes fair price and deadline, writes to `IME_Slots[slotIdx]`
- **`BidOnSlot(slotIdx, bidType)`** — probability roll, activates contract quest on win
- **`FulfillContract(slotIdx, playerRef)`** — called by dropoff terminal after item removal; pays out, applies rep, completes quest
- **`FailContract(slotIdx)`** — rep penalty, fails quest, clears slot
- **`CheckDeadlines()`** — called every game time tick; scans awarded slots for expired deadlines
- **`IMELog(msg)`** — gated debug trace; toggle via `IME_DebugLogging` property

**Properties that must be wired in CK:**
- `DataInit` → IME_MainQuest (second script)
- `IME_Reputation` → global variable
- `IME_LastRefreshTime` → global variable
- `IME_ContractQuests[]` → array of 8 quest references

### IME_DataInit.psc

~5,869 lines, auto-generated. Do not hand-edit — regenerate from `rfp_master_list.csv` using `rfp.py` if jobs need changing.

Entry point: `InitAll()` → calls `InitCompanyData()` + `InitTier1Jobs()` through `InitTier5Jobs()`.

Each job entry sets 7 fields on a `JobTemplate` struct. The comment above each entry shows: company, product, quantity, TCV, and deadline hours — useful for spotting outliers during balancing.

**To regenerate after CSV changes:** Run the Python generation script against `rfp_master_list.csv`. The generator produces `IME_DataInit.psc` directly. The old `IME_CompanyLookup.psc` and old `IME_DataInit.psc` are fully obsolete and should be removed from the project.

### IME_ContractQuestScript.psc

Lightweight. One instance per contract quest (8 total). Key points:
- `InitContract(slotIdx)` caches all display values from the main script's slot data at activation time
- `RegisterForUpdateGameTime(1.0)` drives per-hour deadline checking
- `AddDelivery(amount)` is called by the dropoff terminal to increment progress — returns `True` when fully delivered
- `SlotIndex == -1` means dormant; used by main script to find the right quest for a given slot

Quest stages to configure in CK: 0 (dormant), 10 (active), 100 (complete), 200 (failed).

### IME_ExchangeTerminalScript.psc

Attached to the job board terminal. On `OnActivate`:
1. Calls `MainScript.RefreshIfReady()`
2. Calls `UpdateAllDisplayProperties()` which iterates all 11 slots and writes display strings/globals

The terminal menu reads these properties via CK conditions and text substitution. The flow for a bid:
1. Player navigates to a slot → `SelectSlot(idx)` called via script fragment
2. Player picks bid type → `BidOnSelectedSlot(bidType)` called via script fragment
3. Script calls `MainScript.BidOnSlot()`, writes result to `IME_BidResultGlobal`
4. Terminal branches to win or lose result page based on global value

**Important:** `IME_Display_FairPriceLow/High` shows 85-115% of fair price (not exact) to preserve bid tension.

### IME_DropoffTerminalScript.psc

One script, one terminal placement (New Atlantis), `SettlementIndex = 0`.

On `OnActivate`:
1. Resets `IME_DropoffResultGlobal = 0`
2. Calls `FindLocalContracts()` — scans awarded slots for `settlementIndex == 0`
3. Calls `UpdateLocalDisplay()` — writes up to 4 active contracts to display properties

On `AttemptFulfill()`:
1. Deadline check first — if expired, calls `MainScript.FailContract()`, sets result 4
2. Calls `GetItemFormForResource(resName)` — 100-entry If/ElseIf chain mapping name to wired `MiscObject` property
3. Checks `player.GetItemCount(itemForm) >= required`
4. Removes items, calls `contractScript.AddDelivery()`, calls `MainScript.FulfillContract()`

**The most common wiring failure:** `IME_Item_*` properties not wired in CK. This produces a `Debug.Trace` warning rather than a crash. Check the Papyrus log for `No item form found for` messages.

---

## Source Data Files

### rfp_master_list.csv

565 rows, 10 columns. This is the authoritative source for all job data. Columns:
```
Company, Product, Product Rarity, Industry, Order Quantity Tier,
Value, Order Quantity, TCV, Hours to Deliver, RFP Tier
```

**RFP Tier** is the final sort-based tier (1-5). **Order Quantity Tier** is a per-company scaling factor used in quantity calculation (1-5, reflects how much of something a company would plausibly want).

If you need to change job parameters, edit this CSV and regenerate `IME_DataInit.psc` from it.

### the_industrialist_mod_v2.xlsx

Contains sheets: `companies`, `summary`, `inorganic`, `organic`, `manufactured`, `rfps`. The summary sheet has balance stats (companies per industry, resources per industry, tier distribution). Resource sheets have industry assignments that drove the original job pool generation.

### rfp.py

The Python script used to generate the raw job list from the spreadsheet CSVs. Its `reconciler()` function matches resources to companies via industry tag overlap. The `update_values()` function computes quantities, TCV, and deadlines from the raw list plus the quantity tier matrix.

---

## Known Issues / Future Work

**v1 limitations to address in v2:**
- Single drop-off location (New Atlantis only) — multi-city routing was designed but deferred
- No partial delivery — contracts require full quantity in one visit
- Urgency is random — could be statically assigned per job for more intentional difficulty curves
- No MCM/settings menu for player difficulty tuning (deadline modifiers exist as script properties but aren't player-facing)

**Organic resources note:** Some organic resources come from non-domesticatable alien fauna (e.g. High-Tensile Spidroin from Aceles). These are intentionally included as high-value jobs that require hunting rather than outpost automation. This is a deliberate design decision, not an oversight.

**Quark-Degenerate Tissues:** Appears in the job pool (food industry, Unique rarity). Sourcing requires finding specific fauna. Intentionally kept for flavor — it's an extremely high-value exotic food ingredient.

---

## Papyrus Gotchas Relevant to This Project

- **Arrays max 128 elements** — all tier pools are within this limit (T5 has 53)
- **No array-of-arrays** — `GetJobFromPool()` uses an If/ElseIf chain to return from the correct tier array
- **Struct arrays require per-element assignment** — can't initialize inline; `IME_DataInit` uses explicit field assignment per entry
- **`RegisterForUpdateGameTime(n)`** takes in-game hours, not real time. `n = 1.0` = 1 in-game hour
- **Game time is in days as a Float** — convert to hours by multiplying by 24.0
- **`GlobalVariable.GetValue()`** returns Float — cast to Int with `as Int` when needed
- **Script casting** — `IME_ContractQuests[i] as IME_ContractQuestScript` can return None; always null-check
- **`Debug.Trace()`** is the only logging mechanism — prefix all traces with `[IME]` for easy grepping
