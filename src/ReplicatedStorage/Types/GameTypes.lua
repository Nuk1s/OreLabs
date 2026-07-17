--[[
    GameTypes
    
    Purpose:
    Contains all type definitions for the game.
    
    Responsibility:
    - Define data structures
    - Define type interfaces
    - Document expected shapes
    - Provide type safety documentation
    
    Note:
    Types are documentation-only in Lua.
    They help developers understand expected data shapes.
--]]

local GameTypes = {}

--[[
    PlayerProfile
    The root structure for all player data.
    
    PlayerProfile = {
        Core = CoreData,
        Progression = ProgressionData,
        Economy = EconomyData,
        Inventory = InventoryData,
        Equipment = EquipmentData,
        Pets = PetData,
        Worlds = WorldData,
        Statistics = StatisticsData,
        Settings = SettingsData,
        Unlocks = UnlocksData,
        AFK = AFKData,
        Future = FutureData,
    }
--]]

--[[
    CoreData = {
        UserId: number,
        Username: string,
        JoinDate: number,
        LastLogin: number,
        PlayTime: number,
    }
--]]

--[[
    EconomyData = {
        Coins: number,
        Gems: number,
        TotalCoinsEarned: number,
        TotalGemsEarned: number,
    }
--]]

--[[
    InventoryData = {
        Resources: {[string]: number},
        Pets: {PetData},
        Capacity: number,
        MaxCapacity: number,
    }
--]]

--[[
    PetData = {
        Id: string,
        Type: string,
        Rarity: string,
        Level: number,
        Equipped: boolean,
        Stats: PetStats,
    }
--]]

--[[
    WorldData = {
        CurrentWorld: string,
        UnlockedWorlds: {string},
        WorldProgress: {[string]: number},
    }
--]]

return GameTypes