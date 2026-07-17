# Mining System

## Purpose

Ore mining with cooperative mechanics.

## Architecture

- **MiningService** — Server mining logic
- **MiningHandler** — Tool.Activated events
- **GameConfig.Ores** — Ore definitions
- **Profile.Data.StoredOres** — Inventory

## Milestone Rewards

- 33% — First reward
- 66% — Second reward
- 100% — Final reward

## Best Practices

- Use Tool.Activated for mining
- Server calculates damage
- Cooperative mining for multiplayer
- Respawn timer for ores

## Related Documents

- [Backpack-System](Backpack-System.md)
- [Economy-System](Economy-System.md)