# Handler Template

## Template

```lua
--[[
    [HandlerName]
    
    Purpose:
    Handles [interaction type] via [mechanism].
--]]

local [HandlerName] = {}

local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local [ServiceName] = require(ServerScriptService.Services.[ServiceName])

local remoteEvent = nil
local connection = nil

function [HandlerName]:Initialize()
    remoteEvent = Instance.new("RemoteEvent")
    remoteEvent.Name = "[RemoteName]"
    remoteEvent.Parent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")
end

function [HandlerName]:Start()
    connection = remoteEvent.OnServerEvent:Connect(function(player, ...)
        -- Validate and delegate
    end)
end

function [HandlerName]:Cleanup()
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

return [HandlerName]
```

## Related Documents

- [Networking-Rules](../STANDARDS/Networking-Rules.md)
- [Service-Template](Service-Template.md)