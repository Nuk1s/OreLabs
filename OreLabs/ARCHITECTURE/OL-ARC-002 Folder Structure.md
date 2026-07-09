---
id: OL-ARC-002
title: Folder Structure
status: Draft
version: 1.0
owner: OreLabs
category: Architecture
depends_on:
  - OL-ARC-001
last_updated: 2026-07-06
---

# OL-ARC-002 Folder Structure

## Purpose

This document defines the complete Roblox Studio project structure used by OreLabs.

Every asset, script, module and resource must have a predictable location.

A developer or AI assistant should always know where a new file belongs without asking.

---

# Core Philosophy

A folder should have exactly one responsibility.

Files should never be placed based on convenience.

They belong where their responsibility belongs.

The project structure should remain stable throughout the lifetime of the game.

---

# High-Level Project Structure

```text
ReplicatedStorage
ServerScriptService
StarterPlayer
StarterGui
Workspace
SoundService
Lighting
Teams
ServerStorage
ReplicatedFirst
```

These are the primary Roblox services used by the project.

---

# ReplicatedStorage

Contains shared resources used by both the server and clients.

Example:

```text
ReplicatedStorage

├── Assets
│   ├── Models
│   ├── Icons
│   ├── Images
│   ├── Animations
│   ├── Sounds
│   ├── Effects
│   └── Materials
│
├── Config
│
├── Constants
│
├── Shared
│
├── Packages
│
├── Remotes
│   ├── Events
│   └── Functions
│
└── Types
```

ReplicatedStorage must never contain gameplay logic.

---

# ServerScriptService

Contains all server-only code.

```text
ServerScriptService

├── Bootstrap
│
├── Services
│
├── Systems
│
├── Managers
│
├── Controllers
│
├── Utilities
│
└── Debug
```

No client should ever access this code directly.

---

# Services

Every major gameplay system should exist as its own Service.

Examples:

```text
Services

StrengthService

EconomyService

MiningService

PetService

WorldService

QuestService

TitleService

ForgeService

AFKService

DataService
```

Each Service owns its own gameplay logic.

---

# Systems

Systems contain implementation details.

Examples:

```text
Mining

Ore Generation

Damage

Rewards

Respawn
```

A Service coordinates Systems.

Systems should not communicate directly with unrelated Systems.

---

# StarterPlayer

Contains player-side scripts.

```text
StarterPlayer

StarterPlayerScripts

CharacterScripts
```

Player-side gameplay should begin here.

---

# StarterGui

Contains every interface.

```text
StarterGui

HUD

Menus

Inventory

Shop

Eggs

Settings

Notifications

Debug
```

Every UI should be isolated into its own folder.

---

# Workspace

Contains world objects.

Example:

```text
Workspace

Maps

MiningAreas

NPCs

SpawnLocations

InteractiveObjects

Effects
```

Workspace should never become a storage location for reusable assets.

---

# ServerStorage

Contains server-only assets.

Examples:

- NPC Templates
- Ore Templates
- Future Templates

Objects stored here should never replicate to clients.

---

# ReplicatedFirst

Contains loading assets.

Examples:

- Loading Screen
- Initial UI
- Startup scripts

Only startup content belongs here.

---

# Asset Organization

Assets should always be separated by type.

Never mix:

- Models
- Icons
- Sounds
- Images
- Animations

Every asset category receives its own folder.

---

# Naming Rules

Folders use PascalCase.

Examples:

```text
MiningService

PlayerData

InventoryUI

QuestSystem
```

Variables and script naming standards are defined separately in Coding Standards.

---

# AI Compatibility

The project structure is designed so AI assistants can determine where new files belong without manual guidance.

Every gameplay feature should have one obvious location.

AI-generated code should never create duplicate folder hierarchies.

---

# Design Rules

- One responsibility per folder.
- One responsibility per module.
- Shared code belongs in ReplicatedStorage.
- Server code belongs in ServerScriptService.
- UI belongs in StarterGui.
- Assets are organized by type.
- Folder structure should remain stable.

---

# Success Criteria

The folder structure is successful when:

- Developers instantly know where new files belong.
- AI assistants place generated code correctly.
- Duplicate folders never appear.
- Navigation remains simple even as the project grows.
- The project scales without structural refactoring.

---

# Folder Structure Principle

> Every file has exactly one logical home.

> If two locations seem correct, the architecture should be improved until only one remains.
