--[[
    InternalEvents
    
    Purpose:
    Central hub for internal project events.
    Services communicate through these events instead of directly calling each other.
    
    Responsibility:
    - Fire profile lifecycle events
    - Allow services to subscribe to events
    - Decouple service communication
    
    Events:
    - ProfileCreated(player, profile)
    - ProfileReady(player, profile)
    - ProfileReleased(player)
--]]

local InternalEvents = {}

local listeners = {}

function InternalEvents:On(eventName, callback)
    if not listeners[eventName] then
        listeners[eventName] = {}
    end
    table.insert(listeners[eventName], callback)

    return function()
        self:Off(eventName, callback)
    end
end

function InternalEvents:Off(eventName, callback)
    if not listeners[eventName] then return end

    for i, cb in ipairs(listeners[eventName]) do
        if cb == callback then
            table.remove(listeners[eventName], i)
            break
        end
    end
end

function InternalEvents:Fire(eventName, ...)
    if not listeners[eventName] then return end

    for _, callback in ipairs(listeners[eventName]) do
        pcall(callback, ...)
    end
end

function InternalEvents:Clear()
    listeners = {}
end

return InternalEvents