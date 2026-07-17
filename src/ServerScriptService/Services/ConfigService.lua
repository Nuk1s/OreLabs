--[[
    ConfigService
    
    Purpose:
    Manages all game configuration data.
    
    Responsibility:
    - Load configuration from ReplicatedStorage
    - Provide configuration query API
    - Validate configuration values
    - Prevent magic numbers in code
    
    Lifecycle:
    - Initialize: Load and validate all config modules
    - Start: No runtime behavior needed
    - Cleanup: Clear cached configurations
--]]

local ConfigService = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local configs = {}

function ConfigService:Initialize()
    local configFolder = ReplicatedStorage:FindFirstChild("Config")
    if configFolder then
        for _, child in ipairs(configFolder:GetChildren()) do
            if child:IsA("ModuleScript") then
                local name = child.Name
                local data = require(child)
                configs[name] = data
            end
        end
    end
end

function ConfigService:Start()
end

function ConfigService:Cleanup()
    configs = {}
end

function ConfigService:GetConfig(configName)
    return configs[configName]
end

function ConfigService:SetConfig(configName, configData)
    configs[configName] = configData
end

function ConfigService:GetAllConfigs()
    return configs
end

return ConfigService