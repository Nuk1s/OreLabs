---
id: Gameplay-Checklist
title: Gameplay Checklist
status: Active
version: 1.0
owner: OreLabs
category: Development
last_updated: 2026-07-10
---

# Gameplay Checklist

## Purpose

This document tracks the completion status of every gameplay system.

Every future Sprint must update this checklist.

---

# Core Infrastructure

☑ Bootstrap — Server startup

☑ Client Bootstrap — ClientEntry.client.lua

☑ Profile System — DataService profile creation

☑ Profile Validation — Auto-repair missing fields

☑ Internal Events — ProfileCreated, ProfileReady, ProfileReleased

☑ Service Registry — Central service registration

☑ Rojo Synchronization — File-to-instance mapping

---

# Economy System

☑ Equipment Config — 5 tiers with approved values

☑ Backpack Config — 5 tiers with approved capacities

☑ Ore Config — 5 ores with approved HP and values

☑ Area Config — 5 areas with tier requirements

☑ Coins — Primary currency

☐ Gems — Secondary currency (future)

☐ Premium Currency (future)

---

# Strength System

☑ Training — Click-to-train with cooldown

☑ Strength Gain — Reads from equipped equipment

☑ Equipment Progression — 5 tiers, auto-equip on purchase

☑ Strength Persistence — Stored in profile

---

# Equipment System

☑ EquipmentService — Ownership, purchase, equip

☑ EquipmentHandler — BuyEquipment remote

☑ Sequential Ownership — Must own previous tier

☑ Strength Requirement — Validates before purchase

☑ Coin Requirement — Validates before purchase

☑ Auto-Equip — Equips on purchase

---

# Backpack System

☑ BackpackService — Ownership, capacity, ore storage

☑ BackpackHandler — BuyBackpack remote

☑ Sequential Ownership — Must own previous tier

☑ Capacity Upgrade — Increases storage

☑ Ore Storage — Tracks stored ores

☑ Full Protection — Cannot exceed capacity

---

# Mining System

☑ MiningService — Ore damage, destruction, inventory

☑ MiningHandler — MineOre remote

☑ Ore HP — Health per ore type

☑ Mining Damage — Based on equipment

☑ Ore Destruction — Resets on destroy

☑ Inventory Gain — Adds ore to backpack

---

# Selling System

☑ SellService — Sell ores for coins

☑ SellHandler — SellOres remote

☑ Ore Value — Based on ore type

☑ Coin Award — Adds to profile

☑ Inventory Clear — Resets after sell

---

# Area System

☑ AreaService — Area gates, progression

☑ AreaHandler — EnterArea remote

☑ Equipment Tier Gate — Must meet tier requirement

☑ Backpack Tier Gate — Must meet tier requirement

☑ Area Unlock — Unlocks on first access

☑ Area Persistence — Current area stored in profile

---

# HUD System

☑ HUDService — Game state query

☑ HUDHandler — UpdateHUD remote

☑ GameHUD — Client-side display

☑ Strength Display — Shows current strength

☑ Coins Display — Shows current coins

☑ Equipment Display — Shows equipped item

☑ Backpack Display — Shows equipped backpack

☑ Ore Display — Shows stored ores / capacity

☑ Area Display — Shows current area

---

# Telemetry

☑ Debug Logging — Training, mining, selling

☑ Equipment Purchases — Logged on purchase

☑ Backpack Purchases — Logged on purchase

☑ Area Unlocks — Logged on unlock

☐ World Completion Time — Needs runtime tracking

---

# Testing

☑ Starter Kit — Dumbbell + Backpack

☑ Training Works — Strength increases

☑ Mining Works — Ores can be mined

☑ Selling Works — Coins awarded

☑ Equipment Purchase — Validation works

☑ Backpack Purchase — Validation works

☑ Area Gates — Tier requirements enforced

☑ Full Loop — Complete World 1 progression

---

# Multiplayer

☐ Multiple Players — Needs Studio testing

☐ Player Isolation — Profile per player

☐ Concurrent Mining — Ore shared state

☐ Concurrent Selling — Coin calculations

---

# Security

☑ Remote Type Validation — All handlers check types

☑ Profile Readiness — All services validate

☑ Ownership Validation — Purchase checks ownership

☑ Server Authority — All logic on server

☑ No Client Trust — Client sends only IDs

---

# Last Updated

2026-07-10 — Sprint 7.2-7.5