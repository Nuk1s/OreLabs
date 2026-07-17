# Equipment System

## Purpose

Equipment ownership, purchasing, equipping.

## Architecture

- **EquipmentService** — Server equipment logic
- **EquipmentHandler** — ProximityPrompt NPC
- **ToolManager** — Creates Tools
- **GameConfig.Equipment** — Definitions

## Rules

- Sequential ownership required
- Dual-gate: strength + coins
- Auto-equip on purchase
- Profile stores ownership

## Related Documents

- [Economy-System](Economy-System.md)
- [Tool-Template](../TEMPLATES/Tool-Template.md)