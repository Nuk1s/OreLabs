---
id: QuestService
title: QuestService
status: Active
version: 1.0
owner: OreLabs
category: Service
depends_on:
  - DataService
  - PlayerService
  - MiningService
  - StrengthService
  - EconomyService
last_updated: 2026-07-09
---

--[[
    QuestService
    
    Purpose:
    Manages quest behaviour and progression logic.
    Does NOT own quest persistence — quest data lives in the profile.
    
    Behaviour only:
    - Start/complete quests
    - Update quest progress
    - Check quest requirements
--]]

local QuestService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

local QUEST_PATH = "Data.QuestProgress"

function QuestService:Initialize()
end

function QuestService:Start()
end

function QuestService:Cleanup()
end

function QuestService:GetActiveQuests(player)
    if not DataService:IsProfileReady(player) then return {} end
    return DataService:GetValue(player, QUEST_PATH) or {}
end

function QuestService:StartQuest(player, questId)
    if not DataService:IsProfileReady(player) then return false end
    local quests = DataService:GetValue(player, QUEST_PATH)
    if not quests then return false end
    quests[questId] = { progress = 0, completed = false }
    return true
end

function QuestService:CompleteQuest(player, questId)
    if not DataService:IsProfileReady(player) then return false end
    local quests = DataService:GetValue(player, QUEST_PATH)
    if not quests or not quests[questId] then return false end
    quests[questId].completed = true
    return true
end

return QuestService