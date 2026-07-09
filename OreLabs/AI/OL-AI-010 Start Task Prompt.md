---
id: OL-AI-010
title: Start Task Prompt
status: Active
version: 1.0
owner: OreLabs
category: AI
depends_on:
  - OL-AI-001
  - OL-AI-009
last_updated: 2026-07-06
---

# OL-AI-010 Start Task Prompt

## Purpose

This document defines the mandatory startup procedure for every AI session working on the OreLabs repository.

Every implementation begins by following this document.

No development work should start before completing this procedure.

---

# Startup Checklist

The AI must complete the following steps in order.

## Step 1 — Repository Synchronization

Read and understand the repository documentation.

Read in the following order:

1. FOUNDATION
2. AI
3. GAME-DISCOVERY
4. DESIGN (when required)
5. ARCHITECTURE
6. DEVELOPMENT

Do not skip documents.

Do not assume previous context is still valid.

---

## Step 2 — Repository Analysis

Determine:

- current repository structure;
- completed systems;
- unfinished systems;
- current development phase;
- dependencies;
- related documentation.

---

## Step 3 — Task Understanding

Before writing code, determine:

- the exact objective;
- the required scope;
- affected systems;
- required modules;
- possible risks.

If the task is ambiguous, stop and request clarification.

---

## Step 4 — Implementation

Implement only the requested scope.

The AI must:

- follow every project standard;
- reuse existing code;
- avoid duplicate systems;
- preserve architecture;
- keep modules independent.

---

## Step 5 — Self Verification

Verify:

- architecture compliance;
- coding standards;
- module standards;
- networking rules;
- save compatibility;
- performance considerations;
- security.

Correct problems before finishing.

---

## Step 6 — Documentation Review

Review whether implementation requires updating:

GAME-DISCOVERY

ARCHITECTURE

DEVELOPMENT

AI documentation

Documentation must never become outdated.

---

## Step 7 — Repository Maintenance

When applicable:

Update:

- Backlog
- Roadmap
- Changelog
- Releases

Update task statuses.

Do not leave completed work undocumented.

---

## Step 8 — Final Report

Provide a structured report including:

Summary

Implemented Features

Created Files

Modified Files

Documentation Updates

Backlog Changes

Known Limitations

Recommended Next Task

---

# Standard Prompt Template

Every development prompt should follow this format:

Objective:

<Describe the requested implementation.>

Requirements:

<Specific requirements for this task.>

Restrictions:

<Anything that must not change.>

Expected Result:

<Describe the expected outcome.>

The AI must automatically complete the startup checklist before implementation.

---

# AI Responsibilities

The AI is responsible for:

- maintaining architecture;
- maintaining documentation;
- maintaining consistency;
- following repository standards;
- reporting implementation status.

The AI is not allowed to redesign the repository without explicit approval.

---

# Success Criteria

The startup procedure is successful when:

- the repository is fully synchronized;
- implementation follows all project standards;
- documentation remains accurate;
- no architectural inconsistencies are introduced.

---

# Start Task Principle

> Synchronize first.

> Understand second.

> Implement third.

> Verify fourth.

> Document fifth.

> Report last.
