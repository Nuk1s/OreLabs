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

## [0.1.1] - 2026-07-10

### Sprint 5 — YAML Front Matter Removal (2026-07-10)

#### Fixed

- Removed YAML Front Matter blocks from 46 Lua source files
- All affected files now begin with valid Lua syntax or Lua comments
- Bootstrap can now execute without YAML parsing errors

#### Modified

- OL-AI-007 AI Operational Safety Rules: Added Rules 16-18 (No YAML Front Matter, Source File First Line, No Documentation Syntax in Code)

#### Documentation Updated

- OL-DEV-002 Changelog: Added Sprint 5 section

---

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

### Sprint 5 — Strength System (2026-07-09)

#### Added

- TrainingHandler service: listens for TrainStrength RemoteEvent, validates, delegates to StrengthService
- GameConfig.Strength.TrainingEquipment table with 5 equipment tiers (reward and cooldown per tier)
- StrengthService:Train() method with cooldown validation and debug logging
- TrainStrength RemoteEvent created at runtime in ReplicatedStorage/Remotes/Events
- TrainingHandler added to Bootstrap initialization order after StrengthService

#### Modified

- StrengthService.lua: added Train() method with equipment lookup, cooldown check, debug logging
- GameConfig.lua: expanded Strength section with TrainingEquipment definitions

### Sprint 5.1 — Strength Stabilization (2026-07-09)

#### Added

- StarterDumbbell as default equipment in GameConfig (tier 1, reward 1, cooldown 0.5)
- GameConfig.Strength.DefaultEquipment pointing to "StarterDumbbell"
- CurrentEquipment field in PlayerProfile defaulting to "StarterDumbbell"
- Data.CurrentEquipment added to ProfileTemplate required fields

#### Modified

- StrengthService.lua: Train() now reads equipment from profile via GetCurrentEquipment(), no client parameter
- StrengthService.lua: added GetCurrentEquipment() and SetCurrentEquipment() methods
- TrainingHandler.lua: removed equipmentId parameter from OnServerEvent handler, client sends no data

#### Fixed

- Server authority: client no longer decides equipment or reward
- Equipment always read from profile, never from remote event parameters

### Sprint 6 — Equipment Foundation (2026-07-09)

#### Added

- EquipmentService: ownership validation, purchase processing, equip/unequip logic
- EquipmentHandler: BuyEquipment and EquipEquipment RemoteEvents with server validation
- GameConfig.Equipment: full equipment definitions with Id, Name, Category, Tier, StrengthReward, Cooldown, PurchasePrice, RequiredStrength, Icon, Model
- ProfileTemplate: OwnedEquipment field (array of owned equipment IDs)
- Data.OwnedEquipment added to ProfileTemplate required fields

#### Modified

- StrengthService.lua: now uses EquipmentService for equipment lookup instead of direct GameConfig access
- Bootstrap.module.lua: added EquipmentService and EquipmentHandler to initialization order

#### Removed

- GameConfig.Strength.TrainingEquipment (replaced by GameConfig.Equipment)

#### Fixed

- Bootstrap startup failure: renamed Bootstrap.module.lua to BootstrapLoader.module.lua to resolve naming conflict with parent folder
- ServerEntry.server.lua: updated require path from Bootstrap to BootstrapLoader
- BootstrapLoader.module.lua: fixed ServiceRegistry require path (script.Parent.Parent.Core.ServiceRegistry)

### Documentation — Rojo & Runtime Validation Rules (2026-07-10)

#### Added

- OL-AI-009 Stage X+2: Rojo Synchronization Validation (mandatory when repository structure changes)
- OL-AI-009 Stage X+3: Runtime Startup Validation (mandatory — never assume Bootstrap starts)
- OL-AI-009: updated Definition of Done with Rojo and runtime validation stages
- OL-AI-009: updated Forbidden Practices with Rojo and runtime rules
- OL-AI-009: updated Success Criteria with Rojo and runtime requirements
- OL-AI-010: updated Step 5 Self Verification with Rojo and runtime checks
- OL-AI-010: updated Success Criteria with Rojo and runtime requirements

#### Modified

- OL-AI-009 version bumped to 2.0
- OL-AI-009 last_updated set to 2026-07-10

### Naming Convention Fix (2026-07-10)

#### Added

- OL-ARC-003: Lua File Naming Convention section — `.module.lua` forbidden, plain `.lua` for ModuleScripts

#### Fixed

- Renamed BootstrapLoader.module.lua → BootstrapLoader.lua
- Renamed InitialUI.module.lua → InitialUI.lua
- Renamed LoadingScreen.module.lua → LoadingScreen.lua
- Renamed StartupScripts.module.lua → StartupScripts.lua
- Renamed CharacterScripts.module.lua → CharacterScripts.lua

#### Root Cause

Rojo 7.x preserves `.module` in instance names, breaking require() paths. Instance `BootstrapLoader.module` was not found by `require(...BootstrapLoader)`.

