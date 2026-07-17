--[[
    AnalyticsService
    
    Purpose:
    Manages event tracking for analytics.
    Does NOT own persistent statistics — those live in the profile.
    
    Behaviour only:
    - Track events
    - Queue events for export
--]]

local AnalyticsService = {}

local eventQueue = {}

function AnalyticsService:Initialize()
end

function AnalyticsService:Start()
end

function AnalyticsService:Cleanup()
    eventQueue = {}
end

function AnalyticsService:TrackEvent(player, eventName, eventData)
    table.insert(eventQueue, {
        player = player and player.UserId,
        event = eventName,
        data = eventData,
        timestamp = os.time(),
    })
end

function AnalyticsService:GetEventQueue()
    return eventQueue
end

function AnalyticsService:ClearQueue()
    eventQueue = {}
end

return AnalyticsService