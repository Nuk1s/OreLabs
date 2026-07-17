---
id: OL-AI-011
title: External Solution Evaluation
status: Active
version: 1.0
owner: OreLabs
category: AI
depends_on:
  - OL-AI-001
  - OL-AI-002
  - OL-AI-003
  - OL-AI-004
  - OL-AI-005
  - OL-AI-006
  - OL-AI-007
  - OL-AI-008
  - OL-AI-009
last_updated: 2026-07-10
---

# OL-AI-011 External Solution Evaluation

## Purpose

This document defines the mandatory evaluation process that every AI assistant must follow before implementing any major gameplay mechanic.

The objective is to reduce development time by reusing proven ideas while preserving the OreLabs architecture and design philosophy.

External solutions are implementation references only.

OreLabs architecture always has higher priority.

---

# Core Principle

Before implementing any major gameplay mechanic, the AI must determine whether a high-quality existing solution already exists.

The AI must **research first** and **implement second**.

External solutions are references.

OreLabs remains the source of truth.

---

# Allowed Research Sources

The AI may research implementation ideas from:

- Roblox Creator Store
- Roblox Creator Hub
- Roblox DevForum
- Official Roblox Documentation
- Open-source Roblox GitHub repositories

Research is permitted.

Automatic importing is strictly forbidden.

---

# Allowed Research Categories

The AI may research the following gameplay systems:

## Gameplay Systems

- Pet System
- Egg System
- Inventory System
- Equipment System
- NPC Dialogue System
- Quest System
- Notification System
- Shop System
- Settings System
- UI Systems
- Animation Controller
- Camera Controller
- Pathfinding
- Minimap
- Sound Manager
- VFX Manager
- Interaction System
- Tutorial System
- Damage Numbers
- Health Bars
- Resource Spawner
- Mining System
- Ore System
- Ore Visual Effects
- Crafting System
- Forge System
- Rebirth System
- Strength System
- Trading System

Research is allowed even for systems already defined inside OreLabs.

The purpose is to gather implementation ideas and best practices, never to replace the existing game design.

---

# Forbidden Research Targets

The AI must never search for complete replacements of the following core systems:

- Bootstrap
- Service Registry
- Player Runtime
- Profile Runtime
- DataService
- Save System
- Networking
- Core Architecture
- Folder Structure
- AI Pipeline
- Development Pipeline

These systems define OreLabs itself and must always remain internally designed.

---

# Mandatory Evaluation Process

Before implementing any major gameplay mechanic, the AI must:

1. Search for existing solutions.
2. Select no more than five candidates.
3. Evaluate every candidate.
4. Produce an Evaluation Report.
5. Wait for project owner approval.

Implementation may begin only after approval.

---

# Evaluation Report Format

Each candidate must include:

- Asset Name
- Author
- Source
- Price
- Advantages
- Disadvantages
- Features that can be reused
- Required modifications
- Architecture compatibility
- Final recommendation

---

# Approval Rule

The AI must never:

- import assets automatically;
- download assets automatically;
- purchase paid assets;
- copy source code directly;
- integrate external systems without approval;
- replace OreLabs systems with third-party systems.

The Evaluation Report must always be presented before implementation begins.

---

# Adaptation First Principle

If an external solution is approved:

- Adapt the external solution to OreLabs.
- Never adapt OreLabs to the external solution.
- Preserve the existing project architecture.
- Follow all Architecture, Coding Standards and Module Standards documents.

OreLabs architecture always has higher priority.

---

# Quality Requirements

The AI should prioritize solutions that are:

- actively maintained;
- modular;
- well documented;
- performant;
- server-authoritative;
- scalable;
- compatible with modern Roblox development practices.

The AI should avoid:

- obsolete assets;
- abandoned projects;
- duplicated systems;
- hardcoded implementations;
- poor architecture;
- client-authoritative gameplay.

---

# Success Criteria

This document is successful when:

- Every gameplay mechanic is researched before implementation.
- No external asset enters the project without explicit approval.
- OreLabs architecture remains consistent.
- Development time is reduced through informed reuse.
- External solutions improve implementation without controlling project design.
- AI uses external resources as references rather than dependencies.