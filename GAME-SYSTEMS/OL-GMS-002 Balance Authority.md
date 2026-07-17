---
id: OL-GMS-002
title: Balance Authority
status: Active
version: 1.0
owner: OreLabs
category: Game Systems
depends_on:
  - OL-GMS-001
last_updated: 2026-07-10
---

# OL-GMS-002 Balance Authority

## Purpose

This document defines the authority responsible for gameplay balance inside OreLabs.

---

## Source of Truth

Approved Economy documents are the single source of truth.

Examples:

- OL-GMS-001 Economy Design
- Future approved economy revisions

Gameplay implementation must follow these documents exactly.

---

## Authority

Only approved Economy revisions may change:

- prices
- strength requirements
- ore HP
- ore values
- backpack capacities
- progression timings
- reward values
- scaling coefficients

---

## AI Responsibilities

### ChatGPT

Technical Director

- approves balance philosophy
- approves economy revisions
- coordinates implementation

### Codex

Lead Systems & Economy Engineer

- creates mathematical models
- validates progression
- performs economy reviews
- performs stress tests
- proposes balance changes

### MIMO

Lead Gameplay Engineer

- implements approved values
- never rebalances gameplay
- never changes economy values
- reports implementation issues instead of modifying balance

---

## Economy Freeze Rule

After an economy revision is approved:

Implementation must use the approved values exactly.

No gameplay implementation may change them.

---

## Playtest Rule

Playtests generate telemetry.

Telemetry does NOT immediately modify balance.

All balance changes require a new approved economy revision.

---

## Versioning

Economy

↓

Implementation

↓

Playtesting

↓

Telemetry

↓

Review

↓

Next Economy Revision