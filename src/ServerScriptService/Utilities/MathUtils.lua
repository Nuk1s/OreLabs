--[[
    MathUtils
    
    Purpose:
    Provides reusable math helper functions.
    
    Responsibility:
    - Random number generation
    - Percentage calculations
    - Rounding functions
    - Clamp functions
    - Lerp functions
    
    Note:
    Utilities contain no gameplay ownership.
    Utilities are stateless and reusable.
--]]

local MathUtils = {}

function MathUtils:Random(min, max)
    return math.random(min, max)
end

function MathUtils:RandomFloat(min, max)
    return min + (max - min) * math.random()
end

function MathUtils:Percentage(value, max)
    if max == 0 then return 0 end
    return (value / max) * 100
end

function MathUtils:Round(value, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(value * mult + 0.5) / mult
end

function MathUtils:Clamp(value, min, max)
    return math.clamp(value, min, max)
end

function MathUtils:Lerp(start, t, goal)
    return start + (goal - start) * t
end

function MathUtils:Map(value, min1, max1, min2, max2)
    return min2 + (max2 - min2) * ((value - min1) / (max1 - min1))
end

return MathUtils