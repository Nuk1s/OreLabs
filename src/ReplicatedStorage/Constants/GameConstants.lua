--[[
    GameConstants
    
    Purpose:
    Contains all game constants.
    
    Responsibility:
    - Define constant values
    - Define enum-like values
    - Define static identifiers
    - Prevent magic values in code
    
    Note:
    Constants use UPPER_SNAKE_CASE.
    Constants are immutable.
--]]

local GameConstants = {}

GameConstants.Currency = {
    Coins = "Coins",
    Gems = "Gems",
}

GameConstants.Inventory = {
    Resources = "Resources",
    Pets = "Pets",
    Equipment = "Equipment",
}

GameConstants.QuestStatus = {
    Active = "Active",
    Completed = "Completed",
    Failed = "Failed",
}

GameConstants.Worlds = {
    World1 = "World1",
    World2 = "World2",
    World3 = "World3",
    World4 = "World4",
    World5 = "World5",
}

GameConstants.PetRarity = {
    Common = "Common",
    Uncommon = "Uncommon",
    Rare = "Rare",
    Epic = "Epic",
    Legendary = "Legendary",
    Mythic = "Mythic",
}

GameConstants.NotificationType = {
    Info = "Info",
    Success = "Success",
    Warning = "Warning",
    Error = "Error",
}

return GameConstants