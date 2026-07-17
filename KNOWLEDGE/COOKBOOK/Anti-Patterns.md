# Anti-Patterns

## Purpose

What NOT to do.

## Critical

### FireServer from Server
```lua
-- BAD
remote:FireServer()
-- GOOD
remote:FireClient(player, data)
```

### Client-Side Calculations
```lua
-- BAD
local damage = clientDamage
-- GOOD
local damage = ServerService:CalculateDamage(player)
```

### Direct Profile Access
```lua
-- BAD
profile.Data.Strength = 100
-- GOOD
DataService:SetValue(player, "Data.Strength", 100)
```

### Hardcoded Values
```lua
-- BAD
local price = 100
-- GOOD
local price = GameConfig.Equipment.IronDumbbell.PurchasePrice
```

### pcall to Hide Errors
```lua
-- BAD
pcall(function() doSomething() end)
-- GOOD
-- Fix the error instead
```

## Related Documents

- [Common-Patterns](Common-Patterns.md)
- [AI-Self-Review](AI-Self-Review.md)