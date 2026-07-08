---
id: OL-SYS-003
title: Pickaxe System
status: Draft
version: 1.0
owner: OreLabs
category: Gameplay System
depends_on:
  - OL-SYS-001
  - OL-SYS-002
last_updated: 2026-07-06
---

# OL-SYS-003 Pickaxe System

## Purpose

The Pickaxe System defines how players unlock, equip, and progress through pickaxes.

Pickaxes are not simple tools for dealing damage.

A pickaxe is a progression key that opens access to better mining performance, faster resource collection, and new stages of gameplay.

---

## Core Philosophy

Pickaxes should feel like meaningful upgrades.

A new pickaxe should not exist only to make old gameplay faster.

It should feel like the player has reached a new stage of progress.

Pickaxes are part of the game's growth structure, not just equipment.

---

## Player Experience

The player should feel:

- I finally have enough Strength for a better Pickaxe.
- My new Pickaxe feels stronger.
- Mining is faster now.
- I can reach better resources.
- I am progressing to the next stage of the game.

A Pickaxe should always feel earned.

---

## System Role

The Pickaxe System connects Strength to Mining.

Strength unlocks pickaxes.

Pickaxes determine mining damage.

Mining damage determines how quickly ores are destroyed.

Ore health determines how long mining takes.

---

## Core Loop

1. Train Strength.
2. Unlock a new Pickaxe.
3. Equip the Pickaxe.
4. Mine Ores faster.
5. Collect more Resources.
6. Sell Resources.
7. Improve Strength.
8. Unlock the next Pickaxe.

---

## Pickaxe Function

Every Pickaxe has a Mining Damage value.

Mining Damage is the main value used to calculate how quickly ores are destroyed.

The Pickaxe does not need special rules for specific ore types.

The system is simple:

- stronger Pickaxe = more damage
- more damage = faster mining
- faster mining = better progression

This keeps the system easy to understand and balance.

---

## Relationship with Ore Health

Ore Health and Pickaxe Damage work together.

A Pickaxe does not define what it can mine through hidden type rules.

Instead, the ore's Health and the pickaxe's Damage determine the speed of mining.

This means:

- weaker pickaxes can still mine stronger ores slowly
- stronger pickaxes mine all ores faster
- progress is always readable through math alone

---

## Progression Rules

Each new Pickaxe should:

- feel like a real upgrade
- increase mining efficiency
- improve progress toward better ores
- support the current Strength stage
- remain relevant even when newer pickaxes appear

A Pickaxe should never become meaningless immediately after being unlocked.

---

## Pickaxe Unlock Rules

Pickaxes are primarily unlocked through Strength.

Some future pickaxes may also require:

- Rebirth milestones
- Blueprints
- Special resources
- Forge progress
- Future world progression

Pickaxes should always remain connected to the broader progression structure.

---

## Design Rules

- Pickaxes must always matter.
- Pickaxes must always improve progression.
- Pickaxes must be easy to understand.
- Pickaxes must not require hidden ore-specific exceptions.
- Pickaxes must not invalidate mining.
- Pickaxes must not become irrelevant too quickly.

---

## Future Extensions

Possible future additions:

- Pickaxe Upgrades
- Pickaxe Skins
- Pickaxe Traits
- Pickaxe Enchantments
- Pickaxe Evolution
- Pickaxe Crafting
- Legendary Pickaxes

These additions may improve progression or customization, but they must not break the core simplicity of the system.

---

## Success Criteria

The Pickaxe System is successful when:

- players feel excited to unlock the next Pickaxe;
- mining speed increases in a clear and satisfying way;
- the system remains simple and readable;
- stronger pickaxes improve progression without adding unnecessary complexity;
- pickaxes stay meaningful throughout the game.

---

## Pickaxe Principle

> A Pickaxe is a progression key.
>
> It unlocks better mining performance through damage, not through special hidden exceptions.
>
> The system should stay simple, readable, and rewarding.
