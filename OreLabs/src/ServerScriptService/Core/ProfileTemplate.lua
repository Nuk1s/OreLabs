---
id: ProfileTemplate
title: ProfileTemplate
status: Active
version: 1.0
owner: OreLabs
category: Core
depends_on: []
last_updated: 2026-07-09
---

--[[
    ProfileTemplate
    
    Purpose:
    Defines the default runtime profile structure.
    Every new profile is built from this template.
    
    Responsibility:
    - Provide default profile shape
    - Ensure all required fields exist
    - Make profile migrations straightforward
--]]

local ProfileTemplate = {}

function ProfileTemplate.Create(player)
    local now = os.time()

    return {
        ProfileId = player.UserId,
        Player = player,
        Session = {
            CreatedAt = now,
            LastSeen = now,
            Ready = false,
        },

        Data = {
            Strength = 0,

            Economy = {
                Coins = 0,
                Gems = 0,
                TotalCoinsEarned = 0,
                TotalGemsEarned = 0,
            },

            Inventory = {
                Resources = {},
                Pickaxes = {},
                Backpacks = {},
            },

            Pets = {
                Collection = {},
                Teams = {},
                AutoDelete = false,
            },

            Titles = {
                Unlocked = {},
                Active = nil,
            },

            World = {
                CurrentWorld = "World1",
                UnlockedWorlds = { "World1" },
                WorldProgress = {},
            },

            Rebirths = {
                Count = 0,
                Multiplier = 1,
            },

            Settings = {
                Music = true,
                Sounds = true,
                Notifications = true,
            },

            Statistics = {
                TotalPlayTime = 0,
                TotalOresMined = 0,
                TotalEggsOpened = 0,
                TotalQuestsCompleted = 0,
                JoinCount = 0,
            },

            QuestProgress = {},

            Forge = {
                Blueprints = {},
                Materials = {},
                CraftedItems = {},
            },

            AFK = {
                Active = false,
                Type = nil,
                StartTime = nil,
            },

            Unlocks = {},

            Future = {},
        },

        Runtime = {
            CurrentOre = nil,
            CurrentNPC = nil,
            MiningTarget = nil,
            TemporaryBuffs = {},
            ActiveAnimations = {},
            InteractionState = nil,
            DebugFlags = {},
        },
    }
end

function ProfileTemplate.GetRequiredFields()
    return {
        "ProfileId",
        "Player",
        "Session",
        "Session.CreatedAt",
        "Session.LastSeen",
        "Session.Ready",
        "Data",
        "Data.Strength",
        "Data.Economy",
        "Data.Economy.Coins",
        "Data.Economy.Gems",
        "Data.Inventory",
        "Data.Inventory.Resources",
        "Data.Pets",
        "Data.Pets.Collection",
        "Data.Pets.Teams",
        "Data.Titles",
        "Data.Titles.Unlocked",
        "Data.World",
        "Data.World.CurrentWorld",
        "Data.World.UnlockedWorlds",
        "Data.Rebirths",
        "Data.Rebirths.Count",
        "Data.Settings",
        "Data.Statistics",
        "Data.QuestProgress",
        "Data.Forge",
        "Data.AFK",
        "Data.Unlocks",
        "Data.Future",
    }
end

return ProfileTemplate