--[[
    PetService
    
    Purpose:
    Manages pet behaviour and team logic.
    Does NOT own pet storage — collection and teams live in the profile.
    
    Behaviour only:
    - Add/remove pets
    - Equip/unequip pets
    - Team capacity checks
--]]

local PetService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

local PETS_PATH = "Data.Pets"

function PetService:Initialize()
end

function PetService:Start()
end

function PetService:Cleanup()
end

function PetService:GetPetInventory(player)
    if not DataService:IsProfileReady(player) then return {} end
    local pets = DataService:GetValue(player, PETS_PATH)
    if not pets then return {} end
    return pets.Collection or {}
end

function PetService:AddPet(player, petData)
    if not DataService:IsProfileReady(player) then return false end
    local pets = DataService:GetValue(player, PETS_PATH)
    if not pets then return false end
    table.insert(pets.Collection, petData)
    return true
end

function PetService:RemovePet(player, petId)
    if not DataService:IsProfileReady(player) then return false end
    local pets = DataService:GetValue(player, PETS_PATH)
    if not pets then return false end

    for i, pet in ipairs(pets.Collection) do
        if pet.Id == petId then
            table.remove(pets.Collection, i)
            return true
        end
    end
    return false
end

function PetService:GetPetTeam(player)
    if not DataService:IsProfileReady(player) then return {} end
    local pets = DataService:GetValue(player, PETS_PATH)
    if not pets then return {} end
    return pets.Teams or {}
end

function PetService:EquipPet(player, petId)
    if not DataService:IsProfileReady(player) then return false end
    local pets = DataService:GetValue(player, PETS_PATH)
    if not pets then return false end
    if #pets.Teams >= 5 then return false end
    table.insert(pets.Teams, petId)
    return true
end

function PetService:UnequipPet(player, petId)
    if not DataService:IsProfileReady(player) then return false end
    local pets = DataService:GetValue(player, PETS_PATH)
    if not pets then return false end

    for i, id in ipairs(pets.Teams) do
        if id == petId then
            table.remove(pets.Teams, i)
            return true
        end
    end
    return false
end

return PetService