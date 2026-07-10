---
id: PackageLoader
title: PackageLoader
status: Active
version: 1.0
owner: OreLabs
category: Packages
depends_on: []
last_updated: 2026-07-09
---

--[[
    PackageLoader
    
    Purpose:
    Manages package loading and dependencies.
    
    Responsibility:
    - Load packages from Packages folder
    - Resolve package dependencies
    - Provide package lookup API
    - Handle package initialization
    
    Note:
    Packages are reusable libraries or modules.
    This loader centralizes package management.
--]]

local PackageLoader = {}

local packages = {}

function PackageLoader:Initialize()
    -- TODO: Scan Packages folder
    -- TODO: Load all packages
    -- TODO: Resolve dependencies
end

function PackageLoader:GetPackage(packageName)
    return packages[packageName]
end

function PackageLoader:RegisterPackage(packageName, packageData)
    packages[packageName] = packageData
end

function PackageLoader:GetAllPackages()
    return packages
end

function PackageLoader:HasPackage(packageName)
    return packages[packageName] ~= nil
end

return PackageLoader