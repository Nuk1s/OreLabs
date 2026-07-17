# Service Template

## Template

```lua
--[[
    [ServiceName]
    
    Purpose:
    [What this service does]
    
    Behaviour only:
    - [Responsibility 1]
    - [Responsibility 2]
--]]

local [ServiceName] = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

function [ServiceName]:Initialize()
end

function [ServiceName]:Start()
end

function [ServiceName]:Cleanup()
end

function [ServiceName]:[PublicMethod](player, ...)
    if not DataService:IsProfileReady(player) then
        return false, "Profile not ready"
    end
    -- Implement logic
    return true, result
end

return [ServiceName]
```

## Related Documents

- [Service-Lifecycle](../STANDARDS/Service-Lifecycle.md)
- [Module-Standards](../CORE/Module-Standards.md)