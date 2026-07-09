---
id: OL-ARC-008
title: Debugging
status: Draft
version: 1.0
owner: OreLabs
category: Architecture
depends_on:
  - OL-ARC-001
  - OL-ARC-003
  - OL-ARC-004
  - OL-ARC-005
  - OL-ARC-006
last_updated: 2026-07-06
---

# OL-ARC-008 Debugging

## Purpose

This document defines the debugging standards used throughout OreLabs.

Debugging should help developers quickly locate, understand and resolve issues without affecting gameplay stability.

---

# Core Philosophy

Errors should be easy to identify.

Problems should be reproducible.

Every error should provide enough information to understand its cause.

Debugging tools exist to solve problems, not hide them.

---

# Logging

Meaningful events should be logged.

Examples:

- Player Joined
- Player Left
- Profile Loaded
- Profile Saved
- Rebirth Completed
- Purchase Completed
- Quest Completed

Logs should clearly describe what happened.

---

# Error Logging

Unexpected errors should always be reported.

Logs should include:

- System Name
- Operation
- Error Message
- Player (if applicable)
- Timestamp

Errors should never fail silently.

---

# Debug Levels

Logging should support different levels.

## Info

Normal system activity.

Example:

Profile loaded successfully.

---

## Warning

Unexpected but recoverable situations.

Example:

Missing optional configuration.

---

## Error

A feature failed but the server continues running.

Example:

Failed to save player profile.

---

## Critical

A severe issue requiring immediate attention.

Example:

Core service failed to initialize.

---

# Debug Mode

The project should support a dedicated Debug Mode.

When enabled, additional diagnostic information may be displayed.

Debug Mode must never be enabled in production unless intentionally required.

---

# Validation

Before reporting an error, systems should validate:

- required parameters;
- object existence;
- player state;
- configuration values;
- permissions.

Preventing invalid operations is better than handling crashes.

---

# Safe Failure

When an operation fails:

- stop the current action safely;
- preserve player progress whenever possible;
- report the issue;
- allow the server to continue operating.

One failed action should not break the entire game.

---

# AI Compatibility

AI-generated code must:

- produce meaningful error messages;
- avoid empty warnings;
- never suppress unexpected errors;
- respect Debug Mode;
- follow the project's logging standards.

---

# Forbidden Practices

The following are prohibited:

- silent failures;
- empty catch blocks;
- misleading log messages;
- excessive console spam;
- disabling errors without fixing the cause.

---

# Review Checklist

Before code is accepted, verify:

- meaningful logs exist;
- errors are easy to identify;
- warnings are useful;
- failures are handled safely;
- debugging information remains readable.

---

# Success Criteria

The debugging standards are successful when:

- developers can quickly locate problems;
- AI-generated logs are understandable;
- production logs remain clean;
- failures do not corrupt gameplay;
- debugging speeds up development.

---

# Debugging Principle

> Every error should explain itself.

> Every fix should remove the cause, not hide the symptom.
