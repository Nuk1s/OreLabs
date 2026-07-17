# Balance Rules

## Purpose

Balancing methodology and rules.

## Balancing Equation

For any upgrade, verify:

```
Minutes to earn Coins ≈ Minutes to gain Strength
```

If Coins are earned faster than Strength, the coin price is too low.

If Strength is gained faster than Coins, the strength requirement is too high.

## Live-Play Tuning Rules

After 500–1,000 World 1 clears:

- If P50 completion < 90 min: increase q_i by 0.5 for later tiers
- If P50 completion > 120 min: reduce later q_i by 0.5
- If new ore mined < 60% of time: increase ore sell value by 5%

## Multiplier Constraints

```
0.9 ≤ M_Coins / M_Strength ≤ 1.1
```

No World 1 pet, rebirth, or premium multiplier should disproportionately affect Coins or Strength.

## Mine Time Risk

| Mine Time | Expected Clear |
|-----------|----------------|
| 1.8 sec | 105.15 min |
| 2.0 sec | 110.92 min |
| 2.2 sec | 116.68 min |
| 2.4 sec | 122.44 min |

P50 ore mine time must remain ≤ 2.2 seconds.

## Related Documents

- [Economy-Formula.md](Economy-Formula.md)
- [Progression-Timeline.md](Progression-Timeline.md)