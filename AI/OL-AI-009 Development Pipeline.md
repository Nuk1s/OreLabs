---
id: OL-AI-009
title: Development Pipeline
status: Active
version: 2.0
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
last_updated: 2026-07-10
---

# OL-AI-009 Development Pipeline

## Purpose

This document defines the mandatory workflow that every AI assistant must follow while working on the OreLabs repository.

The objective is to guarantee consistent development, preserve architecture integrity and ensure documentation always matches implementation.

No AI may skip this pipeline.

---

# Core Philosophy

AI is a development partner.

AI does not invent its own architecture.

AI follows the existing project.

Every implementation must improve the repository rather than create inconsistencies.

---

# Phase 1 — Repository Synchronization

Before writing any code, the AI must synchronize with the repository.

Mandatory reading order:

1. FOUNDATION
2. AI
3. GAME-DISCOVERY
4. DESIGN (when relevant)
5. ARCHITECTURE
6. DEVELOPMENT

The AI must understand the current state of the repository before making any changes.

---

# Phase 2 — Task Analysis

Before implementation, the AI must determine:

- task objective;
- affected systems;
- dependencies;
- related documents;
- affected modules;
- potential risks.

If the requested implementation conflicts with the documentation, the AI must stop and report the conflict before writing code.

---

# Phase 3 — Implementation

The AI must:

- follow Architecture;
- follow Coding Standards;
- follow Module Standards;
- follow Folder Structure;
- reuse existing systems;
- avoid duplicated logic;
- avoid parallel implementations.

Implementation must remain modular and maintainable.

---

# Phase 4 — Self Review

Before finishing, the AI must review its own work.

Checklist:

- Architecture compliance
- Coding Standards compliance
- Module Standards compliance
- Folder Structure compliance
- Networking compliance
- Save System compatibility
- Performance considerations
- Security validation

Any detected issue should be corrected before completion.

---

# Stage X — Syntax Validation (Mandatory)

Before declaring any task, sprint, or implementation complete, the AI must verify that all modified executable source files are syntactically valid.

Mandatory validation:

• Every modified Lua file must be parsable by Luau.
• Every modified .server.lua file must be parsable.
• Every modified .client.lua file must be parsable.
• Every modified .module.lua file must be parsable.

The AI must additionally verify:

• No incomplete statements remain.
• No unmatched brackets, parentheses, or quotes exist.
• No malformed function declarations exist.
• No invalid require() syntax exists.
• No executable file contains non-Lua syntax (including YAML Front Matter).
• The first executable line of every source file is valid Lua.

If any syntax error is detected, the sprint MUST NOT be considered complete.

The AI must fix every syntax error before generating the final report.

A sprint is considered complete only after all modified executable files successfully pass syntax validation.

---

# Stage X+1 — Bootstrap Validation (Mandatory)

If executable gameplay code was modified, the AI must verify that the project can successfully reach Bootstrap initialization.

Minimum validation:

• Bootstrap starts.
• No startup syntax errors occur.
• All modified modules can be required successfully.
• No broken dependency chain exists.
• No invalid module paths exist.

Only after Bootstrap validation passes may the sprint be reported as complete.

---

# Stage X+2 — Rojo Synchronization Validation (Mandatory)

Whenever the repository structure changes, the AI must assume that Roblox Studio may become out of sync with the file system.

Repository structure changes include:

- file rename
- folder rename
- moving files
- moving folders
- deleting files
- creating executable files (.lua, .server.lua, .client.lua, .module.lua)
- changing default.project.json

## Mandatory Procedure

If any repository structure changed:

1. Inform the developer that Rojo synchronization is required.
2. Require restarting the Rojo server.
3. Require reconnecting the Roblox Studio plugin.
4. Require verifying that every renamed ModuleScript actually exists inside Roblox Studio Explorer.
5. Require verifying that every require() target exists in the Explorer hierarchy.
6. Require performing a real startup test inside Roblox Studio.

## Why This Stage Exists

