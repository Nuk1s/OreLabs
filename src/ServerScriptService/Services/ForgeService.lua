--[[
    ForgeService
    
    Purpose:
    Manages forge behaviour and crafting logic.
    Does NOT own forge storage — blueprints and materials live in the profile.
    
    Behaviour only:
    - Learn blueprints
    - Add materials
    - Check crafting requirements
--]]

local ForgeService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

local FORGE_PATH = "Data.Forge"

function ForgeService:Initialize()
end

function ForgeService:Start()
end

function ForgeService:Cleanup()
end

function ForgeService:GetBlueprints(player)
    if not DataService:IsProfileReady(player) then return {} end
    local forge = DataService:GetValue(player, FORGE_PATH)
    if not forge then return {} end
    return forge.Blueprints or {}
end

function ForgeService:LearnBlueprint(player, blueprintId)
    if not DataService:IsProfileReady(player) then return false end
    local forge = DataService:GetValue(player, FORGE_PATH)
    if not forge then return false end
    forge.Blueprints[blueprintId] = true
    return true
end

function ForgeService:GetMaterials(player)
    if not DataService:IsProfileReady(player) then return {} end
    local forge = DataService:GetValue(player, FORGE_PATH)
    if not forge then return {} end
    return forge.Materials or {}
end

function ForgeService:AddMaterial(player, materialId, quantity)
    if not DataService:IsProfileReady(player) then return false end
    if quantity <= 0 then return false end
    local forge = DataService:GetValue(player, FORGE_PATH)
    if not forge then return false end
    forge.Materials[materialId] = (forge.Materials[materialId] or 0) + quantity
    return true
end

return ForgeService