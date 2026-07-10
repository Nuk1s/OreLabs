---
id: MiningService
title: MiningService
status: Active
version: 1.0
owner: OreLabs
category: Service
depends_on:
  - DataService
  - PlayerService
  - StrengthService
  - EconomyService
  - WorldService
last_updated: 2026-07-09
---

--[[
    MiningService
    
    Purpose:
    Manages mining behaviour and ore tracking.
    Does NOT own persistent mining data — statistics live in the profile.
    
    Behaviour only:
    - Register/unregister active ores (runtime only)
    - Track current mining target (runtime only)
    - Ore interaction logic
--]]

local MiningService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

local activeOres = {}

function MiningService:Initialize()
end

function MiningService:Start()
end

function MiningService:Cleanup()
    activeOres = {}
end

function MiningService:RegisterOre(oreId, oreData)
    activeOres[oreId] = oreData
end

function MiningService:UnregisterOre(oreId)
    activeOres[oreId] = nil
end

function MiningService:GetOre(oreId)
    return activeOres[oreId]
end

function MiningService:SetMiningTarget(player, oreId)
    if not DataService:IsProfileReady(player) then return false end
    DataService:SetValue(player, "Runtime.MiningTarget", oreId)
    return true
end

function MiningService:GetMiningTarget(player)
    if not DataService:IsProfileReady(player) then return nil end
    return DataService:GetValue(player, "Runtime.MiningTarget")
end

return MiningService