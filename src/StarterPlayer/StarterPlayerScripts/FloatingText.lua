--[[
    FloatingText
    
    Purpose:
    Creates floating text effects for feedback.
    Shows +Strength, damage, ore gains, etc.
--]]

local FloatingText = {}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

function FloatingText:Initialize()
end

function FloatingText:Start()
end

function FloatingText:Cleanup()
end

function FloatingText:Show(text, position, color)
    if not position then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Size = UDim2.new(0, 100, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Adornee = nil

    local part = Instance.new("Part")
    part.Size = Vector3.new(0.1, 0.1, 0.1)
    part.Position = position
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1
    part.Parent = workspace

    billboard.Adornee = part
    billboard.Parent = part

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = text
    label.Parent = billboard

    local tween = TweenService:Create(
        billboard,
        TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {StudsOffset = Vector3.new(0, 5, 0)}
    )
    tween:Play()

    game:GetService("Debris"):AddItem(part, 2)
end

function FloatingText:ShowStrength(position, amount)
    self:Show("+" .. amount .. " Strength", position, Color3.fromRGB(0, 200, 255))
end

function FloatingText:ShowDamage(position, amount)
    self:Show("-" .. amount .. " HP", position, Color3.fromRGB(255, 100, 100))
end

function FloatingText:ShowOreGain(position, oreName, amount)
    self:Show("+" .. amount .. " " .. oreName, position, Color3.fromRGB(255, 255, 100))
end

function FloatingText:ShowCoins(position, amount)
    self:Show("+" .. amount .. " Coins", position, Color3.fromRGB(255, 215, 0))
end

function FloatingText:ShowMessage(position, text, color)
    self:Show(text, position, color or Color3.fromRGB(255, 255, 255))
end

return FloatingText