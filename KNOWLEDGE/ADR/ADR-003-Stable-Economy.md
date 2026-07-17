# ADR-003: Stable Economy

## Decision

Use stable pricing with discrete backpack-trip simulation.

## Reasoning

- Prices calculated once, never change
- Prevents backpack-skip strategy
- Simplifies balancing
- Player retains choice without dominant strategy

## Alternatives

- Dynamic pricing (rejected: complex, unpredictable)
- Continuous income model (rejected: allows exploitation)

## Trade-offs

- Less responsive to balance issues
- Requires careful initial calibration
- Future worlds need price re-derivation

## Status

Approved

## Date

2026-07-18

## Future Review

After 500–1,000 World 1 clears

## Related Documents

- [Economy-Standard.md](../STANDARDS/Economy-Standard.md)
- [Balance-Rules.md](../SYSTEMS/Economy/Balance-Rules.md)