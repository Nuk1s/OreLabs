# Naming Conventions

## Purpose

File and variable naming rules.

## Rules

- **PascalCase** — Files, Modules, Services, Folders
- **camelCase** — Variables, parameters
- **UPPER_SNAKE_CASE** — Constants
- **No `.module.lua`** — Use `.lua` for ModuleScripts

## Examples

```lua
-- Good
local StrengthService = {}
local playerData = {}
local MAX_LEVEL = 100

-- Bad
local strength_service = {}
local PlayerData = {}
local maxLevel = 100
```

## Related Documents

- [Coding-Standards](Coding-Standards.md)
- [Module-Standards](Module-Standards.md)