---
id: OL-ARC-003
title: Coding Standards
status: Draft
version: 1.0
owner: OreLabs
category: Architecture
depends_on:
  - OL-ARC-001
  - OL-ARC-002
last_updated: 2026-07-06
---

# OL-ARC-003 Coding Standards

## Purpose

This document defines the coding standards for every script written for OreLabs.

These standards apply equally to:

- Human developers
- AI assistants
- Code generators
- Automation tools

Consistency is more important than personal preference.

---

# Core Philosophy

Readable code is more valuable than clever code.

Predictable code is more valuable than short code.

Maintainable code is more valuable than fast-written code.

Every script should look like it was written by the same developer.

---

# General Principles

Every script should have one responsibility.

Avoid unnecessary complexity.

Prefer explicit logic over hidden behavior.

Write code for long-term maintenance, not short-term speed.

---

# Naming Rules

Use PascalCase for:

- Modules
- Services
- Controllers
- Managers
- Classes
- Folders

Examples:

StrengthService

MiningSystem

PetController

InventoryManager

---

Use camelCase for:

- local variables
- function parameters
- temporary values

Example:

playerData

oreHealth

currentStrength

---

Use UPPER_SNAKE_CASE only for constants.

Example:

MAX_LEVEL

DEFAULT_SPEED

SAVE_INTERVAL

---

# Module Structure

Every ModuleScript should expose one clear public interface.

Avoid exposing unnecessary internal functions.

Internal helper functions should remain local.

---

# Single Responsibility

One ModuleScript should solve one problem.

Bad:

Inventory + Pets + Saving

Good:

InventoryService

PetService

SaveService

---

# Public vs Private

Public functions define the module API.

Private functions exist only to support internal implementation.

Private implementation should never be accessed externally.

---

# Comments

Write comments only when they explain intent.

Do not comment obvious code.

Bad:

-- Increase coins by one.

Good:

-- Rewards are calculated before global multipliers are applied.

---

# Configuration

Magic numbers are prohibited.

Configurable values belong inside Config modules.

Examples:

Ore HP

Pet Limits

Prices

Cooldowns

Drop Rates

---

# Hardcoding

Avoid hardcoded gameplay values inside logic.

Gameplay balance belongs in configuration files.

Logic should consume data, not define it.

---

# Error Handling

Always validate external input.

Never assume:

- RemoteEvents are valid.
- Client data is trustworthy.
- Save data exists.

Fail safely whenever possible.

---

# Networking

The server is authoritative.

Clients may request actions.

Servers decide outcomes.

Clients should never directly modify progression.

---

# Data Access

Gameplay systems should never edit another system's internal data directly.

Always communicate through Services.

Example:

Good:

EconomyService:AddCoins()

Bad:

playerData.coins += 100

outside EconomyService.

---

# Performance

Avoid unnecessary loops.

Avoid expensive operations every frame.

Cache frequently used references.

Optimize only after correctness.

---

# AI Requirements

AI-generated code must:

- follow this document;
- respect Folder Structure;
- reuse existing modules;
- avoid duplicate implementations;
- avoid creating parallel architectures;
- never replace stable systems without approval.

AI must extend the project, not redesign it.

---

# Forbidden Practices

The following are prohibited:

- duplicated logic;
- global variables;
- circular dependencies;
- hidden side effects;
- hardcoded balancing values;
- modifying unrelated systems;
- creating new architecture without approval.

---

# Code Review Checklist

Before code is accepted, verify:

- Single responsibility.
- Correct naming.
- Proper folder placement.
- No duplicated logic.
- No hardcoded balance values.
- Uses existing services.
- Respects architecture.
- Easy to understand.
- Easy to maintain.

---

# Success Criteria

The coding standards are successful when:

- Any developer can understand any script.
- AI-generated code matches human-written code.
- Modules remain reusable.
- The project scales without architectural drift.
- Maintenance remains simple.

---

# Coding Principle

> Code should be written once.

> It should remain understandable for years.
