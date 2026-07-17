--[[
    DevPanel
    
    Purpose:
    Studio-only debug panel for testing.
    Provides instant access to all gameplay values.
--]]

local DevPanel = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = nil
local isOpen = false

function DevPanel:Initialize()
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DevPanel"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(0, 100, 0, 30)
    toggleButton.Position = UDim2.new(1, -110, 0, 10)
    toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Text = "DEV PANEL"
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 12
    toggleButton.Parent = screenGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 200, 0, 400)
    mainFrame.Position = UDim2.new(1, -210, 0, 50)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mainFrame.BackgroundTransparency = 0.1
    mainFrame.Visible = false
    mainFrame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = mainFrame

    local scroll = Instance.new("ScrollingFrame")
    scroll.Name = "ScrollFrame"
    scroll.Size = UDim2.new(1, -10, 1, -10)
    scroll.Position = UDim2.new(0, 5, 0, 5)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 4
    scroll.Parent = mainFrame

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 3)
    layout.Parent = scroll

    local function createButton(text, order, callback)
        local btn = Instance.new("TextButton")
        btn.Name = "Btn" .. order
        btn.Size = UDim2.new(1, 0, 0, 25)
        btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.Text = text
        btn.Font = Enum.Font.Gotham
        btn.TextSize = 11
        btn.LayoutOrder = order
        btn.Parent = scroll
        btn.MouseButton1Click:Connect(callback)
        return btn
    end

    local remoteFolder = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events")

    createButton("+100 Strength", 1, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("strength", 100)
    end)

    createButton("+1000 Strength", 2, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("strength", 1000)
    end)

    createButton("+100 Coins", 3, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("coins", 100)
    end)

    createButton("+1000 Coins", 4, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("coins", 1000)
    end)

    createButton("+10000 Coins", 5, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("coins", 10000)
    end)

    createButton("Clear Backpack", 6, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("clearbackpack")
    end)

    createButton("Fill Backpack", 7, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("fillbackpack")
    end)

    createButton("Respawn Ores", 8, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("respawnores")
    end)

    createButton("Unlock All Areas", 9, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("unlockall")
    end)

    createButton("Give Best Equipment", 10, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("bestequipment")
    end)

    createButton("Give Best Backpack", 11, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("bestbackpack")
    end)

    createButton("Reset Progress", 12, function()
        remoteFolder:WaitForChild("DevCommand"):FireServer("resetprogress")
    end)

    toggleButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        mainFrame.Visible = isOpen
    end)
end

function DevPanel:Start()
end

function DevPanel:Cleanup()
    if screenGui then
        screenGui:Destroy()
        screenGui = nil
    end
end

return DevPanel