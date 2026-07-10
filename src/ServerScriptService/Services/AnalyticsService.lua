---
id: AnalyticsService
title: AnalyticsService
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