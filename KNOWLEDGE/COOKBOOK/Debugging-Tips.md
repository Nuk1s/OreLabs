# Debugging Tips

## Purpose

How to find and fix bugs.

## Common Errors

| Error | Cause | Fix |
|-------|-------|-----|
| `attempt to index nil` | Missing require | Add require |
| `Infinite yield` | WaitForChild on missing object | Check object exists |
| `FireServer from server` | Using FireServer in server | Use FireClient or Tool.Activated |
| `not a valid member` | Wrong instance name | Check Rojo sync |

## Debug Steps

1. Check Output for errors
2. Verify all requires exist
3. Check Bootstrap validation
4. Use DebugService for logging

## Related Documents

- [Anti-Patterns](Anti-Patterns.md)
- [AI-Self-Review](AI-Self-Review.md)