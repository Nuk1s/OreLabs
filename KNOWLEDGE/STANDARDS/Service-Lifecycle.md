# Service Lifecycle

## Purpose

How services work in OreLabs.

## Lifecycle

```lua
local Service = {}

function Service:Initialize()
    -- Load dependencies, prepare state
end

function Service:Start()
    -- Begin runtime, connect events
end

function Service:Cleanup()
    -- Disconnect events, release resources
end

return Service
```

## Bootstrap Order

Services initialize in dependency order:
1. ConfigService
2. DataService
3. PlayerService
4. (remaining services...)

## Rules

- Every service must have Initialize/Start/Cleanup
- Initialize: load dependencies
- Start: connect events
- Cleanup: disconnect events

## Related Documents

- [Module-Standards](../CORE/Module-Standards.md)
- [Service-Template](../TEMPLATES/Service-Template.md)