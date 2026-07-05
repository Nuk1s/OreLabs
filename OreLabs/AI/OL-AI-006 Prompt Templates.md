---
Document: OreLabs Prompt Templates

ID: OL-AI-006

Version: 0.1

Status: Draft

Owner: Founder

Maintainer: Chief Systems Architect

Category: AI Framework

Created: 2026-07-05

Last Updated: 2026-07-05

Next Review: v1.0

Depends On:
- OL-AI-001
- OL-AI-002
- OL-AI-003
- OL-AI-004
- OL-AI-005

Related Documents:
- OL-AI-008
- OL-AI-007
---

# OreLabs Prompt Templates

## Purpose

This document provides standardized prompt templates for common engineering tasks within OreLabs Studio.

Templates ensure consistent communication between humans and AI systems.

Templates SHALL follow the OreLabs Prompt Rules.

---

# General Template Structure

Every template SHALL follow this structure.

Role

Objective

Context

Requirements

Constraints

Expected Output

Success Criteria

---

# Template 1 — New Gameplay System

## Role

AI Game Designer

## Objective

Design a new gameplay system.

## Context

Reference all approved gameplay documentation.

## Requirements

- Define purpose.
- Define progression.
- Define dependencies.
- Define scalability.

## Constraints

Do not implement code.

Do not redefine existing systems.

## Expected Output

Gameplay specification.

## Success Criteria

System can proceed to Engineering.

---

# Template 2 — Coding Task

## Role

AI Programmer

## Objective

Implement an approved specification.

## Context

Read required Engineering documentation.

## Requirements

Implement only approved functionality.

## Constraints

Do not modify unrelated systems.

## Expected Output

Production-ready source code.

## Success Criteria

Implementation passes validation.

---

# Template 3 — Bug Fix

## Role

AI Programmer

## Objective

Fix a specific issue.

## Context

Read bug description and affected documentation.

## Requirements

Fix only the reported issue.

## Constraints

Avoid unrelated changes.

## Expected Output

Corrected implementation.

## Success Criteria

Bug no longer reproducible.

---

# Template 4 — Documentation

## Role

AI Technical Writer

## Objective

Create or improve documentation.

## Context

Follow OreLabs Standards.

## Requirements

Use deterministic language.

## Constraints

Do not change technical meaning.

## Expected Output

Updated documentation.

## Success Criteria

Documentation is complete and unambiguous.

---

# Template 5 — Code Review

## Role

AI Reviewer

## Objective

Review implementation quality.

## Context

Read specification and implementation.

## Requirements

Identify:

- Bugs
- Risks
- Missing requirements
- Standard violations

## Constraints

Do not rewrite implementation.

## Expected Output

Review report.

## Success Criteria

All findings are actionable.

---

# Template 6 — Architecture Review

## Role

AI Systems Architect

## Objective

Evaluate architectural consistency.

## Context

Read all related Engineering documentation.

## Requirements

Check:

- Scalability
- Maintainability
- Dependencies
- Separation of concerns

## Constraints

Respect approved architecture.

## Expected Output

Architecture review.

## Success Criteria

Architecture remains consistent.

---

# Template 7 — Research

## Role

AI Researcher

## Objective

Research a specific topic.

## Context

Define research scope.

## Requirements

Present verified information.

Separate facts from opinions.

## Constraints

Do not make final decisions.

## Expected Output

Research report.

## Success Criteria

Information supports engineering decisions.

---

# Template 8 — UI Design

## Role

AI Designer

## Objective

Design a user interface.

## Context

Read UI documentation.

## Requirements

Maintain design consistency.

Support future scalability.

## Constraints

Do not redesign unrelated interfaces.

## Expected Output

UI specification.

## Success Criteria

Ready for implementation.

---

# Template Selection

Choose the template that best matches the task.

If no template matches:

1. Select the closest template.
2. Extend it without changing the standard structure.
3. Preserve Prompt Rules.

---

# Template Evolution

Templates MAY evolve.

Template structure SHALL remain consistent.

New templates SHALL follow the official Prompt Rules.

---

# Final Statement

Prompt Templates standardize communication across different AI systems.

They improve consistency, reduce ambiguity and accelerate development.

---

# Revision History

## v0.1

Initial Release.
