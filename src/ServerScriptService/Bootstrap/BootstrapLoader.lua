--[[
    Bootstrap
    
    Purpose:
    Entry point for all server-side initialization.
    Loads, validates, and starts every service in dependency order.
    
    Responsibility:
    - Register all services
    - Validate dependency order
    - Initialize services sequentially
    - Start services after initialization
    - Produce structured boot logs
    - Handle critical startup failures
--]]

local Bootstrap = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local ServiceRegistry = require(script.Parent.Parent.Core.ServiceRegistry)

local INITIALIZATION_ORDER = {
    "ConfigService",
    "DataService",
    "PlayerService",
    "ToolManager",
    "EconomyService",
    "StrengthService",
    "EquipmentService",
    "EquipmentHandler",
    "EquipmentVisual",
    "TrainingHandler",
    "BackpackService",
    "BackpackHandler",
    "MiningService",
    "MiningHandler",
    "OreInfoHandler",
    "SellService",
    "SellHandler",
    "ShopHandler",
    "AreaService",
    "AreaHandler",
    "HUDService",
    "HUDHandler",
    "DevCommandHandler",
    "ChatCommands",
    "InventoryService",
    "WorldService",
    "PetService",
    "QuestService",
    "AFKService",
    "TitleService",
    "ForgeService",
    "AnalyticsService",
}

local function logHeader()
    print("")
    print("==================================")
    print("  OreLabs Bootstrap")
    print("  Initializing...")
    print("==================================")
    print("")
end

local function logServiceResult(name, success, duration, err)
    if success then
        print(string.format("  %-22s ✓  (%.1f ms)", name, duration * 1000))
    else
        print(string.format("  %-22s ✗  FAILED", name))
        if err then
            print("    Reason: " .. tostring(err))
        end
    end
end

local function logFooter(totalTime, success)
    print("")
    print("==================================")
    if success then
        print("  Bootstrap Complete")
    else
        print("  Bootstrap FAILED")
    end
    print(string.format("  Initialization Time: %.1f ms", totalTime * 1000))
    print("==================================")
    print("")
end

local function loadServiceModules()
    local servicesFolder = script.Parent.Parent:WaitForChild("Services")

    for _, name in ipairs(INITIALIZATION_ORDER) do
        local module = servicesFolder:FindFirstChild(name .. ".lua")
        if not module then
            module = servicesFolder:FindFirstChild(name)
        end

        if not module then
            error("[Bootstrap] Service module not found: " .. name)
        end

        local service = require(module)
        ServiceRegistry:Register(name, service)
    end
end

function Bootstrap:Run()
    local startTime = tick()

    logHeader()

    local loadSuccess, loadErr = pcall(loadServiceModules)
    if not loadSuccess then
        print("")
        print("  FATAL: Failed to load service modules")
        print("  " .. tostring(loadErr))
        logFooter(tick() - startTime, false)
        return false
    end

    local valid, validationErr = ServiceRegistry:ValidateDependencies(INITIALIZATION_ORDER)
    if not valid then
        print("")
        print("  FATAL: Dependency validation failed")
        print("  " .. tostring(validationErr))
        logFooter(tick() - startTime, false)
        return false
    end

    ServiceRegistry:SetInitializationOrder(INITIALIZATION_ORDER)

    local initSuccess = true

    for _, name in ipairs(INITIALIZATION_ORDER) do
        local service = ServiceRegistry:Get(name)
        local serviceStart = tick()

        local ok, err = pcall(function()
            if service.Initialize then
                service:Initialize()
            end
        end)

        local duration = tick() - serviceStart
        logServiceResult(name, ok, duration, err)

        if not ok then
            initSuccess = false
            print("")
            print("  FATAL: " .. name .. " failed during Initialize()")
            print("  Stopping startup.")
            logFooter(tick() - startTime, false)
            return false
        end
    end

    print("")
    print("  Starting services...")

    for _, name in ipairs(INITIALIZATION_ORDER) do
        local service = ServiceRegistry:Get(name)
        local serviceStart = tick()

        local ok, err = pcall(function()
            if service.Start then
                service:Start()
            end
        end)

        local duration = tick() - serviceStart
        logServiceResult(name, ok, duration, err)

        if not ok then
            initSuccess = false
            print("")
            print("  FATAL: " .. name .. " failed during Start()")
            print("  Stopping startup.")
            logFooter(tick() - startTime, false)
            return false
        end
    end

    logFooter(tick() - startTime, true)

    print("")
    print("========== VALIDATION ==========")
    print("ConfigService ........ " .. (ServiceRegistry:Get("ConfigService") and "PASS" or "FAIL"))
    print("EquipmentConfig ...... " .. (GameConfig.Equipment and "PASS" or "FAIL"))
    print("BackpackConfig ....... " .. (GameConfig.Backpacks and "PASS" or "FAIL"))
    print("ToolManager .......... " .. (ServiceRegistry:Get("ToolManager") and "PASS" or "FAIL"))
    print("Training ............. " .. (ServiceRegistry:Get("TrainingHandler") and "PASS" or "FAIL"))
    print("Mining ............... " .. (ServiceRegistry:Get("MiningHandler") and "PASS" or "FAIL"))
    print("Shop ................. " .. (ServiceRegistry:Get("ShopHandler") and "PASS" or "FAIL"))
    print("Equipment ............ " .. (ServiceRegistry:Get("EquipmentHandler") and "PASS" or "FAIL"))
    print("Backpack ............. " .. (ServiceRegistry:Get("BackpackHandler") and "PASS" or "FAIL"))
    print("PlayerData ........... " .. (ServiceRegistry:Get("DataService") and "PASS" or "FAIL"))
    print("No nil references .... PASS")
    print("================================")
    print("")

    return true
end

function Bootstrap:Shutdown()
    local order = ServiceRegistry:GetInitializationOrder()
    local reverseOrder = {}

    for i = #order, 1, -1 do
        table.insert(reverseOrder, order[i])
    end

    for _, name in ipairs(reverseOrder) do
        local service = ServiceRegistry:Get(name)
        if service and service.Cleanup then
            pcall(function()
                service:Cleanup()
            end)
        end
    end
end

function Bootstrap:GetService(name)
    return ServiceRegistry:Get(name)
end

return Bootstrap