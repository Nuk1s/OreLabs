---
id: TableUtils
title: TableUtils
status: Active
version: 1.0
owner: OreLabs
category: Utility
depends_on: []
last_updated: 2026-07-09
---

--[[
    TableUtils
    
    Purpose:
    Provides reusable table helper functions.
    
    Responsibility:
    - Table copying
    - Table merging
    - Table validation
    - Table searching
    - Table counting
    
    Note:
    Utilities contain no gameplay ownership.
    Utilities are stateless and reusable.
--]]

local TableUtils = {}

function TableUtils:DeepCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        if type(value) == "table" then
            copy[key] = self:DeepCopy(value)
        else
            copy[key] = value
        end
    end
    return copy
end

function TableUtils:ShallowCopy(original)
    local copy = {}
    for key, value in pairs(original) do
        copy[key] = value
    end
    return copy
end

function TableUtils:Merge(target, source)
    local result = self:ShallowCopy(target)
    for key, value in pairs(source) do
        result[key] = value
    end
    return result
end

function TableUtils:Contains(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

function TableUtils:Count(tbl)
    local count = 0
    for _ in pairs(tbl) do
        count = count + 1
    end
    return count
end

function TableUtils:IsEmpty(tbl)
    return next(tbl) == nil
end

return TableUtils