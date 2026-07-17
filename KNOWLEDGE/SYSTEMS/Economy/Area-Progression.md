# Area Progression

## Purpose

Area gates, ore types, and requirements.

## Area Table

| Area | Ore | HP | Damage/hit | Sell Value | Full-bag Value | Net Coins/min |
|------|-----|-----|------------|------------|----------------|---------------|
| 1 | Stone | 16 | 4 | 2 | 40 | 46 |
| 2 | Coal | 24 | 6 | 3 | 90 | 75 |
| 3 | Copper | 36 | 9 | 5 | 210 | 131 |
| 4 | Iron | 56 | 14 | 8 | 456 | 217 |
| 5 | Gold | 84 | 21 | 13 | 975 | 361 |
| 6 | Crystal | 128 | 32 | 21 | 2,016 | 593 |
| 7 | Obsidian | 192 | 48 | 34 | 4,080 | 971 |

## Damage Formula

```
Damage_i ≈ roundFriendly(4 × 1.5^{i-1})
HP_i = 4 × Damage_i
```

## Area Kit Rule

```
Access(Area_{i+1}) = Own(E_i) AND Own(B_i)
```

Player must own BOTH equipment AND backpack tier to access next area.

## Related Documents

- [Economy-Formula.md](Economy-Formula.md)
- [Equipment-Progression.md](Equipment-Progression.md)
- [Backpack-Progression.md](Backpack-Progression.md)