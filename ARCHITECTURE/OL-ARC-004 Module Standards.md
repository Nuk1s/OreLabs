---
id: OL-ARC-004
title: Module Standards
status: Draft
version: 1.0
owner: OreLabs
category: Architecture
depends_on:
  - OL-ARC-001
  - OL-ARC-002
  - OL-ARC-003
last_updated: 2026-07-06
---

# OL-ARC-004 Module Standards

## Purpose

This document defines the standards for every ModuleScript used in OreLabs.

ModuleScripts are the primary building blocks of the game's architecture.

Every module must be easy to read, easy to maintain, and easy to extend.

---

# Core Philosophy

A module should solve one problem.

A module should have one clear responsibility.

A module should expose one clear public API.

Modules must support long-term development and AI-assisted maintenance.

---

# Module Types

OreLabs uses several module categories.

## Services

Services own major gameplay domains.

Examples:

- StrengthService
- MiningService
- EconomyService
- PetService
- WorldService
- QuestService
- ForgeService
- DataService

Services coordinate larger systems.

---

## Managers

Managers handle operational logic.

Examples:

- PlayerManager
- NPCManager
- UIManager
- SaveManager

Managers should support a service or subsystem without replacing it.

---

## Controllers

Controllers handle client-side behavior.

Examples:

- HUDController
- InventoryController
- EggController
- PetController
- NotificationController

Controllers should never own server authority.

---

## Utilities

Utilities provide reusable helper functions.

Examples:

- MathUtils
- TableUtils
- StringUtils
- FormattingUtils

Utilities should contain no gameplay ownership.

---

# Module Naming

Module names must clearly communicate responsibility.

Good examples:

- StrengthService
- MiningService
- PetController
- SaveManager
- TableUtils

Bad examples:

- Stuff
- Misc
- NewModule
- Temp
- Script2

---

# Public Interface

Every module must have a clearly defined public interface.

The public interface should be intentionally limited.

Only functionality that other systems need should be exposed.

Internal logic should remain private.

---

# Single Responsibility

A module must not combine unrelated responsibilities.

Bad:

- Mining + Inventory + Saving

Good:

- MiningService
- InventoryService
- SaveService

If a module grows too large, it should be split.

---

# Dependencies

Modules should depend on stable modules only.

Avoid circular dependencies.

If two modules require each other repeatedly, the architecture should be redesigned.

Dependency flow should remain predictable.

---

# Import Rules

Modules should require dependencies explicitly.

Do not create hidden dependency chains.

Do not require modules inside functions unless the dependency is truly optional or lazy-loaded.

Dependencies should be easy to trace.

---

# State Ownership

A module owns its internal state.

Other modules should not directly mutate that state.

State changes should occur through the module's public API.

Example:

Good:

```lua
EconomyService:AddCoins(player, amount)
