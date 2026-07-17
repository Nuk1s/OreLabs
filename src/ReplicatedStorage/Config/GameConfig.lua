--[[
    GameConfig
    
    Purpose:
    Contains all game configuration values.
    Source of truth: OreLabs World 1 Economy v1.0 (Approved)
    
    Responsibility:
    - Define game balance values
    - Define system settings
    - Define feature flags
    - Prevent magic numbers in code
--]]

local GameConfig = {}

GameConfig.Version = "1.0.0"

GameConfig.Game = {
    MaxPlayers = 12,
    AutoSaveInterval = 120,
    DataVersion = 1,
}

GameConfig.Strength = {
    BaseTrainingReward = 1,
    TrainingCooldown = 0.5,
    MaxMultiplier = 100,
    DefaultEquipment = "StarterDumbbell",
    StrengthGains = {1, 2, 3, 5, 8, 13, 21},
}

GameConfig.Equipment = {
    StarterDumbbell = {
        Id = "StarterDumbbell",
        Name = "Starter Dumbbell",
        Category = "Strength",
        Tier = 1,
        StrengthReward = 1,
        Cooldown = 0.5,
        PurchasePrice = 0,
        RequiredStrength = 0,
        Icon = "rbxassetid://0",
        Model = "rbxassetid://0",
    },
    Tier2Dumbbell = {
        Id = "Tier2Dumbbell",
        Name = "Tier 2 Dumbbell",
        Category = "Strength",
        Tier = 2,
        StrengthReward = 2,
        Cooldown = 0.5,
        PurchasePrice = 150,
        RequiredStrength = 120,
        Icon = "rbxassetid://0",
        Model = "rbxassetid://0",
    },
    Tier3Dumbbell = {
        Id = "Tier3Dumbbell",
        Name = "Tier 3 Dumbbell",
        Category = "Strength",
        Tier = 3,
        StrengthReward = 3,
        Cooldown = 0.5,
        PurchasePrice = 300,
        RequiredStrength = 420,
        Icon = "rbxassetid://0",
        Model = "rbxassetid://0",
    },
    Tier4Dumbbell = {
        Id = "Tier4Dumbbell",
        Name = "Tier 4 Dumbbell",
        Category = "Strength",
        Tier = 4,
        StrengthReward = 5,
        Cooldown = 0.5,
        PurchasePrice = 700,
        RequiredStrength = 960,
        Icon = "rbxassetid://0",
        Model = "rbxassetid://0",
    },
    Tier5Dumbbell = {
        Id = "Tier5Dumbbell",
        Name = "Tier 5 Dumbbell",
        Category = "Strength",
        Tier = 5,
        StrengthReward = 8,
        Cooldown = 0.5,
        PurchasePrice = 1300,
        RequiredStrength = 2010,
        Icon = "rbxassetid://0",
        Model = "rbxassetid://0",
    },
    Tier6Dumbbell = {
        Id = "Tier6Dumbbell",
        Name = "Tier 6 Dumbbell",
        Category = "Strength",
        Tier = 6,
        StrengthReward = 13,
        Cooldown = 0.5,
        PurchasePrice = 2600,
        RequiredStrength = 3930,
        Icon = "rbxassetid://0",
        Model = "rbxassetid://0",
    },
    Tier7Dumbbell = {
        Id = "Tier7Dumbbell",
        Name = "Tier 7 Dumbbell",
        Category = "Strength",
        Tier = 7,
        StrengthReward = 21,
        Cooldown = 0.5,
        PurchasePrice = 4800,
        RequiredStrength = 7440,
        Icon = "rbxassetid://0",
        Model = "rbxassetid://0",
    },
}

GameConfig.Backpacks = {
    StarterBackpack = {
        Id = "StarterBackpack",
        Name = "Starter Backpack",
        Tier = 1,
        Capacity = 20,
        PurchasePrice = 0,
        RequiredStrength = 0,
        Icon = "rbxassetid://0",
    },
    Tier2Backpack = {
        Id = "Tier2Backpack",
        Name = "Tier 2 Backpack",
        Tier = 2,
        Capacity = 30,
        PurchasePrice = 80,
        RequiredStrength = 120,
        Icon = "rbxassetid://0",
    },
    Tier3Backpack = {
        Id = "Tier3Backpack",
        Name = "Tier 3 Backpack",
        Tier = 3,
        Capacity = 42,
        PurchasePrice = 180,
        RequiredStrength = 420,
        Icon = "rbxassetid://0",
    },
    Tier4Backpack = {
        Id = "Tier4Backpack",
        Name = "Tier 4 Backpack",
        Tier = 4,
        Capacity = 57,
        PurchasePrice = 420,
        RequiredStrength = 960,
        Icon = "rbxassetid://0",
    },
    Tier5Backpack = {
        Id = "Tier5Backpack",
        Name = "Tier 5 Backpack",
        Tier = 5,
        Capacity = 75,
        PurchasePrice = 912,
        RequiredStrength = 2010,
        Icon = "rbxassetid://0",
    },
    Tier6Backpack = {
        Id = "Tier6Backpack",
        Name = "Tier 6 Backpack",
        Tier = 6,
        Capacity = 96,
        PurchasePrice = 1950,
        RequiredStrength = 3930,
        Icon = "rbxassetid://0",
    },
    Tier7Backpack = {
        Id = "Tier7Backpack",
        Name = "Tier 7 Backpack",
        Tier = 7,
        Capacity = 120,
        PurchasePrice = 4032,
        RequiredStrength = 7440,
        Icon = "rbxassetid://0",
    },
}

