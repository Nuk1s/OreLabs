# Economy Standard

## Purpose

Universal economy rules for OreLabs.

## Rules

### Sequential Ownership

```
Own(E_{i-1}) AND S ≥ S_i AND Coins ≥ P_i
```

Must own previous equipment tier, meet strength requirement, and have enough coins.

### Area Kit Rule

```
Access(Area_{i+1}) = Own(E_i) AND Own(B_i)
```

Must own BOTH equipment AND backpack to access next area.

### Stable Pricing

Equipment and backpack prices are calculated once and never change.

### Discrete Backpack Simulation

```
Trips = ceil(max(0, Price - CoinsHeld) / (Capacity × Value))
```

Income is calculated per full backpack trip, not continuously.

### Progression Philosophy

- Strength is progression (never spent)
- Coins are fluid (earns and spends)
- Both required for upgrades
- No obsolete upgrades

### Pricing Philosophy

- Prices derived from income formulas
- Equipment prices scale with income
- Backpack prices are stable
- No arbitrary prices

### Scaling Philosophy

- World N takes 1.5x longer than World N-1
- Future worlds re-derive prices from income
- No manual price multiplication

### Balance Targets

- P50 World 1 completion: 110.92 minutes
- Equipment-first vs backpack-first: 0.6 min difference
- Mine time must be ≤ 2.2 seconds

## Related Documents

- [Economy-Formula.md](Economy-Formula.md)
- [World1-Economy.md](World1-Economy.md)
- [Balance-Rules.md](Balance-Rules.md)