# Folder Structure

## Purpose

Where files go in the Roblox project.

## Structure

```
src/
├── ReplicatedStorage/ (shared resources)
├── ServerScriptService/ (server code)
├── StarterPlayer/ (client code)
├── StarterGui/ (UI)
├── ServerStorage/ (server assets)
├── Workspace/ (world objects)
└── ReplicatedFirst/ (loading)
```

## Rules

- Server code in ServerScriptService
- Client code in StarterPlayerScripts
- Shared code in ReplicatedStorage
- Assets organized by type

## Related Documents

- [Architecture](Architecture.md)
- [Naming-Conventions](Naming-Conventions.md)