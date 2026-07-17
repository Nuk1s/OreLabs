--[[
    ShopUI
    
    Purpose:
    Client-side shop interface.
    Simple frame-based shop for testing.
--]]

local ShopUI = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local GameConfig = require(ReplicatedStorage.Config.GameConfig)

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = nil
local currentShop = nil

function ShopUI:Initialize()
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ShopUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
end

function ShopUI:Start()
end

function ShopUI:Cleanup()
    if screenGui then
        screenGui:Destroy()
        screenGui = nil
    end
end

function ShopUI:OpenEquipmentShop()
    self:CloseShop()

    local frame = Instance.new("Frame")
    frame.Name = "ShopFrame"
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Text = "Equipment Shop"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.Parent = frame
    closeBtn.MouseButton1Click:Connect(function()
        self:CloseShop()
    end)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -20, 1, -50)
    scroll.Position = UDim2.new(0, 10, 0, 45)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4
    scroll.Parent = frame

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = scroll

    local buyEquipEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("BuyEquipment")

    local order = 0
    for id, data in pairs(GameConfig.Equipment) do
        order = order + 1
        local itemFrame = Instance.new("Frame")
        itemFrame.Size = UDim2.new(1, 0, 0, 50)
        itemFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        itemFrame.LayoutOrder = order
        itemFrame.Parent = scroll

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(0.6, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 10, 0, 5)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.Text = data.Name .. " (Tier " .. data.Tier .. ")"
        nameLabel.Font = Enum.Font.Gotham
        nameLabel.TextSize = 12
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Parent = itemFrame

        local statsLabel = Instance.new("TextLabel")
        statsLabel.Size = UDim2.new(0.6, 0, 0.5, 0)
        statsLabel.Position = UDim2.new(0, 10, 0.5, 0)
        statsLabel.BackgroundTransparency = 1
        statsLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        statsLabel.Text = "Str: " .. data.RequiredStrength .. " | Coins: " .. data.PurchasePrice
        statsLabel.Font = Enum.Font.Gotham
        statsLabel.TextSize = 10
        statsLabel.TextXAlignment = Enum.TextXAlignment.Left
        statsLabel.Parent = itemFrame

        local buyBtn = Instance.new("TextButton")
        buyBtn.Size = UDim2.new(0, 70, 0, 30)
        buyBtn.Position = UDim2.new(1, -80, 0.5, -15)
        buyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        buyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        buyBtn.Text = "Buy"
        buyBtn.Font = Enum.Font.GothamBold
        buyBtn.TextSize = 12
        buyBtn.Parent = itemFrame

        buyBtn.MouseButton1Click:Connect(function()
            buyEquipEvent:FireServer(id)
        end)
    end

    scroll.CanvasSize = UDim2.new(0, 0, 0, order * 55)
    currentShop = frame
end

function ShopUI:OpenBackpackShop()
    self:CloseShop()

    local frame = Instance.new("Frame")
    frame.Name = "ShopFrame"
    frame.Size = UDim2.new(0, 300, 0, 400)
    frame.Position = UDim2.new(0.5, -150, 0.5, -200)
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Text = "Backpack Shop"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -35, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.Parent = frame
    closeBtn.MouseButton1Click:Connect(function()
        self:CloseShop()
    end)

    local scroll = Instance.new("ScrollingFrame")
    scroll.Size = UDim2.new(1, -20, 1, -50)
    scroll.Position = UDim2.new(0, 10, 0, 45)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4
    scroll.Parent = frame

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = scroll

    local buyBpEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("BuyBackpack")

    local order = 0
    for id, data in pairs(GameConfig.Backpacks) do
        order = order + 1
        local itemFrame = Instance.new("Frame")
        itemFrame.Size = UDim2.new(1, 0, 0, 50)
        itemFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        itemFrame.LayoutOrder = order
        itemFrame.Parent = scroll

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(0.6, 0, 0.5, 0)
        nameLabel.Position = UDim2.new(0, 10, 0, 5)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        nameLabel.Text = data.Name .. " (Tier " .. data.Tier .. ")"
        nameLabel.Font = Enum.Font.Gotham
        nameLabel.TextSize = 12
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Parent = itemFrame

        local statsLabel = Instance.new("TextLabel")
        statsLabel.Size = UDim2.new(0.6, 0, 0.5, 0)
        statsLabel.Position = UDim2.new(0, 10, 0.5, 0)
        statsLabel.BackgroundTransparency = 1
        statsLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        statsLabel.Text = "Capacity: " .. data.Capacity .. " | Coins: " .. data.PurchasePrice
        statsLabel.Font = Enum.Font.Gotham
        statsLabel.TextSize = 10
        statsLabel.TextXAlignment = Enum.TextXAlignment.Left
        statsLabel.Parent = itemFrame

        local buyBtn = Instance.new("TextButton")
        buyBtn.Size = UDim2.new(0, 70, 0, 30)
        buyBtn.Position = UDim2.new(1, -80, 0.5, -15)
        buyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        buyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        buyBtn.Text = "Buy"
        buyBtn.Font = Enum.Font.GothamBold
        buyBtn.TextSize = 12
        buyBtn.Parent = itemFrame

        buyBtn.MouseButton1Click:Connect(function()
            buyBpEvent:FireServer(id)
        end)
    end

    scroll.CanvasSize = UDim2.new(0, 0, 0, order * 55)
    currentShop = frame
end

function ShopUI:CloseShop()
    if currentShop then
        currentShop:Destroy()
        currentShop = nil
    end
end

function ShopUI:ShowMessage(text, color)
    local msg = Instance.new("TextLabel")
    msg.Size = UDim2.new(0, 300, 0, 40)
    msg.Position = UDim2.new(0.5, -150, 0.8, 0)
    msg.BackgroundColor3 = color or Color3.fromRGB(40, 40, 40)
    msg.TextColor3 = Color3.fromRGB(255, 255, 255)
    msg.Text = text
    msg.Font = Enum.Font.GothamBold
    msg.TextSize = 14
    msg.Parent = screenGui

    game:GetService("Debris"):AddItem(msg, 2)
end

return ShopUI