---
id: OL-ARC-005
title: Networking
status: Draft
version: 1.0
owner: OreLabs
category: Architecture
depends_on:
  - OL-ARC-001
  - OL-ARC-002
  - OL-ARC-003
  - OL-ARC-004
last_updated: 2026-07-06
---

# OL-ARC-005 Networking

## Purpose

This document defines the networking architecture used by OreLabs.

Networking is responsible for all communication between the client and the server.

The server is always authoritative.

Clients may request actions but never determine gameplay outcomes.

---

# Core Philosophy

Clients provide input.

Servers make decisions.

Clients display results.

Game progression must never depend on client trust.

---

# Server Authority

The server owns:

- Strength
- Coins
- Gems
- Inventory
- Pets
- Mining
- Rewards
- Rebirths
- World Progression
- Save Data

Clients never modify permanent progression directly.

---

# Client Responsibilities

The client is responsible for:

- Player input
- Camera
- User Interface
- Animations
- Local Effects
- Sounds
- Temporary visual feedback

The client should never calculate gameplay rewards.

---

# Communication Flow

Every interaction follows the same pattern.

```text
Player Input

↓

Client

↓

RemoteEvent / RemoteFunction

↓

Server Validation

↓

Gameplay Logic

↓

Player Profile Update

↓

Replication

↓

Client UI Update
```

The server always validates every request.

---

# RemoteEvents

RemoteEvents are used for one-way communication.

Examples:

- Button clicks
- Mining requests
- Pet equip requests
- Shop purchases
- Egg opening
- Quest interaction

RemoteEvents should never contain trusted gameplay data.

---

# RemoteFunctions

RemoteFunctions are used only when an immediate response is required.

Examples:

- UI requests
- Configuration lookup
- Information queries

Gameplay progression should avoid relying on RemoteFunctions whenever possible.

---

# Validation

Every request must be validated.

Examples:

Mining:

- Is the Ore valid?
- Is the player close enough?
- Does the player have the required Pickaxe?
- Can the Ore currently be mined?

Shop:

- Enough Coins?
- Enough Strength?
- Already owned?

Eggs:

- Enough Gems?
- Correct Egg?
- Player in interaction range?

No request should be trusted automatically.

---

# Anti-Exploit Principles

Never trust:

- client currency
- client inventory
- client rewards
- client cooldowns
- client timers
- client damage
- client positions without validation

Clients may only request actions.

Servers determine the outcome.

---

# Replication

Only necessary information should replicate to clients.

Avoid sending:

- internal calculations
- hidden values
- future content
- unnecessary player data

Replication should remain efficient.

---

# Event Design

Every RemoteEvent should have one responsibility.

Good:

MineOre

EquipPet

BuyPickaxe

OpenEgg

Bad:

GameAction

HandleEverything

GeneralRemote

Events should remain specific.

---

# Network Security

Servers must reject:

- invalid requests
- impossible values
- duplicate actions
- manipulated requests
- out-of-range interactions

Unexpected requests should never crash the game.

---

# Rate Limiting

Gameplay actions should support rate limiting where appropriate.

Examples:

- Egg Opening
- Shop Purchases
- Mining Requests
- Quest Interaction

This protects both gameplay balance and server stability.

---

# Logging

Important networking events may be logged.

Examples:

- suspicious requests
- repeated validation failures
- exploit attempts
- server errors

Logs should assist debugging without affecting gameplay performance.

---

# AI Compatibility

AI-generated networking code must:

- respect server authority;
- validate every request;
- reuse existing RemoteEvents;
- avoid duplicate networking logic;
- follow naming conventions;
- never bypass validation.

---

# Design Rules

- The server owns gameplay.
- The client owns presentation.
- Every request must be validated.
- Every Remote has one responsibility.
- Never trust client data.
- Networking should remain predictable.
- Security comes before convenience.

---

# Success Criteria

The networking architecture is successful when:

- gameplay remains secure;
- exploit opportunities are minimized;
- RemoteEvents remain organized;
- synchronization is predictable;
- new systems integrate without redesigning networking.

---

# Networking Principle

> Clients ask.

> Servers decide.

> Everyone stays synchronized.
