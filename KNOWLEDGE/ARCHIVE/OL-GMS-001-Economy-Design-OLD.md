---
id: OL-GMS-001
title: Economy Design
status: Active
version: 1.0
owner: OreLabs
category: Game Systems
depends_on:
  - OL-GD-005 Economy Discovery
  - OL-SYS-001 Strength System
  - OL-SYS-003 Pickaxe System
  - OL-SYS-004 Backpack System
  - OL-SYS-005 Ore System
last_updated: 2026-07-10
---

# OL-GMS-001 Economy Design

## Purpose

This document is the single source of truth for the entire game economy.

Every price, every requirement, every progression gate is defined or derived from this document.

No gameplay code references values outside this document.

---

# 1. Economy Philosophy

The economy exists to create meaningful progression gates.

Players should never feel stuck.

Players should always have a clear next goal.

Every resource earned should bring the player closer to something tangible.

The economy is not about hoarding. It is about spending to progress.

When a player spends Coins, they should feel stronger, faster, or more capable.

When a player earns Strength, they should feel closer to the next unlock.

The economy must never punish the player for playing.

The economy must reward consistent engagement.

Progression should feel smooth, not exponential.

Early purchases should feel impactful.

Late purchases should feel earned.

---

# 2. Core Principles

## Strength Is Progression

Strength is the primary progression metric.

Strength determines what equipment the player can access.

Strength is never spent. It accumulates permanently until Rebirth.

Strength is the lock. Coins are the key. Both are required.

## Coins Are The Primary Currency

Coins are earned by mining and selling ores.

Coins are spent on equipment and backpack upgrades.

Coins are the fluid resource. They flow in and out constantly.

Coins should never accumulate without purpose.

Every Coin earned should have a clear next purchase.

## Dual-Gate Progression

Every equipment upgrade requires two conditions:

1. Strength requirement — proves the player has progressed
2. Coin price — proves the player has engaged with mining

Neither resource alone is sufficient.

This prevents:
- Pure grinding without mining (strength-only players)
- Pure farming without training (coin-only players)

Both activities must be part of the gameplay loop.

## No Obsolete Upgrades

Every purchase should remain relevant for a meaningful duration.

An upgrade purchased at minute 10 should still feel useful at minute 20.

Upgrades become obsolete only when replaced by a strictly better version.

---

# 3. Gameplay Loop

The complete gameplay loop for OreLabs:

```
Train Strength
    ↓
Gain Strength
    ↓
Unlock stronger equipment (Strength gate)
    ↓
Purchase equipment (Coin gate)
    ↓
Mine stronger ores
    ↓
Fill backpack
    ↓
Sell ores for Coins
    ↓
Purchase backpack upgrade (capacity gate)
    ↓
Mine longer before selling
    ↓
Earn Coins faster
    ↓
Purchase next equipment
    ↓
Repeat
```

Each cycle should take approximately 2-5 minutes in World 1.

The loop accelerates as the player progresses.

Early cycles are slow. Later cycles are fast.

This creates a feeling of accelerating progress.

---

# 4. World Progression

## World 1 Duration

Target: 30-50 minutes for completion.

Completion means:
- All 5 Strength equipment tiers purchased
- All 5 Backpack tiers purchased
- All 5 Ore tiers mined
- Ready for World 2

## Why 30-50 Minutes

- Short enough to feel achievable
- Long enough to feel rewarding
- Short enough to replay (Rebirth)
- Long enough to learn all systems

## World Transitions

World 2 should require:
- All World 1 equipment completed
- Strength threshold reached
- Coins earned sufficient for World 2 entry

Each subsequent world should:
- Introduce new ore types
- Increase equipment tiers
- Increase backpack capacities
- Maintain the same gameplay loop

## Pacing Rule

World N should take approximately 1.5x longer than World N-1.

World 1: 30-50 minutes
World 2: 45-75 minutes
World 3: 68-113 minutes

This creates natural progression without feeling grindy.

---

# 5. Equipment Economy

## World 1 Equipment

5 Strength Equipment tiers.

