--[[
    FormattingUtils
    
    Purpose:
    Provides reusable formatting helper functions.
    
    Responsibility:
    - Currency formatting
    - Percentage formatting
    - Color formatting
    - Display formatting
    
    Note:
    Utilities contain no gameplay ownership.
    Utilities are stateless and reusable.
--]]

local FormattingUtils = {}

local StringUtils = require(script.Parent.StringUtils)

function FormattingUtils:FormatCurrency(amount, currencyType)
    local formatted = StringUtils:FormatNumber(amount)
    return formatted .. " " .. (currencyType or "")
end

function FormattingUtils:FormatPercentage(value, max)
    if max == 0 then return "0%" end
    local percent = (value / max) * 100
    return string.format("%.1f%%", percent)
end

function FormattingUtils:FormatDate(timestamp)
    return os.date("%Y-%m-%d", timestamp)
end

function FormattingUtils:FormatDateTime(timestamp)
    return os.date("%Y-%m-%d %H:%M:%S", timestamp)
end

function FormattingUtils:FormatCompact(number)
    return StringUtils:FormatNumber(number)
end

return FormattingUtils