GameConfig.Ores = {
    Stone = {
        Id = "Stone",
        Name = "Stone",
        HP = 16,
        Value = 2,
        Area = "Area1",
        Icon = "rbxassetid://0",
    },
    Coal = {
        Id = "Coal",
        Name = "Coal",
        HP = 24,
        Value = 3,
        Area = "Area2",
        Icon = "rbxassetid://0",
    },
    Copper = {
        Id = "Copper",
        Name = "Copper",
        HP = 36,
        Value = 5,
        Area = "Area3",
        Icon = "rbxassetid://0",
    },
    Iron = {
        Id = "Iron",
        Name = "Iron",
        HP = 56,
        Value = 8,
        Area = "Area4",
        Icon = "rbxassetid://0",
    },
    Gold = {
        Id = "Gold",
        Name = "Gold",
        HP = 84,
        Value = 13,
        Area = "Area5",
        Icon = "rbxassetid://0",
    },
    Crystal = {
        Id = "Crystal",
        Name = "Crystal",
        HP = 128,
        Value = 21,
        Area = "Area6",
        Icon = "rbxassetid://0",
    },
    Obsidian = {
        Id = "Obsidian",
        Name = "Obsidian",
        HP = 192,
        Value = 34,
        Area = "Area7",
        Icon = "rbxassetid://0",
    },
}

GameConfig.Areas = {
    Area1 = {
        Id = "Area1",
        Name = "Mining Plain",
        RequiredEquipmentTier = 1,
        RequiredBackpackTier = 1,
        Ores = { "Stone" },
    },
    Area2 = {
        Id = "Area2",
        Name = "Coal Valley",
        RequiredEquipmentTier = 2,
        RequiredBackpackTier = 2,
        Ores = { "Stone", "Coal" },
    },
    Area3 = {
        Id = "Area3",
        Name = "Copper Ridge",
        RequiredEquipmentTier = 3,
        RequiredBackpackTier = 3,
        Ores = { "Stone", "Coal", "Copper" },
    },
    Area4 = {
        Id = "Area4",
        Name = "Iron Mountain",
        RequiredEquipmentTier = 4,
        RequiredBackpackTier = 4,
        Ores = { "Stone", "Coal", "Copper", "Iron" },
    },
    Area5 = {
        Id = "Area5",
        Name = "Gold Peak",
        RequiredEquipmentTier = 5,
        RequiredBackpackTier = 5,
        Ores = { "Stone", "Coal", "Copper", "Iron", "Gold" },
    },
    Area6 = {
        Id = "Area6",
        Name = "Crystal Cavern",
        RequiredEquipmentTier = 6,
        RequiredBackpackTier = 6,
        Ores = { "Stone", "Coal", "Copper", "Iron", "Gold", "Crystal" },
    },
    Area7 = {
        Id = "Area7",
        Name = "Obsidian Depths",
        RequiredEquipmentTier = 7,
        RequiredBackpackTier = 7,
        Ores = { "Stone", "Coal", "Copper", "Iron", "Gold", "Crystal", "Obsidian" },
    },
}

GameConfig.Mining = {
    MiningRange = 10,
    BaseDamage = 4,
    RespawnTime = 5,
    DamageMultiplier = 1.5,
}

GameConfig.Economy = {
    StartingCoins = 0,
    StartingGems = 0,
    MaxCoins = 999999999,
    MaxGems = 999999,
}

GameConfig.Worlds = {
    World1 = { requiredStrength = 0 },
    World2 = { requiredStrength = 8500 },
    World3 = { requiredStrength = 50000 },
    World4 = { requiredStrength = 500000 },
    World5 = { requiredStrength = 5000000 },
}

return GameConfig