| Tier | Name | Strength Required | Purpose |
|------|------|-------------------|---------|
| 1 | Starter Dumbbell | 0 | Always owned. Free. |
| 2 | Iron Dumbbell | 50 | First real purchase |
| 3 | Steel Dumbbell | 500 | Mid-game upgrade |
| 4 | Gold Dumbbell | 5,000 | Late-game upgrade |
| 5 | Diamond Dumbbell | 50,000 | End-game goal |

## Pricing Principles

Equipment price should satisfy:

```
Price = BaseCost × TierMultiplier
```

Where:
- BaseCost is the starting price for Tier 2
- TierMultiplier increases geometrically (approximately 10x per tier)

This ensures:
- Early upgrades are affordable
- Later upgrades require meaningful mining
- The player always has a clear next goal

## Strength-to-Price Ratio

The strength requirement and coin price must be proportionally balanced.

A general rule:

```
Minutes to earn coins ≈ Minutes to gain strength
```

If strength takes 5 minutes to gain, coins should also take approximately 5 minutes to earn.

This ensures neither resource becomes a bottleneck.

## Future Equipment

Every world adds 5 equipment tiers.

Higher worlds introduce higher tier multipliers.

Equipment from previous worlds remains owned but becomes obsolete.

---

# 6. Backpack Economy

## World 1 Backpacks

5 Backpack tiers.

| Tier | Name | Capacity |
|------|------|----------|
| 1 | Starter Backpack | 20 |
| 2 | Leather Backpack | 40 |
| 3 | Iron Backpack | 70 |
| 4 | Steel Backpack | 100 |
| 5 | Diamond Backpack | 150 |

## Capacity Progression

Capacity progression follows a specific pattern:

```
20 → 40 → 70 → 100 → 150
```

Each tier provides:
- Tier 2: 2x capacity (100% increase)
- Tier 3: 1.75x capacity (75% increase)
- Tier 4: 1.43x capacity (43% increase)
- Tier 5: 1.5x capacity (50% increase)

The percentage increase decreases as capacity grows.

This prevents late upgrades from feeling disproportionately powerful.

## Upgrade Timing

Backpack upgrades should be purchased:

- Tier 2: When the player first fills the starter backpack repeatedly
- Tier 3: When mining stronger ores that fill capacity faster
- Tier 4: When the player can mine long enough to benefit from extra capacity
- Tier 5: When the player is preparing for World 2

Each backpack upgrade should feel like a quality-of-life improvement, not a requirement.

## Pricing Principles

Backpack prices should satisfy:

```
Price ≈ Average Coins earned during the time it takes to fill the current backpack twice
```

This ensures the player can afford the upgrade after a reasonable mining session.

---

# 7. Ore Economy

## World 1 Ores

5 Ore types.

| Ore | HP | Approximate Value |
|-----|-----|-------------------|
| Stone | 10 | Base value |
| Coal | 50 | 3x Stone |
| Copper | 100 | 6x Stone |
| Iron | 150 | 10x Stone |
| Gold | 350 | 20x Stone |

## HP Scaling

Ore HP scales to match equipment power:

```
Ore HP ≈ Equipment Damage × Time to Mine
```

Where Time to Mine is approximately 2-5 seconds per ore at the appropriate equipment tier.

This ensures:
- Each ore tier requires the appropriate equipment
- Mining feels consistent across tiers
- No ore becomes trivially easy or impossibly hard

## Value Scaling

Ore value should satisfy:

```
Value = BaseValue × TierMultiplier
```

Where TierMultiplier increases approximately 2-3x per tier.

This ensures:
- Higher ores are worth significantly more
- The player is incentivized to progress
- Mining time is proportional to reward

## Fill Time

The time to fill a backpack should be:

```
Fill Time = Capacity / (Mine Time × Ore Value Ratio)
```

Where:
- Capacity is the current backpack capacity
- Mine Time is the average time to mine one ore
- Ore Value Ratio is how many ores fit per inventory slot

Target fill times:
- Tier 1 Backpack: 30-60 seconds
- Tier 5 Backpack: 2-4 minutes

This creates a natural rhythm of mining and selling.

---

# 8. Currency

## Coins

Primary currency.

Earned by selling ores.

Spent on equipment and backpacks.

Coins are the most fluid resource.

Coins should never accumulate without a clear next purchase.

## Gems (Future)

