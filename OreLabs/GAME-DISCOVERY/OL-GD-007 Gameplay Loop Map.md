# OL-GD-007 — Gameplay Loop Map

Version: 1.0
Status: Draft
Owner: Game Design
Depends On:
- OL-GD-003 Core Gameplay Loop
- OL-GD-004 Progression Philosophy
- OL-GD-006 Game Systems

---

# Purpose

This document visualizes how all core gameplay systems interact.

The Gameplay Loop Map serves as the architectural blueprint of the game's progression ecosystem.

Every future mechanic should connect to this map instead of creating an isolated gameplay loop.

---

# Primary Progression Loop

Strength
↓
Unlock Better Pickaxes
↓
Mine Better Ores
↓
Sell Resources
↓
Earn Coins
↓
Train More Strength
↺

This is the primary gameplay engine.

Every other system exists to support, accelerate or expand this loop.

---

# Expansion Systems

## Backpack

Coins
↓

Upgrade Backpack
↓

Longer Mining Sessions
↓

More Resources
↓

Return to Primary Loop

---

## Pets

Gems
↓

Open Eggs
↓

Obtain Better Pets
↓

Gain Specialized Bonuses
↓

Increase Progression Efficiency
↓

Return to Primary Loop

---

## Rebirth

Reach Chapter Limit
↓

Perform Rebirth
↓

Receive Permanent Bonuses
↓

Unlock New Chapter
↓

New Locations
↓

New Pickaxes
↓

New Ores
↓

Return to Primary Loop

---

# System Relationships

Primary Loop

├── Backpack
├── Pets
├── Rebirth
└── Future Systems

Future systems must always connect back to the Primary Loop.

---

# Future Integration Points

Examples include:

- Forge
- Titles
- Crafting
- Enchantments
- Artifacts
- Events
- World Modifiers

Every future system should either:

- expand progression;
- increase player choice;
- improve efficiency;
- unlock new gameplay.

None should replace the Primary Loop.

---

# Design Rules

When introducing a new system, ask:

1. Which existing loop does it strengthen?
2. Which player decision does it create?
3. Does it increase meaningful choice?
4. Does it support long-term progression?
5. Does it preserve the importance of existing systems?

If a system cannot answer these questions, it should be redesigned.

---

# Gameplay Loop Principle

The player should never feel that they are leaving the game to interact with another mechanic.

Every mechanic is part of one connected progression ecosystem.

There is only one game.

Every system exists to make that game deeper.
