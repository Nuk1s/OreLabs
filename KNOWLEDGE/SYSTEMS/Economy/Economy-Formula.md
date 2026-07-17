# Economy Formula

## Purpose

Mathematical formulas for the economy.

## Strength Formulas

### Strength Per Minute

```
SPM_i = (60 * g_i) / 2
```

Where g_i is the strength gain per action:
- g_1 = 1
- g_2 = 2
- g_i = g_{i-1} + g_{i-2} (Fibonacci)

### Strength Requirements

```
S_i = S_{i-1} + SPM_{i-1} * T^S_i
```

Where T^S = [4, 5, 6, 7, 8, 9] minutes

## Equipment Pricing

```
P_{i+1} = round_50(CPM(C_{i+1}, V_i) * q_i)
```

Where q = [3, 4, 5, 6, 7, 8] minutes

## Backpack Pricing (Stable)

```
B_{i+1} = 2 * C_i * V_i
```

## Discrete Balance

```
Trips = ceil(max(0, Price - CoinsHeld) / (Capacity * Value))
```

## Related Documents

- [Equipment-Progression.md](Equipment-Progression.md)
- [Backpack-Progression.md](Backpack-Progression.md)
- [Balance-Rules.md](Balance-Rules.md)