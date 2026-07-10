---
id: OL-CNT-001
title: Egg System
status: Draft
version: 1.0
owner: OreLabs
category: Content System
depends_on:
  - OL-SYS-006
  - OL-SYS-007
  - OL-SYS-011
last_updated: 2026-07-06
---

# OL-CNT-001 Egg System

## Purpose

The Egg System is the primary method of obtaining Pets.

Each Egg belongs to a specific game location and represents the player's current stage of progression.

Eggs provide long-term collection goals and encourage players to continuously improve their Pet builds.

---

## Core Philosophy

Eggs are tied to world progression.

As players unlock new locations, they gain access to new Eggs containing stronger and more specialized Pets.

Opening Eggs should always feel exciting.

Finding a rare Pet should create memorable moments.

---

## Player Experience

The player should feel:

- I finally unlocked a new Egg.
- I want to know what's inside.
- Maybe this time I'll get something rare.
- I finally found the Pet I was looking for.

Egg opening should remain enjoyable throughout the entire game.

---

## World Integration

Each location contains its own Egg.

When a player unlocks a new location, a new Egg becomes available.

Eggs naturally follow world progression.

---

## Egg Interface

When the player approaches an Egg, the Egg Interface automatically appears.

When the player leaves the interaction range, the interface automatically closes.

The interface displays:

- Egg Name
- Opening Cost
- Available Pets
- Pet Rarities
- Opening Buttons
- Auto Open Toggle
- Auto Delete Settings

---

## Opening Options

Default:

- Open x1

Game Pass Unlocks:

- Open x3
- Open x8

Future progression may increase these values.

Example:

Open x1 → Open x2

Open x3 → Open x4

Open x8 → Open x9

The system should naturally scale without replacing existing upgrades.

---

## Auto Open

Players may enable Auto Open.

Auto Open functions as an ON/OFF toggle.

When enabled, selecting an opening option continuously opens Eggs until one of the following occurs:

- the player leaves the Egg area;
- Gems are no longer sufficient;
- Auto Open is disabled.

---

## Auto Delete

Players may choose which Pets should be automatically deleted.

Selecting a Pet icon marks it for automatic deletion.

Auto Delete exists to simplify long Egg opening sessions.

---

## Egg Contents

Each Egg contains multiple Pets of different rarities.

Typical rarities include:

- Common
- Uncommon
- Rare
- Epic
- Legendary
- Mythic (optional)
- Secret

The exact contents vary between Eggs.

---

## Secret Pets

Secret Pets are never displayed in the Egg Interface.

The player should not know:

- their appearance;
- their drop chance;
- their abilities.

Secret Pets should remain genuine discoveries.

---

## Pet Information

The Egg Interface does not display Pet abilities.

Players discover Pet bonuses only after obtaining them.

This encourages experimentation and collection.

---

## Economy

Eggs require Gems to open.

Early-game Eggs should feel expensive.

As players progress, Gem income naturally increases through:

- stronger Pets;
- better progression;
- future upgrades.

The feeling of progression should come from improved efficiency rather than reduced costs.

---

## Relationship with Other Systems

Depends on:

- Gem System
- Pet System
- AFK System

Supports:

- Long-term Collection
- Player Progression
- Build Diversity
- Replayability

---

## Design Rules

- Every location should have its own Egg.
- Opening Eggs should always feel rewarding.
- Secret Pets must remain hidden.
- Auto Open should simplify gameplay without replacing progression.
- Auto Delete should reduce repetitive inventory management.
- Pet abilities should remain unknown until obtained.

---

## Future Extensions

Possible future additions:

- Limited-Time Eggs
- Event Eggs
- Seasonal Eggs
- Premium Eggs
- Lucky Egg Events
- Community Egg Events

---

## Success Criteria

The Egg System is successful when:

- Players are excited to unlock new Eggs.
- Rare Pets create memorable moments.
- Older Eggs remain relevant because of unique Pets.
- Auto Open and Auto Delete improve long-term usability.
- Egg progression naturally follows world progression.

---

## Egg Principle

> Every Egg should contain something worth chasing.

> The greatest rewards are the ones players do not know exist.
