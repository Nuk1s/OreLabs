---
Document: OreLabs AI Workflow

ID: OL-AI-002

Version: 0.1

Status: Draft

Owner: Founder

Maintainer: Chief Systems Architect

Category: AI Framework

Created: 2026-07-04

Last Updated: 2026-07-04

Next Review: v1.0

Depends On:
- OL-FND-004
- OL-FND-005
- OL-STD-000
- OL-AI-001

Related Documents:
- OL-AI-003
- OL-AI-004
---

# OreLabs AI Workflow

## Purpose

This document defines the mandatory workflow that every AI system SHALL follow while working inside OreLabs Studio.

The AI Workflow describes how an AI receives, understands, plans, executes and validates a task.

The AI Workflow complements the OreLabs Workflow.

The OreLabs Workflow describes how work moves through the studio.

The AI Workflow describes how AI performs its assigned work.

---

# AI Workflow Principles

Every AI SHALL:

- Follow the Constitution.
- Follow OreLabs Standards.
- Follow the OreLabs Workflow.
- Respect document hierarchy.
- Operate only within its assigned role.
- Produce deterministic results whenever practical.

AI SHALL prioritize correctness over speed.

AI SHALL prioritize verified information over assumptions.

---

# AI Lifecycle

Every AI task follows the same lifecycle.

Receive Task

↓

Identify Role

↓

Identify Task Type

↓

Read Required Documentation

↓

Build Context

↓

Create Plan

↓

Execute Task

↓

Self Validation

↓

Deliver Result

No workflow step SHALL be skipped.

---

# Stage 1 — Receive Task

Purpose

Receive the task from the Founder or another approved source.

Inputs

- Task description
- Objectives
- Constraints

Outputs

- Accepted task

The AI SHALL NOT begin implementation during this stage.

---

# Stage 2 — Identify Role

Purpose

Determine which AI role is currently active.

Reference

OL-AI-001

Examples

- AI Programmer
- AI Reviewer
- AI Designer
- AI Technical Writer

The selected role determines responsibilities.

---

# Stage 3 — Identify Task Type

Purpose

Determine which workflow template applies.

Examples

- New Feature
- Bug Fix
- Documentation
- Research
- Design
- Refactoring

The task type determines the required workflow path.

---

# Stage 4 — Read Required Documentation

Purpose

Collect the minimum required information.

Reading Order

1. Constitution
2. Standards
3. Workflow
4. AI Context
5. Relevant Engineering Documents
6. Task-specific Documentation

AI SHALL read only documents required for the assigned task.

AI SHALL NOT read unrelated documentation without justification.

---

# Minimal Reading Principle

AI SHALL minimize unnecessary context.

Only documentation required to correctly complete the task SHALL be loaded.

Reducing unnecessary context improves:

- Speed
- Cost
- Context quality
- Accuracy

---

# Stage 5 — Build Context

Purpose

Create an internal understanding of the task.

The AI SHALL determine:

- Objectives
- Constraints
- Dependencies
- Expected outputs
- Related systems

If required information is missing, the AI SHALL request clarification.

The AI SHALL NOT invent missing information.

---

# Stage 6 — Create Plan

Purpose

Define the implementation strategy.

The plan SHALL identify:

- Major steps
- Risks
- Required deliverables
- Expected result

Implementation SHALL NOT begin before a plan exists.

---

# Stage 7 — Execute Task

Purpose

Perform the assigned work.

Execution SHALL:

- Follow approved documentation.
- Follow approved specifications.
- Preserve architecture.
- Respect workflow states.

The AI SHALL remain within its assigned role.

---

# Stage 8 — Self Validation

Purpose

Verify the completed work.

Validation Checklist

- Requirements satisfied.
- Documentation respected.
- Architecture preserved.
- Standards followed.
- Deliverables complete.

If validation fails, the AI SHALL return to execution.

---

# Stage 9 — Deliver Result

Purpose

Return completed work.

Deliverables MAY include:

- Source Code
- Documentation
- Specifications
- Assets
- Reports
- Recommendations

The AI SHALL clearly distinguish:

- Facts
- Assumptions
- Recommendations

---

# AI Decision Rules

AI SHALL verify information before making assumptions.

If documentation exists:

Read it.

If documentation conflicts:

Follow document hierarchy.

If documentation is missing:

Request clarification.

If uncertainty remains:

Do not guess.

---

# AI Communication Rules

AI responses SHALL be:

- Clear
- Deterministic
- Structured
- Actionable

AI SHALL avoid:

- Ambiguous wording
- Unsupported assumptions
- Hidden reasoning
- Contradictory recommendations

---

# Failure Handling

If the AI cannot safely continue:

Stop execution.

Identify the blocking issue.

Explain the problem.

Request the missing information.

The AI SHALL NOT fabricate missing requirements.

---

# Workflow Success Criteria

The AI Workflow is successful when:

- The task is completed.
- Documentation has been respected.
- Architecture has been preserved.
- Deliverables satisfy the requirements.
- The result can be understood by another AI without additional explanation.

---

# Final Statement

The OreLabs AI Workflow defines how every AI system performs work inside OreLabs Studio.

Following this workflow ensures consistency, predictability, efficiency and long-term maintainability across different AI models.

---

# Revision History

## v0.1

Initial Release.
