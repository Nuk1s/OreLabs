---
id: OL-CNT-003
title: Ore System
status: Draft
version: 1.0
owner: OreLabs
category: Content System
depends_on:
  - OL-SYS-002
  - OL-SYS-003
  - OL-SYS-004
last_updated: 2026-07-06
---

# OL-CNT-003 Ore System

## Purpose

The Ore System defines every mineable resource in OreLabs.

Ores are the foundation of the mining gameplay loop and the primary source of player progression.

Each Ore should encourage exploration, progression and strategic decision making.

---

## Core Philosophy

Mining should always be an active gameplay experience.

Players should constantly decide which Ore is currently the most efficient to mine based on their Pickaxe, Strength and progression.

Unlocking a new Ore expands progression rather than immediately replacing older Ores.

---

## Player Experience

The player should feel:

- I discovered a new Ore.
- My Pickaxe is finally strong enough.
- I should decide whether to farm this Ore or continue farming older ones.
- I want to become stronger so this Ore becomes profitable.

Mining should constantly create small strategic decisions.

---

## Mining Areas

Each World contains one or more Mining Areas.

Inside each Mining Area, Ores spawn randomly inside predefined spawn zones.

The system continuously maintains a healthy amount of active Ores throughout the area.

---

## Ore Spawning

Ores spawn at random positions inside their Mining Area.

Each newly spawned Ore must respect a configurable minimum spawn distance from every other active Ore.

This prevents:

- overlapping Ores;
- blocked interaction;
- visually cluttered mining areas.

After an Ore is completely mined, it enters a respawn timer before a new Ore appears at another valid spawn location.

---

## Ore Sizes

The system supports multiple Ore sizes.

Examples:

- Small Ore
- Large Ore
- Giant Ore

Larger Ores generally provide:

- higher durability;
- more resource drops;
- higher Gem potential;
- stronger visual presence.

Large and Giant Ores should remain relatively uncommon.

---

## Mining Interaction

Players may swing their Pickaxe at any time.

Damage is only applied while the player is standing inside the interaction radius of an Ore.

All standard Ores share the same interaction radius.

The player does not need to precisely target the Ore.

Standing close enough is sufficient.

---

## Ore Health

Each Ore has Health.

Every successful Pickaxe hit reduces its remaining Health.

A Health Bar appears above the Ore while it is being mined.

The bar disappears after mining is complete or when no player is interacting with the Ore.

---

## Progressive Resource Collection

Resources are awarded progressively during mining.

Instead of receiving everything only after destruction, players receive resources as certain durability milestones are reached.

Example:

- First milestone → Resource x1
- Second milestone → Resource x2
- Final destruction → Resource x3

Additional rewards such as Gems may appear during any reward milestone.

This creates a constant feeling of progression while mining.

---

## Mining Persistence

Ore damage persists.

If a player leaves before fully mining an Ore:

- remaining Health is preserved;
- collected resources remain collected;
- another player may later finish mining it.

Ore Health does not regenerate.

---

## Ore Appearance

Every Ore consists of a stone base combined with visible fragments of its resource material.

Examples:

- coal veins
- crystal formations
- glowing minerals
- metal deposits

The visual appearance should immediately communicate the Ore type.

---

## Rare Ore Events

Rare spawning events may occur.

Examples include:

- Giant Ore
- Legendary Ore
- Future special events

Rare Ores provide significantly greater rewards.

Server-wide notifications may announce their appearance.

These events should create memorable gameplay moments.

---

## Progression Philosophy

Unlocking a new Ore does not automatically make it the best farming target.

New Ores often require more time to mine.

Older Ores may temporarily remain more profitable until the player upgrades their Pickaxe and Strength.

As progression continues, newer Ores naturally become more efficient.

This creates meaningful progression instead of immediate replacement.

---

## Relationship with Other Systems

Depends on:

- Mining System
- Pickaxe System
- Backpack System

Supports:

- Economy
- Gems
- Forge
- Player Progression

---

## Design Rules

- Every Ore should have a purpose.
- Mining should always feel rewarding.
- Ore spawning should remain dynamic.
- Players should constantly make meaningful mining decisions.
- Mining should remain smooth without unnecessary waiting.
- Older Ores should remain temporarily valuable after new Ores are unlocked.

---

## Future Extensions

Possible future additions:

- Event Ores
- Seasonal Ores
- Corrupted Ores
- World-exclusive Ores
- Rare Mutations
- Cooperative Giant Ores

---

## Success Criteria

The Ore System is successful when:

- mining remains enjoyable for long sessions;
- players naturally change farming strategies during progression;
- Ore spawning keeps Mining Areas alive;
- rare Ores create exciting moments;
- progression feels smooth and rewarding.

---

## Ore Principle

> Unlocking a new Ore expands progression.

> Mastering it makes progression efficient.
