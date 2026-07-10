---
id: StringUtils
title: StringUtils
status: Active
version: 1.0
owner: OreLabs
category: Utility
depends_on: []
last_updated: 2026-07-09
---

--[[
    StringUtils
    
    Purpose:
    Provides reusable string helper functions.
    
    Responsibility:
    - String formatting
    - String validation
    - String manipulation
    - Number formatting
    
    Note:
    Utilities contain no gameplay ownership.
    Utilities are stateless and reusable.
--]]

local StringUtils = {}

function StringUtils:FormatNumber(number)
    if number >= 1000000000 then
        return string.format("%.1fB", number / 1000000000)
    elseif number >= 1000000 then
        return string.format("%.1fM", number / 1000000)
    elseif number >= 1000 then
        return string.format("%.1fK", number / 1000)
    else
        return tostring(number)
    end
end

function StringUtils:FormatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    
    if hours > 0 then
        return string.format("%02d:%02d:%02d", hours, minutes, secs)
    else
        return string.format("%02d:%02d", minutes, secs)
    end
end

function StringUtils:Trim(str)
    return str:match("^%s*(.-)%s*$")
end

function StringUtils:Split(str, delimiter)
    local result = {}
    for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end

function StringUtils:StartsWith(str, start)
    return str:sub(1, #start) == start
end

function StringUtils:EndsWith(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end

return StringUtils