File-system validation and syntax validation are insufficient. Rojo maintains an internal mapping between the file system and Roblox instances. When files are renamed, moved, or deleted, Rojo may not automatically update its mapping until the server is restarted. This causes stale instance references that produce runtime errors despite correct code.

## Definition of Done

A sprint modifying repository structure cannot be considered complete until:

- Rojo restarted
- Studio reconnected
- Explorer hierarchy verified
- Bootstrap executed successfully in Studio
- No startup errors remain

---

# Stage X+3 — Runtime Startup Validation (Mandatory)

The AI must never assume Bootstrap starts correctly.

Bootstrap startup must be confirmed by a successful execution inside Roblox Studio.

## Rules

1. Reports generated without an actual successful startup confirmation are considered incomplete.
2. The AI must not claim "Bootstrap passes" based solely on file-system checks or require-chain analysis.
3. Runtime startup validation requires the game to actually run inside Roblox Studio without errors.
4. If Studio access is unavailable, the report must explicitly state: "Runtime startup validation pending — Studio not available."

## Why This Stage Exists

Static analysis (checking files exist, require paths resolve, syntax is valid) does not guarantee runtime correctness. Instance parenting, Rojo sync state, service availability, and engine behavior can only be verified by running the game.

---

# Phase 5 — Documentation Review

After implementation, the AI must determine whether documentation requires updates.

Possible updates include:

## GAME-DISCOVERY

When gameplay behavior changes.

---

## ARCHITECTURE

When implementation architecture changes.

---

## DEVELOPMENT

Update when applicable:

- OL-DEV-001 Backlog
- OL-DEV-002 Changelog
- OL-DEV-003 Releases
- OL-DEV-004 Roadmap

Documentation must always match the implementation.

---

# Phase 6 — Repository Update

If a task is completed:

- update task status;
- update progress;
- preserve repository consistency.

Completed work must remain traceable.

Nothing should be silently changed.

---

# Phase 7 — Final Report

Every completed task must end with a structured report.

The report should include:

## Summary

Short description of completed work.

---

## Implemented

List of implemented systems.

---

## Files Created

New files added.

---

## Files Modified

Existing files modified.

---

## Documentation Updated

List every updated document.

---

## Backlog Status

Updated tasks.

---

## Risks

Known issues or limitations.

---

## Recommendations

Suggested next steps.

---

# Definition of Done

A task is complete only when:

- implementation is complete;
- code follows project standards;
- architecture remains consistent;
- syntax validation passes;
- bootstrap validation passes (when executable code was modified);
- rojo synchronization validation passes (when repository structure changed);
- runtime startup validation passes (when executable code was modified);
- documentation is updated;
- backlog is updated;
- roadmap is updated (when applicable);
- changelog is updated (when applicable);
- release notes are updated (when applicable);
- final review is complete.

Writing code alone does not complete a task.
---

# Forbidden Practices

The AI must never:

- ignore repository documentation;
- bypass architecture;
- duplicate systems;
- silently modify existing behavior;
- leave documentation outdated;
- skip self-review;
- mark unfinished work as completed;
- claim Bootstrap passes without Studio runtime confirmation;
- claim Rojo sync is complete without restarting the server after file renames;
- skip Rojo synchronization validation when repository structure changes.

---

# Success Criteria

The Development Pipeline is successful when:

- every implementation follows the same workflow;
- documentation remains synchronized with code;
- architecture stays consistent;
- AI-generated code integrates seamlessly with human-written code;
- development remains predictable and scalable;
- Rojo synchronization is validated after every structural change;
- runtime startup is confirmed inside Roblox Studio.

---

# Pipeline Principle

> Read first.

> Understand second.

> Implement third.

> Verify fourth.

> Document fifth.

> Report last.

---

# Runtime Validation

When the sprint modifies executable code, the AI must verify that the project can reach Bootstrap initialization without syntax errors before reporting completion.

Additionally, when repository structure changes (file renames, moves, deletes, new executable files), the AI must:

1. Verify Rojo synchronization reflects the current file system.
2. Confirm Bootstrap executes successfully inside Roblox Studio.
3. Never claim success based on static analysis alone.
