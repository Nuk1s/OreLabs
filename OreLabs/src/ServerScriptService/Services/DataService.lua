---
id: DataService
title: DataService
status: Active
version: 1.0
owner: OreLabs
category: Service
depends_on:
  - ConfigService
last_updated: 2026-07-09
---

--[[
    DataService
    
    Purpose:
    Owns all runtime player profiles and provides the internal API
    for all profile access. No other service touches profile data directly.
    
    Responsibility:
    - Create runtime profiles from template
    - Validate profile structure on creation
    - Provide safe internal API for data access
    - Release profiles on player leave
    
    Internal API:
    - GetSection(player, section)
    - UpdateSection(player, section, callback)
    - GetValue(player, path)
    - SetValue(player, path, value)
    - IncrementValue(player, path, amount)
    - DecrementValue(player, path, amount)
--]]

local DataService = {}

local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")

local ProfileTemplate = require(ServerScriptService.Core.ProfileTemplate)
local InternalEvents = require(ServerScriptService.Core.InternalEvents)

local profiles = {}

local function navigateToPath(profile, path)
    local parts = string.split(path, ".")
    local current = profile

    for _, part in ipairs(parts) do
        if current == nil or type(current) ~= "table" then
            return nil, nil, nil
        end
        if current[part] == nil then
            return nil, nil, nil
        end
        current = current[part]
    end

    local parent = profile
    for i = 1, #parts - 1 do
        parent = parent[parts[i]]
    end

    return current, parent, parts[#parts]
end

function DataService:Initialize()
end

function DataService:Start()
    Players.PlayerRemoving:Connect(function(player)
        self:ReleaseProfile(player)
    end)

    game:BindToClose(function()
        for player, _ in pairs(profiles) do
            pcall(function()
                self:ReleaseProfile(player)
            end)
        end
    end)
end

function DataService:Cleanup()
    for player, _ in pairs(profiles) do
        pcall(function()
            self:ReleaseProfile(player)
        end)
    end
    profiles = {}
end

function DataService:CreateProfile(player)
    if profiles[player] then
        return profiles[player]
    end

    local profile = ProfileTemplate.Create(player)
    local validated = self:ValidateProfile(profile)

    profiles[player] = validated
    validated.Session.Ready = true

    InternalEvents:Fire("ProfileCreated", player, validated)

    return validated
end

function DataService:ValidateProfile(profile)
    local required = ProfileTemplate.GetRequiredFields()

    for _, fieldPath in ipairs(required) do
        local parts = string.split(fieldPath, ".")
        local current = profile

        for _, part in ipairs(parts) do
            if current == nil or type(current) ~= "table" then
                current = nil
                break
            end
            current = current[part]
        end

        if current == nil then
            local repaired = ProfileTemplate.Create(profile.Player)
            local base = repaired
            for j = 1, #parts - 1 do
                base = base[parts[j]]
            end
            profile[parts[1]] = repaired[parts[1]]
            break
        end
    end

    if type(profile.ProfileId) ~= "number" then
        profile.ProfileId = 0
    end

    if type(profile.Session) ~= "table" then
        profile.Session = { CreatedAt = os.time(), LastSeen = os.time(), Ready = false }
    end

    if type(profile.Data) ~= "table" then
        profile.Data = ProfileTemplate.Create(profile.Player).Data
    end

    if type(profile.Runtime) ~= "table" then
        profile.Runtime = ProfileTemplate.Create(profile.Player).Runtime
    end

    return profile
end

function DataService:GetProfile(player)
    return profiles[player]
end

function DataService:HasProfile(player)
    return profiles[player] ~= nil
end

function DataService:IsProfileReady(player)
    local profile = profiles[player]
    if not profile then return false end
    return profile.Session.Ready == true
end

function DataService:ReleaseProfile(player)
    local profile = profiles[player]
    if not profile then return end

    profile.Session.Ready = false
    profiles[player] = nil

    InternalEvents:Fire("ProfileReleased", player)
end

function DataService:GetProfiles()
    return profiles
end

function DataService:MarkReady(player)
    local profile = profiles[player]
    if not profile then return end

    profile.Session.Ready = true
    profile.Session.LastSeen = os.time()

    InternalEvents:Fire("ProfileReady", player, profile)
end

-- Internal API: Safe profile access methods

function DataService:GetSection(player, section)
    local profile = profiles[player]
    if not profile then return nil end
    return profile[section]
end

function DataService:UpdateSection(player, section, callback)
    local profile = profiles[player]
    if not profile then return false end
    if not profile[section] then return false end
    callback(profile[section])
    return true
end

function DataService:GetValue(player, path)
    local profile = profiles[player]
    if not profile then return nil end
    local value = navigateToPath(profile, path)
    return value
end

function DataService:SetValue(player, path, value)
    local profile = profiles[player]
    if not profile then return false end
    local _, parent, key = navigateToPath(profile, path)
    if parent == nil or key == nil then return false end
    parent[key] = value
    return true
end

function DataService:IncrementValue(player, path, amount)
    local current = self:GetValue(player, path)
    if type(current) ~= "number" then return false end
    return self:SetValue(player, path, current + amount)
end

function DataService:DecrementValue(player, path, amount)
    local current = self:GetValue(player, path)
    if type(current) ~= "number" then return false end
    if current < amount then return false end
    return self:SetValue(player, path, current - amount)
end

return DataService