---
id: InventoryService
title: InventoryService
status: Active
version: 1.0
owner: OreLabs
category: Service
depends_on:
  - DataService
  - PlayerService
last_updated: 2026-07-09
---

--[[
    InventoryService
    
    Purpose:
    Manages inventory behaviour and validation.
    Does NOT own inventory persistence — that lives in the profile.
    
    Behaviour only:
    - Add/remove items
    - Check item ownership
    - Validate inventory operations
--]]

local InventoryService = {}

local ServerScriptService = game:GetService("ServerScriptService")
local DataService = require(ServerScriptService.Services.DataService)

local INVENTORY_PATH = "Data.Inventory"

function InventoryService:Initialize()
end

function InventoryService:Start()
end

function InventoryService:Cleanup()
end

function InventoryService:GetInventory(player, inventoryType)
    if not DataService:IsProfileReady(player) then return {} end
    local inv = DataService:GetValue(player, INVENTORY_PATH)
    if not inv then return {} end
    return inv[inventoryType] or {}
end

function InventoryService:AddItem(player, inventoryType, itemId, quantity)
    if not DataService:IsProfileReady(player) then return false end
    if quantity <= 0 then return false end

    local inv = DataService:GetValue(player, INVENTORY_PATH)
    if not inv then return false end

    if not inv[inventoryType] then
        inv[inventoryType] = {}
    end

    inv[inventoryType][itemId] = (inv[inventoryType][itemId] or 0) + quantity
    return true
end

function InventoryService:RemoveItem(player, inventoryType, itemId, quantity)
    if not DataService:IsProfileReady(player) then return false end
    if quantity <= 0 then return false end

    local inv = DataService:GetValue(player, INVENTORY_PATH)
    if not inv or not inv[inventoryType] then return false end

    local current = inv[inventoryType][itemId] or 0
    if current < quantity then return false end

    inv[inventoryType][itemId] = current - quantity
    if inv[inventoryType][itemId] <= 0 then
        inv[inventoryType][itemId] = nil
    end
    return true
end

function InventoryService:HasItem(player, inventoryType, itemId, quantity)
    local inv = self:GetInventory(player, inventoryType)
    return (inv[itemId] or 0) >= quantity
end

return InventoryService