--[[
    ClientEntry
    
    Purpose:
    Client-side entry point.
    Requires and initializes all client modules.
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local GameHUD = require(script.Parent.GameHUD)
local GameController = require(script.Parent.GameController)
local OreVisual = require(script.Parent.OreVisual)
local ShopUI = require(script.Parent.ShopUI)
local FloatingText = require(script.Parent.FloatingText)
local SoundEffects = require(script.Parent.SoundEffects)

GameHUD:Initialize()
GameHUD:Start()

GameController:Initialize()
GameController:Start()

OreVisual:Initialize()
OreVisual:Start()

ShopUI:Initialize()
ShopUI:Start()

FloatingText:Initialize()
FloatingText:Start()

SoundEffects:Initialize()
SoundEffects:Start()

if RunService:IsStudio() then
    local DevPanel = require(script.Parent.DevPanel)
    DevPanel:Initialize()
    DevPanel:Start()
end

print("[ClientEntry] Client initialized for " .. player.Name)