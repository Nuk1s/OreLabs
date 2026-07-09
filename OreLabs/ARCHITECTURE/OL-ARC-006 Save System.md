---
id: OL-ARC-006
title: Save System
status: Draft
version: 1.0
owner: OreLabs
category: Architecture
depends_on:
  - OL-ARC-001
  - OL-ARC-005
last_updated: 2026-07-06
---

# OL-ARC-006 Save System

## Purpose

This document defines the persistence architecture used by OreLabs.

The Save System is responsible for loading, validating, updating and safely storing every player's permanent progression.

The system must remain reliable, scalable and backward compatible throughout the lifetime of the project.

---

# Core Philosophy

Every player owns exactly one persistent profile.

The profile is loaded once.

It remains active while the player is connected.

It is safely released when the player leaves.

Saving should happen automatically.

Players should never manually save their progress.

---

# Save Lifecycle

```text
Player Joins

↓

Load Profile

↓

Validate Profile

↓

Apply Data Migrations

↓

Start Gameplay

↓

Automatic Saving

↓

Player Leaves

↓

Final Save

↓

Release Profile
```

Every player follows the same lifecycle.

---

# Player Profile

The Save System stores the Player Profile defined in OL-ARC-001.

Examples include:

- Progression
- Economy
- Inventory
- Pets
- Worlds
- Statistics
- Settings
- Unlocks

The Save System never owns gameplay logic.

It only stores and retrieves data.

---

# Automatic Saving

Player data should be saved automatically at regular intervals.

Automatic saving reduces data loss caused by:

- server shutdown;
- crashes;
- disconnects;
- unexpected errors.

The save interval should remain configurable.

---

# Final Save

When a player leaves:

- all pending changes are committed;
- the profile is saved;
- the profile is released.

No player profile should remain locked after disconnecting.

---

# Data Validation

Loaded data must always be validated.

Examples:

- missing values;
- invalid data types;
- corrupted structures;
- obsolete fields.

Invalid data should be repaired using safe defaults whenever possible.

---

# Versioning

Every Player Profile contains a version number.

When the save format changes:

- detect the profile version;
- migrate outdated data;
- preserve existing progress;
- update the version.

Players should keep their progress across updates.

---

# Data Migration

Migration should never delete valid progression.

New systems should introduce new fields with sensible defaults.

Old save files should remain compatible whenever possible.

---

# Error Handling

If saving fails:

- retry safely;
- log the error;
- prevent profile corruption.

Unexpected save failures should never crash gameplay.

---

# Ownership Rules

Only the Save System may:

- load profiles;
- save profiles;
- release profiles.

Gameplay systems must request changes through their own Services.

Gameplay systems must never write directly to persistent storage.

---

# Data Flow

```text
Gameplay System

↓

Service

↓

Player Profile

↓

Save System

↓

Persistent Storage
```

This keeps responsibilities clearly separated.

---

# Security

Clients never interact with persistent storage.

All save operations occur on the server.

Save data must never depend on client-provided values.

---

# Future Expansion

The Save System should support future features such as:

- new gameplay systems;
- additional currencies;
- seasonal progression;
- achievements;
- guilds;
- trading.

The architecture should grow without requiring a complete redesign.

---

# AI Compatibility

AI-generated code must:

- never bypass the Save System;
- never save gameplay directly;
- never duplicate persistence logic;
- always use the approved save pipeline.

---

# Design Rules

- One Player = One Profile.
- One Profile = One Save Pipeline.
- Saving is automatic.
- Profiles are versioned.
- Data is validated.
- Services own gameplay.
- The Save System owns persistence.

---

# Success Criteria

The Save System is successful when:

- players never lose progress during normal gameplay;
- updates preserve existing profiles;
- save files remain compatible;
- new systems integrate without redesigning persistence;
- save operations remain invisible to the player.

---

# Save Principle

> Gameplay changes data.

> The Save System preserves it.

> Nothing else writes to permanent storage.
