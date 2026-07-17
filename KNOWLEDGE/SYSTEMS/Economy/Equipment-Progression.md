# Equipment Progression

## Purpose

Equipment tiers, prices, and requirements.

## Equipment Table

| Tier | Name | Strength | Coins | Strength/action | Strength/min |
|------|------|----------|-------|-----------------|--------------|
| 1 | Starter | 0 | Free | 1 | 30 |
| 2 | Tier 2 | 120 | 150 | 2 | 60 |
| 3 | Tier 3 | 420 | 300 | 3 | 90 |
| 4 | Tier 4 | 960 | 700 | 5 | 150 |
| 5 | Tier 5 | 2,010 | 1,300 | 8 | 240 |
| 6 | Tier 6 | 3,930 | 2,600 | 13 | 390 |
| 7 | Tier 7 | 7,440 | 4,800 | 21 | 630 |

## Pricing Formula

```
P_{i+1} = round_50(CPM(C_{i+1}, V_i) * q_i)
```

Where q = [3, 4, 5, 6, 7, 8] minutes

## Rules

- Sequential ownership required
- Dual-gate: strength AND coins
- Auto-equip on purchase
- Prices are stable (never change)

## Related Documents

- [Economy-Formula.md](Economy-Formula.md)
- [Backpack-Progression.md](Backpack-Progression.md)