# ADR-001: SSA Architecture

## Decision

Use Server-Side Architecture (SSA) for all gameplay systems.

## Reasoning

- Server is authoritative
- Prevents exploits
- Simplifies validation
- Centralizes game logic

## Alternatives

- Client-side architecture (rejected: insecure)
- Hybrid architecture (rejected: complex)

## Trade-offs

- More server load
- Requires remote events
- Slightly higher latency

## Status

Approved

## Date

2026-07-06

## Related Documents

- [Architecture](../CORE/Architecture.md)
- [Networking-Rules](../STANDARDS/Networking-Rules.md)