Secondary currency.

Earned through special activities (eggs, quests, events).

Spent on premium items and cosmetics.

Gems are rarer than Coins.

Gems should feel valuable and special.

## Premium Currency (Future)

Purchased with real money.

Used for exclusive items and shortcuts.

Must never provide unfair competitive advantage.

Must never be required for progression.

Premium currency is optional, not essential.

---

# 9. Balancing Methodology

## Never Balance By Intuition

Every balancing decision must be backed by data.

Guessing leads to inconsistent progression.

Measurement leads to predictable outcomes.

## Balance Using Metrics

Before changing any value:
1. Measure the current metric
2. Calculate the desired metric
3. Determine the exact change needed
4. Implement the change
5. Re-measure to verify

## The Balancing Equation

For any upgrade, verify:

```
Time to earn Coins ≈ Time to gain Strength
```

If Coins are earned faster than Strength, the coin price is too low.

If Strength is gained faster than Coins, the strength requirement is too high.

## Iterative Balancing

Balance in small steps.

Never change multiple values simultaneously.

Change one value, measure the impact, then change the next.

---

# 10. Metrics

## Average Coins per Minute

How many Coins does the player earn per minute of active mining?

Target for World 1: 50-200 Coins per minute (varies by equipment tier)

## Average Strength per Minute

How much Strength does the player gain per minute of active training?

Target for World 1: 5-20 Strength per minute (varies by equipment tier)

## Average Time to Equipment

How long does it take to purchase each equipment tier?

Target for World 1:
- Tier 2: 2-3 minutes
- Tier 3: 5-8 minutes
- Tier 4: 10-15 minutes
- Tier 5: 20-30 minutes

## Average Time to Backpack

How long does it take to purchase each backpack tier?

Target for World 1:
- Tier 2: 2-4 minutes
- Tier 3: 5-8 minutes
- Tier 4: 8-12 minutes
- Tier 5: 15-20 minutes

## Average Inventory Fill Time

How long does it take to fill the current backpack?

Target for World 1:
- Tier 1: 30-60 seconds
- Tier 2: 45-90 seconds
- Tier 3: 60-120 seconds
- Tier 4: 90-180 seconds
- Tier 5: 120-240 seconds

## Average World Completion Time

How long does it take to complete all progression in a world?

Target for World 1: 30-50 minutes

---

# 11. AI Rules

## Never Invent Prices

AI must never create arbitrary prices.

All prices must be derived from the balancing methodology.

If a price is unclear, AI must request clarification.

## Preserve Progression Pacing

AI must never change values that affect progression timing without explicit approval.

Progression pacing is a core design decision.

## Explain Every Change

AI must explain every economic change mathematically.

"Feels better" is not a valid explanation.

"Reduces time to equipment by 15%" is a valid explanation.

## Document Every Change

Every economic change must be recorded in the Changelog.

The Changelog must include the metric before and after the change.

---

# 12. Future Systems

## Pets

Pets will provide multipliers to:
- Strength gain
- Coin earnings
- Mining speed

Pet multipliers must not break the balancing equation.

If a pet doubles Coin earnings, the equipment price must also double.

## Forge

The Forge will allow crafting equipment from materials.

Crafted equipment must maintain the same balancing rules as purchased equipment.

Crafting cost must be equivalent to purchasing cost.

## Rebirth

Rebirth will reset Strength and equipment.

Rebirth rewards must provide permanent multipliers.

Rebirth multipliers must be carefully balanced to avoid inflation.

## Enchantments

Enchantments will provide temporary or permanent bonuses.

Enchantment bonuses must not exceed reasonable bounds.

Enchantment systems must be optional, not required.

## Future Worlds

Each new world must follow the same balancing methodology.

New worlds must introduce new ore types, equipment tiers, and backpack capacities.

The gameplay loop must remain consistent across all worlds.

---

# Success Criteria

The economy design is successful when:

- Players always have a clear next goal
- No purchase feels meaningless
- Progression feels smooth and consistent
- Balancing can be performed mathematically
- Future systems integrate without redesign
- The economy scales to multiple worlds

---

# Economy Design Principle

> Every number exists for a reason.

> Every price has a justification.

> Every progression gate serves the player.