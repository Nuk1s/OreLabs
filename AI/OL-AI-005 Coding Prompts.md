---
Document: OreLabs Coding Prompts

ID: OL-AI-005

Version: 0.1

Status: Draft

Owner: Founder

Maintainer: Chief Systems Architect

Category: AI Framework

Created: 2026-07-05

Last Updated: 2026-07-05

Next Review: v1.0

Depends On:
- OL-FND-004
- OL-FND-005
- OL-AI-001
- OL-AI-002
- OL-AI-003
- OL-AI-004

Related Documents:
- OL-AI-006
- OL-AI-008
---

# OreLabs Coding Prompts

## Purpose

This document defines the standard for creating coding prompts within OreLabs Studio.

Its purpose is to ensure that every coding request follows a consistent engineering process regardless of the AI model used.

Coding prompts SHALL prioritize architecture, maintainability and documentation over implementation speed.

---

# Coding Philosophy

Code is an implementation.

Documentation defines the implementation.

Architecture defines the documentation.

AI implements architecture.

AI does not invent architecture.

---

# Standard Coding Prompt Structure

Every coding prompt SHOULD follow the following structure.

Role

↓

Objective

↓

Project Context

↓

Relevant Documentation

↓

Requirements

↓

Constraints

↓

Implementation Scope

↓

Expected Output

↓

Validation

---

# Rule 1 — Read Before Code

AI SHALL identify and read all required project documentation before writing code.

Required documentation MAY include:

- Constitution
- Workflow
- AI Context
- Engineering Specifications
- System Documentation

Implementation SHALL NOT begin without sufficient context.

---

# Rule 2 — Code Only Approved Systems

AI SHALL implement only approved specifications.

If no approved specification exists, implementation SHALL stop and clarification SHALL be requested.

---

# Rule 3 — Define Implementation Scope

Every coding prompt SHALL explicitly define what the AI is allowed to modify.

Examples

Allowed:

- One module
- One UI
- One function
- One gameplay system

Not Allowed:

"Improve the project."

---

# Rule 4 — Preserve Existing Architecture

AI SHALL preserve:

- Folder structure
- Naming conventions
- APIs
- Documentation consistency

Architecture SHALL NOT be redesigned during implementation unless explicitly approved.

---

# Rule 5 — Minimize Changes

AI SHOULD modify only the code required to complete the task.

Unrelated systems SHALL remain unchanged.

---

# Rule 6 — Explain Major Decisions

If implementation requires a non-obvious decision, AI SHALL explain:

- Why the decision was made.
- Which requirement it satisfies.
- Any trade-offs introduced.

---

# Rule 7 — Preserve Compatibility

AI SHALL avoid changes that break existing systems unless the prompt explicitly permits breaking changes.

Backward compatibility SHOULD be maintained whenever practical.

---

# Rule 8 — Respect Existing Style

New code SHALL follow the project's established:

- Naming conventions
- Folder organization
- Documentation style
- Formatting

Consistency is preferred over personal preference.

---

# Rule 9 — Produce Complete Deliverables

A coding response SHALL include all requested artifacts.

Examples

- Source Code
- Configuration
- Documentation
- Migration Notes
- Usage Instructions

---

# Rule 10 — Self Validation

Before returning code, AI SHALL verify:

- Requirements satisfied.
- No unrelated code modified.
- No architecture violations.
- No missing dependencies.
- Documentation remains consistent.

---

# Rule 11 — Incremental Development

Large systems SHOULD be implemented incrementally.

Each implementation step SHOULD remain independently testable.

Avoid implementing multiple unrelated systems in one prompt.

---

# Rule 12 — Avoid Hidden Assumptions

AI SHALL explicitly state assumptions.

AI SHALL distinguish between:

- Verified facts
- Assumptions
- Recommendations

Undocumented assumptions SHALL NOT become implementation.

---

# Rule 13 — Roblox Compatibility

When writing Roblox code:

- Follow Roblox best practices.
- Prefer modular architecture.
- Separate client and server responsibilities.
- Avoid unnecessary dependencies.
- Keep systems scalable.

---

# Rule 14 — Token Efficiency

Coding prompts SHOULD include only documentation relevant to the requested implementation.

Avoid loading unrelated systems.

Prefer focused context over complete repository scans.

---

# Rule 15 — Completion Checklist

Before returning code, verify:

✓ Correct documentation used

✓ Correct scope respected

✓ Architecture preserved

✓ Code complete

✓ Comments added where required

✓ No unrelated modifications

✓ Output matches requested deliverables

---

# Coding Prompt Lifecycle

Coding Request

↓

Context Collection

↓

Planning

↓

Implementation

↓

Self Validation

↓

Review

↓

Approved Implementation

---

# Golden Rule

An AI SHALL never write code that changes project architecture without explicit approval.

---

# Final Statement

Coding prompts are engineering specifications.

Their purpose is to produce maintainable, predictable and reusable implementations.

OreLabs values architectural consistency above implementation speed.

---

# Revision History

## v0.1

Initial Release.
