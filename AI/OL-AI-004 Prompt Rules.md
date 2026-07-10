---
Document: OreLabs Prompt Rules

ID: OL-AI-004

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

Related Documents:
- OL-AI-005
- OL-AI-006
---

# OreLabs Prompt Rules

## Purpose

This document defines the official prompt engineering standard used within OreLabs Studio.

The objective is to create prompts that are deterministic, reusable, scalable and independent of any specific AI model.

A prompt SHALL be treated as an engineering specification rather than a casual instruction.

---

# Prompt Philosophy

A prompt is not a conversation.

A prompt is a specification.

Its purpose is to communicate requirements with the minimum possible ambiguity.

A high-quality prompt produces predictable results across different AI systems.

---

# General Principles

Every prompt SHALL:

- Have one primary objective.
- Use verified information.
- Avoid ambiguity.
- Define expected outputs.
- Respect project documentation.
- Be understandable without additional explanation.

---

# Standard Prompt Structure

Every OreLabs prompt SHOULD follow this structure.

Role

↓

Objective

↓

Context

↓

Requirements

↓

Constraints

↓

Expected Output

↓

Success Criteria

---

# Rule 1 — One Objective

Every prompt SHALL define exactly one primary objective.

If multiple unrelated objectives exist, separate prompts SHALL be created.

---

# Rule 2 — Assign a Role

Every prompt SHALL explicitly define the AI role.

Examples

- AI Programmer
- AI Designer
- AI Reviewer
- AI Technical Writer
- AI Researcher

The assigned role determines responsibilities.

---

# Rule 3 — Define the Objective

The objective SHALL describe the required outcome.

Objectives SHALL be measurable.

Poor

"Improve the UI."

Good

"Create a scalable inventory UI for Roblox supporting future systems."

---

# Rule 4 — Provide Verified Context

Context SHALL contain only verified information.

Project assumptions SHALL NOT be presented as facts.

If information is uncertain, it SHALL be marked accordingly.

---

# Rule 5 — Define Requirements

Requirements describe what MUST be included.

Examples

- Support mobile devices.
- Follow OreLabs UI standards.
- Preserve existing architecture.

---

# Rule 6 — Define Constraints

Constraints describe limitations.

Examples

- Do not modify existing systems.
- Maintain backward compatibility.
- Do not introduce new dependencies.

---

# Rule 7 — Define Expected Output

Every prompt SHALL define the expected deliverable.

Examples

- Markdown
- Lua
- JSON
- PNG
- Technical Specification
- Review Report

---

# Rule 8 — Define Success Criteria

The prompt SHALL explain how success is evaluated.

Examples

- All requested systems documented.
- No architecture violations.
- Roblox-compatible Lua code.
- Mobile-ready UI.

---

# Rule 9 — Separate Facts from Ideas

Prompts SHALL distinguish between:

Verified Facts

Ideas

Recommendations

Future Plans

AI SHALL never confuse these categories.

---

# Rule 10 — Avoid Ambiguity

Avoid words such as:

- Maybe
- Approximately
- Somehow
- Better
- Nice
- Beautiful

Replace subjective language with measurable requirements.

---

# Rule 11 — Respect Documentation

A prompt SHALL never override approved documentation.

If documentation conflicts with the prompt, documentation takes priority unless explicitly approved by the Founder.

---

# Rule 12 — Token Efficiency

A prompt SHALL provide enough context to complete the task correctly.

Unrelated information SHALL NOT be included.

Prompts SHOULD minimize unnecessary token usage.

---

# Rule 13 — Reusability

Prompts SHOULD be reusable.

Project-specific values SHOULD be isolated whenever practical.

---

# Rule 14 — Determinism

Prompts SHOULD produce similar results when executed by different AI systems.

Prompt quality SHALL prioritize consistency over creativity when engineering work is performed.

---

# Rule 15 — Final Review

Before execution, verify that the prompt includes:

✓ Role

✓ Objective

✓ Context

✓ Requirements

✓ Constraints

✓ Expected Output

✓ Success Criteria

If any mandatory section is missing, the prompt SHOULD be improved before use.

---

# Prompt Lifecycle

A prompt follows the following lifecycle.

Idea

↓

Draft

↓

Review

↓

Approved

↓

Reusable Prompt

Approved prompts MAY become official templates.

---

# Prompt Quality Levels

Level 1

Simple Request

General conversation.

Level 2

Structured Prompt

Defines role and objective.

Level 3

Engineering Prompt

Follows the OreLabs standard.

Level 4

Reusable Template

Approved for repeated use.

OreLabs aims to create Level 4 prompts whenever practical.

---

# Golden Rule

If an AI can misunderstand a prompt, eventually one AI will misunderstand it.

Prompt authors SHALL reduce ambiguity rather than relying on AI interpretation.

---

# Final Statement

Prompt quality determines implementation quality.

Well-structured prompts reduce ambiguity, improve consistency and enable reliable collaboration between humans and AI.

Prompt engineering is an engineering discipline.

---

# Revision History

## v0.1

Initial Release.
