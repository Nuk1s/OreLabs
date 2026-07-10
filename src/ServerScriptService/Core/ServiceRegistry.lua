---
id: ServiceRegistry
title: ServiceRegistry
status: Active
version: 1.0
owner: OreLabs
category: Core
depends_on: []
last_updated: 2026-07-09
---

--[[
    ServiceRegistry
    
    Purpose:
    Central registry for all game services.
    Provides registration, lookup, and dependency validation.
    
    Responsibility:
    - Register services by name
    - Prevent duplicate registrations
    - Provide service lookup API
    - Verify all dependencies are met before initialization
--]]

local ServiceRegistry = {}

local registeredServices = {}
local initializationOrder = {}

function ServiceRegistry:Register(name, service)
    if registeredServices[name] then
        error("[ServiceRegistry] Duplicate registration: " .. name)
    end

    if type(service) ~= "table" then
        error("[ServiceRegistry] Service must be a table: " .. name)
    end

    registeredServices[name] = service
end

function ServiceRegistry:Get(name)
    return registeredServices[name]
end

function ServiceRegistry:Has(name)
    return registeredServices[name] ~= nil
end

function ServiceRegistry:GetAll()
    return registeredServices
end

function ServiceRegistry:ValidateDependencies(order)
    for _, name in ipairs(order) do
        local service = registeredServices[name]
        if not service then
            return false, "Missing service: " .. name
        end

        if service._dependencies then
            for _, dep in ipairs(service._dependencies) do
                local depRegistered = false
                for _, orderedName in ipairs(order) do
                    if orderedName == dep then
                        depRegistered = true
                        break
                    end
                end
                if not depRegistered then
                    return false, name .. " depends on " .. dep .. " which is not in initialization order"
                end
            end
        end
    end
    return true, nil
end

function ServiceRegistry:GetInitializationOrder()
    return initializationOrder
end

function ServiceRegistry:SetInitializationOrder(order)
    initializationOrder = order
end

function ServiceRegistry:Reset()
    registeredServices = {}
    initializationOrder = {}
end

return ServiceRegistry