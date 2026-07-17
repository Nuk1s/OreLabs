--[[
    RemoteDefinitions
    
    Purpose:
    Defines all RemoteEvents used by the game.
    
    Note:
    Training and Mining now use Tool.Activated.
    Only shop and utility remotes remain.
--]]

local RemoteDefinitions = {}

RemoteDefinitions.Events = {
    -- Shop System
    "BuyEquipment",
    "BuyBackpack",
    "SellOres",
    
    -- HUD System
    "UpdateHUD",
    
    -- Area System
    "EnterArea",
    
    -- Ore Info
    "GetOreInfo",
    
    -- Dev Commands
    "DevCommand",
}

return RemoteDefinitions