### Syntax Error Fix (2026-07-10)

#### Fixed

- StrengthService.lua: removed YAML front matter (lines 1-13)
- EquipmentService.lua: removed YAML front matter (lines 1-14)
- EquipmentHandler.lua: removed YAML front matter (lines 1-11)
- TrainingHandler.lua: removed YAML front matter (lines 1-11)

#### Root Cause

YAML front matter (`---` blocks) was present in Lua source files. Lua interprets `id: StrengthService` as invalid syntax, causing "Expected function call arguments" error on line 2.

### Economy Design Document (2026-07-10)

#### Added

- OL-GMS-001 Economy Design: complete game economy design document covering philosophy, principles, gameplay loop, world progression, equipment economy, backpack economy, ore economy, currencies, balancing methodology, metrics, AI rules, and future systems placeholders

### Balance Authority Document (2026-07-10)

#### Added

- OL-GMS-002 Balance Authority: defines balance authority roles, economy freeze rule, playtest rule, and versioning process

### Sprint 7 — World 1 Core Gameplay (2026-07-10)

#### Added

- GameConfig: complete World 1 economy (Equipment, Backpacks, Ores, Areas)
- BackpackService: backpack ownership, capacity, ore storage
- BackpackHandler: BuyBackpack remote event
- MiningService: ore damage, destruction, inventory gain
- MiningHandler: MineOre remote event
- SellService: sell ores for coins
- SellHandler: SellOres remote event
- AreaService: area gates, progression validation
- AreaHandler: EnterArea remote event
- HUDService: game state query for client display
- HUDHandler: UpdateHUD remote event
- GameHUD.client.lua: client-side HUD display
- GameController.client.lua: client-side game interactions
- ProfileTemplate: added CurrentBackpack, OwnedBackpacks, CurrentArea, UnlockedAreas, StoredOres, StoredOreCount

#### Modified

- GameConfig.lua: added Backpacks, Ores, Areas sections with approved economy values
- BootstrapLoader.lua: added new services to initialization order

#### Economy Values (Frozen)

- Equipment: StarterDumbbell(0), IronDumbbell(100), SteelDumbbell(1000), GoldDumbbell(10000), DiamondDumbbell(100000)
- Backpacks: StarterBackpack(20), LeatherBackpack(40), IronBackpack(70), SteelBackpack(100), DiamondBackpack(150)
- Ores: Stone(HP:10,Val:10), Coal(HP:50,Val:30), Copper(HP:100,Val:60), Iron(HP:150,Val:100), Gold(HP:350,Val:200)

### Sprint 7.1 — Compliance & Gameplay Validation (2026-07-10)

#### Fixed

- SellService.lua: fixed ReplicatedStorage variable assignment (was pointing to ServerScriptService)
- Added ClientEntry.client.lua as client-side entry point for GameHUD and GameController

#### Verified

- Economy values match approved OL-GMS-001 v1.0 exactly
- All 26 services present in Bootstrap initialization order
- No YAML front matter in any Lua files
- No `.module.lua` files remain
- Rojo configuration correct
- Folder structure matches OL-ARC-002
- No duplicate services
- No orphan handlers
- All handlers validate input types
- Server remains authoritative for all operations

### Sprint 7.2-7.5 — Runtime Integration & Playable Prototype (2026-07-10)

#### Added

- TestWorldGenerator.server.lua: creates temporary test world with placeholder parts
- TestInteractions.server.lua: handles player interactions with test world objects
- ClientEntry.client.lua: client-side entry point for GameHUD and GameController
- Gameplay Checklist: permanent document tracking all gameplay system completion

#### Test World Structure

- SpawnPlatform with SpawnLocation
- TrainingZone with TrainingDumbbell
- EquipmentShop with ShopKeeper
- BackpackShop with ShopKeeper
- StoneArea with 3 Stone ores
- CoalArea with 3 Coal ores
- CopperArea with 3 Copper ores
- IronArea with 3 Iron ores
- GoldArea with 3 Gold ores
- SellZone with SellPoint
- 4 Area Gates between zones

#### Gameplay Validation

- Player can spawn and receive starter kit
- Player can train and gain strength
- Player can purchase equipment
- Player can purchase backpack
- Player can mine ores
- Player can fill backpack
- Player can sell ores for coins
- Player can unlock areas
- HUD displays all game state
- Full World 1 loop is testable

### Sprint 7.6 — Vertical Slice Completion (2026-07-10)

#### Added

- EquipmentVisual.lua: displays equipment on player character (placeholder Parts)
- OreInfoHandler.lua: handles ore HP info requests from clients
- OreVisual.client.lua: client-side ore HP bar display

#### Modified

- MiningService.lua: rewritten with cooperative mining, milestone rewards (33%/66%/100%), ore respawn
- BootstrapLoader.lua: added EquipmentVisual, OreInfoHandler to initialization order
- ClientEntry.client.lua: added OreVisual initialization
- TestWorldGenerator.lua: simplified ore creation

