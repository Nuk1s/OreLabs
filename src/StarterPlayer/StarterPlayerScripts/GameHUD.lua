--[[
    GameHUD
    
    Purpose:
    Client-side HUD display.
    Shows Strength, Coins, Equipment, Backpack, Area, Tool.
--]]

local GameHUD = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = nil
local labels = {}
local updateConnection = nil
local hudEvent = nil
local lastUpdate = 0
local UPDATE_INTERVAL = 0.5

function GameHUD:Initialize()
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "GameHUD"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Name = "HUDFrame"
    frame.Size = UDim2.new(0, 280, 0, 220)
    frame.Position = UDim2.new(0, 10, 0, 10)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = 0.3
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 10)
    padding.PaddingRight = UDim.new(0, 10)
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.Parent = frame

    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 5)
    layout.Parent = frame

    local function createLabel(name, order)
        local label = Instance.new("TextLabel")
        label.Name = name
        label.Size = UDim2.new(1, 0, 0, 25)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 14
        label.Font = Enum.Font.GothamMedium
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.LayoutOrder = order
        label.Parent = frame
        labels[name] = label
        return label
    end

    createLabel("Tool", 0)
    createLabel("Strength", 1)
    createLabel("Coins", 2)
    createLabel("Equipment", 3)
    createLabel("Backpack", 4)
    createLabel("Ores", 5)
    createLabel("Area", 6)
end

function GameHUD:Start()
    hudEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("UpdateHUD")

    updateConnection = RunService.Heartbeat:Connect(function()
        local now = tick()
        if now - lastUpdate >= UPDATE_INTERVAL then
            lastUpdate = now
            hudEvent:FireServer()
        end
    end)

    hudEvent.OnClientEvent:Connect(function(eventName, data)
        if eventName == "HUDData" and data then
            if labels.Tool then
                local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                labels.Tool.Text = "Tool: " .. (tool and tool.Name or "None")
            end
            if labels.Strength then
                labels.Strength.Text = "Strength: " .. tostring(data.Strength)
            end
            if labels.Coins then
                labels.Coins.Text = "Coins: " .. tostring(data.Coins)
            end
            if labels.Equipment then
                labels.Equipment.Text = "Equipment: " .. data.Equipment
            end
            if labels.Backpack then
                labels.Backpack.Text = "Backpack: " .. data.Backpack
            end
            if labels.Ores then
                labels.Ores.Text = "Ores: " .. tostring(data.StoredOres) .. " / " .. tostring(data.Capacity)
            end
            if labels.Area then
                labels.Area.Text = "Area: " .. data.Area
            end
        end
    end)
end

function GameHUD:Cleanup()
    if updateConnection then
        updateConnection:Disconnect()
        updateConnection = nil
    end
    if screenGui then
        screenGui:Destroy()
        screenGui = nil
    end
end

return GameHUD