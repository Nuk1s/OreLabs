# ADR-002: Profile Architecture

## Decision

Use a single Player Profile per player with section-based data ownership.

## Reasoning

- One source of truth
- Easy to validate
- Supports migrations
- Expandable structure

## Alternatives

- Multiple profiles (rejected: complex)
- Direct DataStore access (rejected: insecure)

## Trade-offs

- All data in one place
- Requires careful migration
- Profile size limits

## Status

Approved

## Date

2026-07-06

## Related Documents

- [Architecture](../CORE/Architecture.md)
- [Data-Persistence](../STANDARDS/Data-Persistence.md)