--[[
    ServerEntry
    
    Purpose:
    The single entry point for all server-side code.
    Required by Roblox to execute server scripts.
    
    Responsibility:
    - Require and run Bootstrap
    - Handle server shutdown
--]]

local ServerScriptService = game:GetService("ServerScriptService")

local Bootstrap = require(ServerScriptService.Bootstrap.BootstrapLoader)

local success = Bootstrap:Run()

if not success then
    warn("[ServerEntry] Bootstrap failed. Server startup aborted.")
end

game:BindToClose(function()
    Bootstrap:Shutdown()
end)