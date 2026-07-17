--[[
    TestWorldGenerator
    
    Purpose:
    Generates the temporary test world for gameplay validation.
    Creates placeholder parts for all gameplay zones.
--]]

local Workspace = game:GetService("Workspace")

local function createPart(name, position, size, color, parent)
    local part = Instance.new("Part")
    part.Name = name
    part.Size = size
    part.Position = position
    part.Anchored = true
    part.BrickColor = BrickColor.new(color)
    part.Parent = parent or Workspace
    return part
end

local function createLabel(name, position, text, parent)
    local part = createPart(name, position, Vector3.new(10, 4, 1), "Bright blue", parent)
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "Label"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = part
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.GothamBold
    textLabel.Text = text
    textLabel.Parent = billboard
    
    return part
end

local function createSpawnPlatform()
    local platform = createPart("SpawnPlatform", Vector3.new(0, 1, 0), Vector3.new(20, 2, 20), "Bright green")
    
    local spawn = Instance.new("SpawnLocation")
    spawn.Name = "Spawn"
    spawn.Size = Vector3.new(6, 1, 6)
    spawn.Position = Vector3.new(0, 2.5, 0)
    spawn.Anchored = true
    spawn.BrickColor = BrickColor.new("Bright yellow")
    spawn.Parent = platform
    
    return platform
end

local function createTrainingZone()
    local zone = createPart("TrainingZone", Vector3.new(0, 1, -30), Vector3.new(15, 2, 15), "Bright orange")
    createLabel("TrainingLabel", Vector3.new(0, 1, -30), "TRAINING ZONE", zone)
    
    local trainingPart = createPart("TrainingDumbbell", Vector3.new(0, 3, -30), Vector3.new(2, 2, 2), "Bright red", zone)
    
    return zone
end

local function createEquipmentShop()
    local zone = createPart("EquipmentShop", Vector3.new(30, 1, -30), Vector3.new(10, 2, 10), "Bright purple")
    createLabel("EquipShopLabel", Vector3.new(30, 1, -30), "EQUIPMENT SHOP", zone)
    
    local shopPart = createPart("ShopKeeper", Vector3.new(30, 3, -30), Vector3.new(2, 3, 2), "Bright yellow", zone)
    
    return zone
end

local function createBackpackShop()
    local zone = createPart("BackpackShop", Vector3.new(-30, 1, -30), Vector3.new(10, 2, 10), "Bright teal")
    createLabel("BpShopLabel", Vector3.new(-30, 1, -30), "BACKPACK SHOP", zone)
    
    local shopPart = createPart("ShopKeeper", Vector3.new(-30, 3, -30), Vector3.new(2, 3, 2), "Bright yellow", zone)
    
    return zone
end

local function createOreArea(name, position, color, oreName)
    local zone = createPart(name, position, Vector3.new(20, 2, 20), color)
    createLabel(name .. "Label", position, name:upper(), zone)
    
    for i = 1, 3 do
        local ore = createPart(oreName, position + Vector3.new(-6 + (i * 6), 3, 0), Vector3.new(3, 3, 3), "Dark stone grey", zone)
    end
    
    return zone
end

local function createSellZone()
    local zone = createPart("SellZone", Vector3.new(0, 1, 30), Vector3.new(10, 2, 10), "Bright yellow")
    createLabel("SellLabel", Vector3.new(0, 1, 30), "SELL ZONE", zone)
    
    local sellPart = createPart("SellPoint", Vector3.new(0, 3, 30), Vector3.new(2, 3, 2), "Bright red", zone)
    
    return zone
end

local function createAreaGate(name, position, requiredText)
    local gate = createPart(name, position, Vector3.new(8, 6, 2), "Really black")
    createLabel(name .. "Label", position, requiredText, gate)
    
    return gate
end

local function generateWorld()
    createSpawnPlatform()
    createTrainingZone()
    createEquipmentShop()
    createBackpackShop()
    
    createOreArea("StoneArea", Vector3.new(0, 1, -80), "Bright grey", "Stone")
    createAreaGate("Gate2", Vector3.new(0, 1, -60), "Need Tier 2 Equipment + Backpack")
    
    createOreArea("CoalArea", Vector3.new(0, 1, -130), "Dark grey", "Coal")
    createAreaGate("Gate3", Vector3.new(0, 1, -110), "Need Tier 3 Equipment + Backpack")
    
    createOreArea("CopperArea", Vector3.new(0, 1, -180), "Bright orange", "Copper")
    createAreaGate("Gate4", Vector3.new(0, 1, -160), "Need Tier 4 Equipment + Backpack")
    
    createOreArea("IronArea", Vector3.new(0, 1, -230), "Medium stone grey", "Iron")
    createAreaGate("Gate5", Vector3.new(0, 1, -210), "Need Tier 5 Equipment + Backpack")
    
    createOreArea("GoldArea", Vector3.new(0, 1, -280), "Bright yellow", "Gold")
    createAreaGate("Gate6", Vector3.new(0, 1, -260), "Need Tier 6 Equipment + Backpack")
    
    createOreArea("CrystalArea", Vector3.new(0, 1, -330), "Bright cyan", "Crystal")
    createAreaGate("Gate7", Vector3.new(0, 1, -310), "Need Tier 7 Equipment + Backpack")
    
    createOreArea("ObsidianArea", Vector3.new(0, 1, -380), "Really black", "Obsidian")
    
    createSellZone()
    
    print("[TestWorldGenerator] Test world generated")
end

generateWorld()