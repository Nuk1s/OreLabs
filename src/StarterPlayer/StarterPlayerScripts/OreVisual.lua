--[[
    OreVisual
    
    Purpose:
    Handles ore HP bar display on the client.
    Updates HP bars in real-time.
--]]

local OreVisual = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local oreGuiElements = {}
local updateConnection = nil
local oreInfoEvent = nil

function OreVisual:Initialize()
end

function OreVisual:Start()
    oreInfoEvent = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Events"):WaitForChild("GetOreInfo")

    updateConnection = RunService.Heartbeat:Connect(function()
        for oreId, gui in pairs(oreGuiElements) do
            if gui and gui.Parent then
                oreInfoEvent:FireServer(oreId)
            end
        end
    end)

    oreInfoEvent.OnClientEvent:Connect(function(eventName, data)
        if eventName == "OreInfo" and data then
            self:UpdateOreGUI(data.oreId, data)
        end
    end)
end

function OreVisual:Cleanup()
    if updateConnection then
        updateConnection:Disconnect()
        updateConnection = nil
    end

    for _, gui in pairs(oreGuiElements) do
        if gui and gui.Parent then
            gui:Destroy()
        end
    end
    oreGuiElements = {}
end

function OreVisual:CreateOreGUI(orePart)
    if oreGuiElements[orePart.Name] then
        return oreGuiElements[orePart.Name]
    end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "OreInfo"
    billboard.Size = UDim2.new(0, 80, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = orePart

    local bgFrame = Instance.new("Frame")
    bgFrame.Name = "Background"
    bgFrame.Size = UDim2.new(1, 0, 0, 20)
    bgFrame.Position = UDim2.new(0, 0, 0, 0)
    bgFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    bgFrame.BorderSizePixel = 0
    bgFrame.Parent = billboard

    local hpFill = Instance.new("Frame")
    hpFill.Name = "HPFill"
    hpFill.Size = UDim2.new(1, 0, 1, 0)
    hpFill.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    hpFill.BorderSizePixel = 0
    hpFill.Parent = bgFrame

    local hpText = Instance.new("TextLabel")
    hpText.Name = "HPText"
    hpText.Size = UDim2.new(1, 0, 1, 0)
    hpText.BackgroundTransparency = 1
    hpText.TextColor3 = Color3.fromRGB(255, 255, 255)
    hpText.TextScaled = true
    hpText.Font = Enum.Font.GothamBold
    hpText.Text = "10/10"
    hpText.Parent = bgFrame

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, 0, 0, 20)
    nameLabel.Position = UDim2.new(0, 0, 0, 22)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextScaled = true
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.Text = orePart.Name
    nameLabel.Parent = billboard

    oreGuiElements[orePart.Name] = billboard
    return billboard
end

function OreVisual:UpdateOreGUI(oreId, data)
    local gui = oreGuiElements[oreId]
    if not gui then return end

    local hpFill = gui:FindFirstChild("Background")
    if hpFill then
        hpFill = hpFill:FindFirstChild("HPFill")
        if hpFill then
            local percent = (data.CurrentHP / data.MaxHP)
            hpFill.Size = UDim2.new(percent, 0, 1, 0)

            if percent > 0.5 then
                hpFill.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            elseif percent > 0.25 then
                hpFill.BackgroundColor3 = Color3.fromRGB(255, 200, 0)
            else
                hpFill.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
            end
        end
    end

    local hpText = gui:FindFirstChild("Background")
    if hpText then
        hpText = hpText:FindFirstChild("HPText")
        if hpText then
            hpText.Text = math.ceil(data.CurrentHP) .. "/" .. data.MaxHP
        end
    end
end

function OreVisual:RegisterOre(orePart)
    self:CreateOreGUI(orePart)
end

function OreVisual:UnregisterOre(oreId)
    local gui = oreGuiElements[oreId]
    if gui and gui.Parent then
        gui:Destroy()
    end
    oreGuiElements[oreId] = nil
end

return OreVisual