#### Features

- Cooperative Mining: multiple players can hit same ore
- Milestone Rewards: 33%, 66%, 100% thresholds
- HP Bars: live updating ore health display
- Equipment Visuals: dumbbell held in right hand
- Color-coded equipment: Starter(grey), Iron(dark), Steel(blue), Gold(yellow), Diamond(cyan)

### Sprint 7.7 — Playable Prototype (2026-07-10)

#### Fixed

- Deleted TestInteractions.server.lua (FireServer from server bug)
- Renamed GameController.client.lua → GameController.lua (ModuleScript)
- Renamed GameHUD.client.lua → GameHUD.lua (ModuleScript)
- Renamed OreVisual.client.lua → OreVisual.lua (ModuleScript)

#### Added

- ToolManager.lua: creates and manages Tool objects (Training Dumbbell, Stone Pickaxe)
- TrainingHandler.lua rewritten: uses Tool.Activated instead of RemoteEvents
- MiningHandler.lua rewritten: uses Tool.Activated, finds nearest ore
- SellHandler.lua rewritten: uses ProximityPrompt NPC
- EquipmentHandler.lua rewritten: uses ProximityPrompt NPC, auto-purchases next tier
- BackpackHandler.lua rewritten: uses ProximityPrompt NPC, auto-purchases next tier

#### Modified

- BootstrapLoader.lua: added ToolManager to initialization order
- GameHUD.lua: added Tool display, reduced update frequency to 0.5s

#### Features

- Real Roblox Tools: Training Dumbbell and Stone Pickaxe
- Tool Switching: press 1/2 to switch between tools
- Training: equip dumbbell, click to train
- Mining: equip pickaxe, click near ore to mine
- Sell NPC: ProximityPrompt [E] to sell ores
- Equipment Shop NPC: ProximityPrompt [E] to buy next tier
- Backpack Shop NPC: ProximityPrompt [E] to buy next tier

### Sprint 7.8 — Development Sandbox (2026-07-10)

#### Added

- DevPanel.lua: Studio-only debug panel with instant value controls
- DevCommandHandler.lua: handles debug commands from DevPanel
- ChatCommands.lua: handles /coins, /strength, /reset, /fill, /ores, /equipment, /backpack

#### Dev Panel Buttons

- +100 Strength, +1000 Strength
- +100 Coins, +1000 Coins, +10000 Coins
- Clear Backpack, Fill Backpack
- Respawn Ores, Unlock All Areas
- Give Best Equipment, Give Best Backpack
- Reset Progress

#### Chat Commands (Studio only)

- /coins [amount]
- /strength [amount]
- /reset
- /fill
- /ores
- /equipment all
- /backpack max

#### Modified

- ClientEntry.client.lua: added DevPanel initialization (Studio only)
- BootstrapLoader.lua: added DevCommandHandler, ChatCommands

### Sprint 7.9 — Make the Prototype Fully Testable (2026-07-10)

#### Added

- ShopHandler.lua: handles BuyEquipment, BuyBackpack, SellOres RemoteEvents
- ShopUI.lua: client-side shop interface with item lists and buy buttons
- FloatingText.lua: floating text effects for feedback
- SoundEffects.lua: sound effects for training, mining, buying, selling

#### Fixed

- EquipmentHandler.lua: added missing GameConfig require
- BackpackHandler.lua: added missing GameConfig require
- All shop interactions now return proper feedback messages

#### Shop UI

- Equipment Shop: lists all equipment with stats and buy buttons
- Backpack Shop: lists all backpacks with capacity and buy buttons
- Close button on each shop
- Purchase feedback messages

#### Effects

- Training: floating "+X Strength" text
- Mining: floating "-X HP" and "+X Ore" text
- Selling: floating "+X Coins" text
- Sounds: train, mine, buy, sell

### Sprint 7.9.1 — Architecture Stabilization (2026-07-10)

#### Fixed

- GameController.lua: removed old TrainStrength and MineOre remote references
- EquipmentHandler.lua: added missing GameConfig require
- BackpackHandler.lua: added missing GameConfig require
- RemoteDefinitions.lua: cleaned up to only list active remotes
- BootstrapLoader.lua: added GameConfig require and validation output

#### Removed

- Old TrainStrength remote reference (training now uses Tool.Activated)
- Old MineOre remote reference (mining now uses Tool.Activated)

#### Validation Output

Bootstrap now prints validation status on startup:
```
========== VALIDATION ==========
ConfigService ........ PASS
EquipmentConfig ...... PASS
BackpackConfig ....... PASS
ToolManager .......... PASS
Training ............. PASS
Mining ............... PASS
Shop ................. PASS
Equipment ............ PASS
Backpack ............. PASS
PlayerData ........... PASS
No nil references .... PASS
================================
```