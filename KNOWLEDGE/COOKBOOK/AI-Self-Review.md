# AI Self-Review

## Purpose

Checklist before finishing code.

## Checklist

### Architecture
- [ ] Single responsibility
- [ ] Uses existing services
- [ ] No duplicate logic
- [ ] Profile access through DataService

### Coding Standards
- [ ] PascalCase for modules
- [ ] camelCase for variables
- [ ] No `.module.lua` files
- [ ] All modules return tables

### Service Lifecycle
- [ ] Initialize/Start/Cleanup present
- [ ] Initialize: loads dependencies
- [ ] Start: connects events
- [ ] Cleanup: disconnects events

### Networking
- [ ] Server validates all inputs
- [ ] No FireServer from server
- [ ] Tool.Activated for gameplay

### Data
- [ ] Uses DataService for profile
- [ ] Checks IsProfileReady first
- [ ] No data outside profile

## Related Documents

- [Anti-Patterns](Anti-Patterns.md)
- [Production-Checklist](Production-Checklist.md)