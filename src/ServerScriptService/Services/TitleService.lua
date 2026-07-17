--[[
    TitleService
    
    Purpose:
    Manages title behaviour and equip logic.
    Does NOT own title storage — unlocks and active title live in the profile.
    
    Behaviour only:
    - Unlock/equip titles
    - Query active title
--]]

local TitleService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

local TITLES_PATH = "Data.Titles"

function TitleService:Initialize()
end

function TitleService:Start()
end

function TitleService:Cleanup()
end

function TitleService:GetUnlockedTitles(player)
    if not DataService:IsProfileReady(player) then return {} end
    local titles = DataService:GetValue(player, TITLES_PATH)
    if not titles then return {} end
    return titles.Unlocked or {}
end

function TitleService:UnlockTitle(player, titleId)
    if not DataService:IsProfileReady(player) then return false end
    local titles = DataService:GetValue(player, TITLES_PATH)
    if not titles then return false end
    titles.Unlocked[titleId] = true
    return true
end

function TitleService:EquipTitle(player, titleId)
    if not DataService:IsProfileReady(player) then return false end
    local titles = DataService:GetValue(player, TITLES_PATH)
    if not titles then return false end
    if not titles.Unlocked[titleId] then return false end
    titles.Active = titleId
    return true
end

function TitleService:GetActiveTitle(player)
    if not DataService:IsProfileReady(player) then return nil end
    local titles = DataService:GetValue(player, TITLES_PATH)
    if not titles then return nil end
    return titles.Active
end

return TitleService