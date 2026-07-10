---
id: ServerEntry
title: ServerEntry
status: Active
version: 1.0
owner: OreLabs
category: Core
depends_on: []
last_updated: 2026-07-09
---

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

local Bootstrap = require(ServerScriptService.Bootstrap.Bootstrap)

local success = Bootstrap:Run()

if not success then
    warn("[ServerEntry] Bootstrap failed. Server startup aborted.")
end

game:BindToClose(function()
    Bootstrap:Shutdown()
end)