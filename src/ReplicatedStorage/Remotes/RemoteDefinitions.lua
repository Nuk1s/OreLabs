---
id: RemoteDefinitions
title: RemoteDefinitions
status: Active
version: 1.0
owner: OreLabs
category: Networking
depends_on: []
last_updated: 2026-07-09
---

--[[
    RemoteDefinitions
    
    Purpose:
    Defines all RemoteEvents and RemoteFunctions used by the game.
    
    Responsibility:
    - Centralize remote definitions
    - Provide remote lookup API
    - Organize remotes by responsibility
    - Prevent duplicate remote creation
    
    Note:
    Every Remote should have one responsibility.
    RemoteEvents for one-way communication.
    RemoteFunctions only when immediate response is required.
--]]

local RemoteDefinitions = {}

RemoteDefinitions.Events = {
    -- Strength System
    "TrainStrength",
    
    -- Mining System
    "MineOre",
    
    -- Economy System
    "BuyItem",
    "SellItem",
    
    -- Pet System
    "OpenEgg",
    "EquipPet",
    "UnequipPet",
    
    -- Quest System
    "StartQuest",
    "CompleteQuest",
    
    -- AFK System
    "StartAutoTrain",
    "StopAutoTrain",
    
    -- World System
    "TeleportWorld",
    
    -- Forge System
    "CraftItem",
    
    -- UI Events
    "UpdateHUD",
    "ShowNotification",
    "OpenMenu",
    "CloseMenu",
}

RemoteDefinitions.Functions = {
    -- Data Queries
    "GetPlayerData",
    "GetConfig",
    
    -- UI Queries
    "GetInventory",
    "GetPetTeam",
    "GetQuestProgress",
}

return RemoteDefinitions