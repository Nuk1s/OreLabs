# Economy System

## Purpose

Currency and pricing.

## Architecture

- **EconomyService** — Server currency logic
- **GameConfig.Equipment** — Equipment prices
- **GameConfig.Backpacks** — Backpack prices
- **GameConfig.Ores** — Ore values

## Currency Types

- **Coins** — Primary, earned by selling ores
- **Gems** — Future secondary currency

## Best Practices

- All prices from GameConfig
- Server validates purchases
- Never trust client currency

## Related Documents

- [Economy Design](../GAME-SYSTEMS/OL-GMS-001 Economy Design.md)
- [Balance Authority](../GAME-SYSTEMS/OL-GMS-002 Balance Authority.md)