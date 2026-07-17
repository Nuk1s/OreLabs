# Networking Rules

## Purpose

Client/server communication rules.

## Core Rule

**Server is always authoritative.**

## Server Owns

- Strength, Coins, Gems
- Inventory, Pets, Mining
- Rewards, Rebirths
- World Progression, Save Data

## Client Owns

- Input, Camera, UI
- Animations, Effects, Sounds
- Temporary visual feedback

## Communication Flow

```
Player Input → Client → RemoteEvent → Server → Game Logic → Profile → Client
```

## Rules

- Server validates everything
- Never trust client data
- Use Tool.Activated for gameplay
- RemoteEvents for shop/utility

## Related Documents

- [Architecture](../CORE/Architecture.md)
- [Data-Persistence](Data-Persistence.md)