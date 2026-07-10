---
id: SharedUtils
title: SharedUtils
status: Active
version: 1.0
owner: OreLabs
category: Shared
depends_on: []
last_updated: 2026-07-09
---

--[[
    SharedUtils
    
    Purpose:
    Contains utilities shared between client and server.
    
    Responsibility:
    - Provide client-server shared functions
    - Data validation utilities
    
    Note:
    Shared code belongs in ReplicatedStorage.
    This module is accessible by both client and server.
    FormatNumber and DeepCopy are in StringUtils and TableUtils respectively.
--]]

local SharedUtils = {}

function SharedUtils:ValidateNumber(value, min, max)
    if type(value) ~= "number" then return false end
    if min and value < min then return false end
    if max and value > max then return false end
    return true
end

function SharedUtils:ValidateString(value, minLength, maxLength)
    if type(value) ~= "string" then return false end
    if minLength and #value < minLength then return false end
    if maxLength and #value > maxLength then return false end
    return true
end

function SharedUtils:ValidateTable(tbl, requiredKeys)
    if type(tbl) ~= "table" then return false end
    if requiredKeys then
        for _, key in pairs(requiredKeys) do
            if tbl[key] == nil then return false end
        end
    end
    return true
end

function SharedUtils:ValidateBoolean(value)
    return type(value) == "boolean"
end

return SharedUtils