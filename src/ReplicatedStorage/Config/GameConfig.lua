---
id: GameConfig
title: GameConfig
status: Active
version: 1.0
owner: OreLabs
category: Config
depends_on: []
last_updated: 2026-07-09
---

--[[
    GameConfig
    
    Purpose:
    Contains all game configuration values.
    
    Responsibility:
    - Define game balance values
    - Define system settings
    - Define feature flags
    - Prevent magic numbers in code
    
    Note:
    Configuration belongs in Config modules.
    Logic should consume data, not define it.
--]]

local GameConfig = {}

GameConfig.Version = "0.1.0"

GameConfig.Game = {
    MaxPlayers = 12,
    AutoSaveInterval = 120,
    DataVersion = 1,
}

GameConfig.Strength = {
    BaseTrainingReward = 1,
    TrainingCooldown = 0.5,
    MaxMultiplier = 100,
}

GameConfig.Mining = {
    BaseOreHealth = 10,
    RespawnTime = 5,
    MiningRange = 10,
    BaseDamage = 1,
}

GameConfig.Economy = {
    StartingCoins = 0,
    StartingGems = 0,
    MaxCoins = 999999999,
    MaxGems = 999999,
}

GameConfig.Pets = {
    MaxTeamSize = 5,
    MaxInventorySize = 100,
    EggCooldown = 1,
}

GameConfig.Worlds = {
    World1 = { requiredStrength = 0 },
    World2 = { requiredStrength = 1000 },
    World3 = { requiredStrength = 10000 },
    World4 = { requiredStrength = 100000 },
    World5 = { requiredStrength = 1000000 },
}

return GameConfig