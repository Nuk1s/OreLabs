# Architecture

## Purpose

Project structure and design principles.

## Engineering Overview

OreLabs is built as independent systems. Each has one responsibility, one owner, one data source, one public interface.

## Layers

```
Player → Profile → Core Services → Gameplay Systems → UI
```

## Design Rules

- One Player = One Profile
- Every system owns its own data
- Shared functionality in Services
- Systems communicate through interfaces
- New features extend architecture

## Related Documents

- [Module-Standards](Module-Standards.md)
- [Coding-Standards](Coding-Standards.md)
- [Service-Lifecycle](../STANDARDS/Service-Lifecycle.md)