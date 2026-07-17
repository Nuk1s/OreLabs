--[[
    SoundEffects
    
    Purpose:
    Plays sound effects for training and mining.
    Uses simple sound creation.
--]]

local SoundEffects = {}

local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer

local sounds = {}

function SoundEffects:Initialize()
    sounds.Train = Instance.new("Sound")
    sounds.Train.SoundId = "rbxassetid://138087858"
    sounds.Train.Volume = 0.3
    sounds.Train.Parent = SoundService

    sounds.Mine = Instance.new("Sound")
    sounds.Mine.SoundId = "rbxassetid://138087943"
    sounds.Mine.Volume = 0.3
    sounds.Mine.Parent = SoundService

    sounds.Buy = Instance.new("Sound")
    sounds.Buy.SoundId = "rbxassetid://138088175"
    sounds.Buy.Volume = 0.3
    sounds.Buy.Parent = SoundService

    sounds.Sell = Instance.new("Sound")
    sounds.Sell.SoundId = "rbxassetid://138088232"
    sounds.Sell.Volume = 0.3
    sounds.Sell.Parent = SoundService
end

function SoundEffects:Start()
end

function SoundEffects:Cleanup()
end

function SoundEffects:PlayTrain()
    if sounds.Train then
        sounds.Train:Play()
    end
end

function SoundEffects:PlayMine()
    if sounds.Mine then
        sounds.Mine:Play()
    end
end

function SoundEffects:PlayBuy()
    if sounds.Buy then
        sounds.Buy:Play()
    end
end

function SoundEffects:PlaySell()
    if sounds.Sell then
        sounds.Sell:Play()
    end
end

return SoundEffects