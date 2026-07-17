# Module Standards

## Purpose

How to create modules in OreLabs.

## Module Types

- **Services** — Own gameplay domains
- **Managers** — Handle operational logic
- **Controllers** — Client-side behavior
- **Utilities** — Reusable helpers

## Lifecycle

```lua
local Module = {}

function Module:Initialize() end
function Module:Start() end
function Module:Cleanup() end

return Module
```

## Rules

- One module = one problem
- Clear public API
- Explicit dependencies
- Always return a table

## Related Documents

- [Architecture](Architecture.md)
- [Service-Lifecycle](../STANDARDS/Service-Lifecycle.md)