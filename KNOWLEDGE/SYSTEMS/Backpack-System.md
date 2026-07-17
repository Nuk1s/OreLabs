# Backpack System

## Purpose

Inventory capacity and ore storage.

## Architecture

- **BackpackService** — Server backpack logic
- **BackpackHandler** — ProximityPrompt NPC
- **GameConfig.Backpacks** — Definitions
- **Profile.Data.StoredOres** — Storage

## Rules

- Sequential ownership required
- Capacity stored in profile
- Ore count tracked separately
- Clear when selling

## Related Documents

- [Mining-System](Mining-System.md)
- [Economy-System](Economy-System.md)