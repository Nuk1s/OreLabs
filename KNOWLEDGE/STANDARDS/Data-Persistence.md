# Data Persistence

## Purpose

How player data is stored.

## Architecture

- **DataService** — Profile owner
- **ProfileTemplate** — Default structure
- **InternalEvents** — Lifecycle events

## Profile Structure

```lua
Profile = {
    ProfileId,
    Player,
    Session = { CreatedAt, LastSeen, Ready },
    Data = { Strength, Equipment, Backpack, ... },
    Runtime = { CurrentOre, MiningTarget, ... }
}
```

## Internal API

- `GetData(player)` — Get profile
- `IsProfileReady(player)` — Check readiness
- `GetValue(player, path)` — Get by path
- `SetValue(player, path, value)` — Set by path

## Rules

- Only DataService touches profiles
- Always check IsProfileReady first
- Separate Data from Runtime

## Related Documents

- [Architecture](../CORE/Architecture.md)
- [Service-Lifecycle](Service-Lifecycle.md)