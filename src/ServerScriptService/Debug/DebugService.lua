---
id: DebugService
title: DebugService
status: Active
version: 1.0
owner: OreLabs
category: Debug
depends_on: []
last_updated: 2026-07-09
---

--[[
    DebugService
    
    Purpose:
    Manages debug tools and development utilities.
    
    Lifecycle:
    - Initialize: Prepare debug state
    - Start: No runtime behavior needed
    - Cleanup: Clear debug state
--]]

local DebugService = {}

local enabled = false

function DebugService:Initialize()
end

function DebugService:Start()
end

function DebugService:Cleanup()
    enabled = false
end

function DebugService:SetEnabled(state)
    enabled = state
end

function DebugService:IsEnabled()
    return enabled
end

function DebugService:Log(message, level)
    if not enabled then return end
    level = level or "INFO"
    print(string.format("[DEBUG][%s] %s", level, message))
end

return DebugService