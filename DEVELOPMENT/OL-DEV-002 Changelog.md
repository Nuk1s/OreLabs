---
id: OL-DEV-002
title: Changelog
status: Active
version: 1.0
owner: OreLabs
category: Development
depends_on:
  - OL-DEV-001
last_updated: 2026-07-09
---

# OL-DEV-002 Changelog

## Purpose

The Changelog records all notable changes to the OreLabs project.

Every completed phase, feature, and fix should be documented here.

---

# Changelog

## [0.1.0] - 2026-07-09

### Phase 1 — Core Framework

#### Added

- Complete Roblox Studio folder hierarchy
- ReplicatedStorage structure (Assets, Config, Constants, Shared, Packages, Remotes, Types)
- ServerScriptService structure (Bootstrap, Services, Systems, Managers, Controllers, Utilities, Debug)
- StarterPlayer structure (StarterPlayerScripts, CharacterScripts)
- StarterGui structure (HUD, Menus, Inventory, Shop, Eggs, Settings, Notifications, Debug)
- ServerStorage structure (NPCTemplates, OreTemplates, FutureTemplates)
- Workspace structure (Maps, MiningAreas, NPCs, SpawnLocations, InteractiveObjects, Effects)
- ReplicatedFirst structure (LoadingScreen, InitialUI, StartupScripts)
- SoundService, Lighting, Teams folders

#### Services Created

- Bootstrap (initialization pipeline)
- PlayerService (player management)
- DataService (persistence)
- EconomyService (currency systems)
- StrengthService (strength progression)
- MiningService (mining mechanics)
- InventoryService (inventory management)
- WorldService (world progression)
- PetService (pet systems)
- QuestService (quest mechanics)
- AFKService (AFK systems)
- TitleService (title systems)
- ForgeService (forge mechanics)
- ConfigService (configuration management)
- AnalyticsService (analytics tracking)

#### Systems Created

- MiningSystem (mining implementation details)
- StrengthSystem (strength implementation details)
- EconomySystem (economy implementation details)

#### Managers Created

- PlayerManager (player operational logic)
- SaveManager (save operational logic)
- NPCManager (NPC operational logic)
- UIManager (UI operational logic)

#### Controllers Created

- HUDController (client HUD behavior)
- InventoryController (client inventory behavior)
- PetController (client pet behavior)
- NotificationController (client notification behavior)

#### Utilities Created

- MathUtils (math helper functions)
- TableUtils (table helper functions)
- StringUtils (string helper functions)
- FormattingUtils (formatting helper functions)
- DebugUtils (debug helper functions)

#### Configuration Created

- GameConfig (game balance values)
- GameConstants (constant values)
- GameTypes (type definitions)
- RemoteDefinitions (network remote definitions)
- SharedUtils (client-server shared utilities)
- PackageLoader (package management)

#### Documentation Updated

- Backlog (Phase 1 tasks marked completed)
- Roadmap (Phase 1 marked completed)

### Validation Sprint (2026-07-09)

#### Fixed

- Bootstrap changed from server script to ModuleScript (.module.lua)
- CharacterScripts changed from client script to ModuleScript
- LoadingScreen changed from client script to ModuleScript
- InitialUI changed from client script to ModuleScript
- StartupScripts changed from client script to ModuleScript
- DataService dependency updated to include PlayerService
- PlayerService dependency corrected (removed DataService dependency)
- MiningService dependency updated to include WorldService
- AnalyticsService dependency updated to include DataService
- DebugService dependency updated to include PlayerService and DataService
- WorldService hardcoded WORLDS replaced with GameConfig reference
- DataService hardcoded SAVE_INTERVAL and DATA_VERSION replaced with GameConfig references
- FormattingUtils updated to require StringUtils
- TableUtils parameter naming fixed (table -> tbl)
- DebugUtils parameter naming fixed (table -> tbl)
- SharedUtils removed duplicated FormatNumber and DeepCopy functions

### Sprint 2 — Bootstrap Runtime (2026-07-09)

#### Added

- ServiceRegistry module for central service registration and lookup
- ServerEntry.server.lua as the single server entry point
- Full Bootstrap runtime with dependency validation, sequential initialization, structured boot logging
- Start() method added to all 14 services
- Cleanup() method added to all 14 services (replaces Shutdown())
- Bootstrap:Shutdown() for reverse-order service cleanup
- game:BindToClose integration for graceful server shutdown

#### Modified

- Bootstrap.module.lua rewritten with full runtime: service loading, dependency validation, Initialize/Start phases, boot log output
- ConfigService.lua: Initialize loads config modules from ReplicatedStorage
- DataService.lua: Initialize sets up DataStore, Start binds PlayerRemoving, Cleanup saves all profiles
- PlayerService.lua: Start binds PlayerAdded/PlayerRemoving events
- EconomyService.lua: Full lifecycle with per-player currency tracking
- StrengthService.lua: Full lifecycle with per-player strength tracking
- InventoryService.lua: Full lifecycle with per-player inventory tracking
- MiningService.lua: Full lifecycle with ore registration
- WorldService.lua: Full lifecycle with per-player world state
- PetService.lua: Full lifecycle with pet inventory and team tracking
- QuestService.lua: Full lifecycle with per-player quest tracking
- AFKService.lua: Full lifecycle with per-player AFK state
- TitleService.lua: Full lifecycle with title unlock and equip tracking
- ForgeService.lua: Full lifecycle with blueprint and material tracking
- AnalyticsService.lua: Full lifecycle with event queue
- DebugService.lua: Full lifecycle

### Sprint 3 — Player Profile Runtime (2026-07-09)

#### Added

- ProfileTemplate module defining default runtime profile structure with all system placeholders
- InternalEvents module for ProfileCreated, ProfileReady, ProfileReleased events
- DataService:CreateProfile() builds profiles from template and validates structure
- DataService:ValidateProfile() checks required fields and auto-repairs missing data
- DataService:HasProfile(), IsProfileReady(), GetProfiles() public API
- DataService:MarkReady() fires ProfileReady after validation
- PlayerService:GetPlayerCount() for active player count

#### Modified

- DataService.lua rewritten as profile owner: creates, validates, stores, releases runtime profiles
- PlayerService.lua rewritten to delegate profile creation to DataService, fire internal events on lifecycle transitions
- Debug logging added to PlayerService for profile create/ready/release events

### Sprint 4 — Service Integration (2026-07-09)

#### Added

- DataService internal API: GetSection, UpdateSection, GetValue, SetValue, IncrementValue, DecrementValue
- ProfileTemplate Runtime section for temporary session data (CurrentOre, MiningTarget, TemporaryBuffs, etc.)
- navigateToPath helper for dot-separated path resolution

#### Modified

- DataService.lua rewritten with full internal API for safe profile access
- EconomyService.lua rewritten to read/write Coins and Gems through DataService
- StrengthService.lua rewritten to read/write Strength through DataService
- InventoryService.lua rewritten to read/write inventory through DataService
- MiningService.lua rewritten to track mining target through DataService Runtime
- PetService.lua rewritten to read/write pet collection and teams through DataService
- WorldService.lua rewritten to read/write world state through DataService
- QuestService.lua rewritten to read/write quest progress through DataService
- AFKService.lua rewritten to read/write AFK state through DataService
- TitleService.lua rewritten to read/write titles through DataService
- ForgeService.lua rewritten to read/write blueprints and materials through DataService

#### Removed

- All per-player state tables from 11 services (playerCurrencies, playerStrength, playerInventories, etc.)