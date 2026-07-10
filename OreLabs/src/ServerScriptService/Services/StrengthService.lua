---
id: StrengthService
title: StrengthService
status: Active
version: 1.0
owner: OreLabs
category: Service
depends_on:
  - DataService
  - PlayerService
last_updated: 2026-07-09
---

--[[
    StrengthService
    
    Purpose:
    Manages strength progression logic.
    Does NOT own the Strength value — that lives in the profile.
    
    Behaviour only:
    - Add strength
    - Set strength
    - Query strength
--]]

local StrengthService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

local STRENGTH_PATH = "Data.Strength"

function StrengthService:Initialize()
end

function StrengthService:Start()
end

function StrengthService:Cleanup()
end

function StrengthService:GetStrength(player)
    if not DataService:IsProfileReady(player) then return 0 end
    return DataService:GetValue(player, STRENGTH_PATH) or 0
end

function StrengthService:AddStrength(player, amount)
    if not DataService:IsProfileReady(player) then return 0 end
    if amount <= 0 then return 0 end
    DataService:IncrementValue(player, STRENGTH_PATH, amount)
    return amount
end

function StrengthService:SetStrength(player, amount)
    if not DataService:IsProfileReady(player) then return false end
    if amount < 0 then return false end
    return DataService:SetValue(player, STRENGTH_PATH, amount)
end

return StrengthService