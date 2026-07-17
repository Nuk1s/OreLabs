# Production Checklist

## Purpose

Final checklist before shipping.

## Checklist

### Code Quality
- [ ] All files follow naming conventions
- [ ] No debug prints in production
- [ ] All functions documented

### Architecture
- [ ] Single responsibility maintained
- [ ] No duplicate logic
- [ ] Services properly lifecycle-managed

### Networking
- [ ] All remotes validated
- [ ] No client trust
- [ ] Server authority preserved

### Data
- [ ] All data in profile
- [ ] Profile validation working
- [ ] Auto-save functioning

### Security
- [ ] Server validates all inputs
- [ ] No client-side calculations
- [ ] No exposed internal state

### Testing
- [ ] Bootstrap passes
- [ ] No runtime errors
- [ ] All features testable

## Related Documents

- [AI-Self-Review](AI-Self-Review.md)
- [Anti-Patterns](Anti-Patterns.md)