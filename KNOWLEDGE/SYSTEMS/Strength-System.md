# Strength System

## Purpose

Training mechanics and strength progression.

## Architecture

- **StrengthService** — Server training logic
- **TrainingHandler** — Tool.Activated events
- **GameConfig.Strength** — Balance values
- **Profile.Data.Strength** — Stored value

## Data Flow

```
Player activates Dumbbell
  → TrainingHandler receives event
  → StrengthService:Train() validates cooldown
  → Strength increases in profile
  → HUD updates
```

## Best Practices

- Use Tool.Activated for training
- Server validates all training
- Cooldown prevents spam
- Store strength in profile

## Related Documents

- [Equipment-System](Equipment-System.md)
- [Economy-System](Economy-System.md)
- [Data-Persistence](../STANDARDS/Data-Persistence.md)