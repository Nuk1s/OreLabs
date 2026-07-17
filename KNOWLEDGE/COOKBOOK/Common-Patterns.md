# Common Patterns

## Purpose

Frequently used engineering patterns.

## 1. Profile Access

```lua
if not DataService:IsProfileReady(player) then
    return nil
end
return DataService:GetValue(player, "Data.Section")
```

## 2. Tool.Activated

```lua
tool.Activated:Connect(function()
    -- Server-side logic
end)
```

## 3. ProximityPrompt

```lua
prompt.Triggered:Connect(function(player)
    -- Server-side logic
end)
```

## 4. Cooldown

```lua
local lastTime = {}
local COOLDOWN = 0.5

local now = tick()
if now - (lastTime[player] or 0) < COOLDOWN then
    return false
end
lastTime[player] = now
```

## Related Documents

- [Anti-Patterns](Anti-Patterns.md)
- [Service-Template](../TEMPLATES/Service-Template.md)