--[[
    DebugUtils
    
    Purpose:
    Provides debugging helper functions.
    
    Responsibility:
    - Debug logging
    - Performance measurement
    - State inspection
    - Error tracking
    
    Note:
    Utilities contain no gameplay ownership.
    Utilities are stateless and reusable.
    Debug utilities should be removed or minimized in production.
--]]

local DebugUtils = {}

local enabled = false

function DebugUtils:SetEnabled(state)
    enabled = state
end

function DebugUtils:Log(message, level)
    if not enabled then return end
    
    level = level or "INFO"
    print(string.format("[DEBUG][%s] %s", level, message))
end

function DebugUtils:LogError(message)
    self:Log(message, "ERROR")
end

function DebugUtils:LogWarning(message)
    self:Log(message, "WARN")
end

function DebugUtils:LogInfo(message)
    self:Log(message, "INFO")
end

function DebugUtils:MeasurePerformance(name, func)
    if not enabled then return func() end
    
    local start = tick()
    local result = func()
    local duration = tick() - start
    
    self:Log(string.format("[PERF] %s took %.4f seconds", name, duration))
    return result
end

function DebugUtils:DumpTable(tbl, indent)
    if not enabled then return end
    
    indent = indent or 0
    local prefix = string.rep("  ", indent)
    
    for key, value in pairs(tbl) do
        if type(value) == "table" then
            print(prefix .. tostring(key) .. ":")
            self:DumpTable(value, indent + 1)
        else
            print(prefix .. tostring(key) .. ": " .. tostring(value))
        end
    end
end

return DebugUtils