---
id: OL-AI-009
title: Development Pipeline
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
last_updated: 2026-07-06
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
- mark unfinished work as completed.

---

# Success Criteria

The Development Pipeline is successful when:

- every implementation follows the same workflow;
- documentation remains synchronized with code;
- architecture stays consistent;
- AI-generated code integrates seamlessly with human-written code;
- development remains predictable and scalable.

---

# Pipeline Principle

> Read first.

> Understand second.

> Implement third.

> Verify fourth.

> Document fifth.

> Report last.
