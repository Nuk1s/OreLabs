---
Document: OreLabs Workflow

ID: OL-FND-005

Version: 0.1

Status: Draft

Owner: Founder

Maintainer: Chief Systems Architect

Category: Foundation

Created: 2026-07-04

Last Updated: 2026-07-04

Next Review: v1.0

Depends On:
- OL-FND-001
- OL-FND-002
- OL-FND-003
- OL-FND-004
- OL-STD-000

Related Documents:
- OL-FND-006
- OL-FND-007
- OL-ENG-001
- OL-RFC-001
---

# OreLabs Workflow

## Purpose

This document defines the official development workflow used across the entire OreLabs Studio.

The Workflow specifies how every task moves from an initial idea to a completed implementation.

Every contributor, including AI systems, SHALL follow this workflow.

No implementation SHALL bypass this Workflow.

---

# Workflow Philosophy

OreLabs does not organize work around people.

OreLabs organizes work around systems.

Every task follows a predictable lifecycle.

Every participant understands:

- where a task begins;
- where it currently exists;
- where it can move next;
- what conditions are required before progressing.

The Workflow exists to reduce uncertainty.

The Workflow exists to reduce unnecessary communication.

The Workflow exists to ensure consistent development.

---

# Workflow Objectives

The Workflow SHALL:

- Standardize development.
- Minimize ambiguity.
- Improve AI collaboration.
- Protect architecture.
- Protect documentation quality.
- Prevent chaotic development.
- Support long-term scalability.
- Produce repeatable engineering processes.

---

# Workflow Scope

This Workflow applies to:

- Documentation
- Engineering
- Gameplay Systems
- UI
- Art
- AI Tasks
- Balancing
- Testing
- Refactoring
- Bug Fixes
- Releases

Every project developed inside OreLabs SHALL follow this Workflow.

---

# Workflow Hierarchy

The Workflow operates under the following document hierarchy.

Constitution

↓

Standards

↓

Workflow

↓

Engineering

↓

Knowledge

↓

RFC

↓

Implementation

Each level inherits the rules defined above it.

Lower-level documents SHALL NOT contradict higher-level documents.

---

# Workflow Engine

The OreLabs Workflow is implemented as a Workflow Engine.

The Workflow Engine defines:

- States
- Transitions
- Decision Gates
- Artifacts
- Responsibilities

Tasks do not follow a fixed sequence.

Tasks move through predefined states depending on their type.

This allows one Workflow to support many different development scenarios.

---

# Core Workflow Principles

## Principle 1

Every task SHALL have a clear objective.

Undefined work SHALL NOT begin.

---

## Principle 2

Every task SHALL produce one or more artifacts.

Examples:

- Documentation
- RFC
- Source Code
- UI Asset
- 3D Model
- Configuration
- Test Result

---

## Principle 3

Every artifact SHALL have an owner.

Ownership defines responsibility.

Ownership MAY change during development.

---

## Principle 4

Documentation precedes implementation.

Documentation defines implementation.

Implementation never defines documentation.

---

## Principle 5

Every completed task strengthens OreLabs.

Tasks produce reusable knowledge whenever practical.

---

## Principle 6

AI accelerates development.

AI does not replace engineering decisions.

---

## Principle 7

Processes SHALL remain simple.

If a process becomes unnecessarily complex, it SHOULD be redesigned.

---

## Workflow Roles

The Workflow defines responsibilities rather than permissions.

---

### Founder

Responsible for:

- Product Vision
- Final Approval
- Strategic Decisions
- Feature Priorities

The Founder has final authority.

---

### Chief Systems Architect

Responsible for:

- Architecture
- Standards
- Documentation
- Workflow
- Long-term consistency

The Architect protects the engineering integrity of OreLabs.

---

### AI Assistant

Responsible for:

- Implementation
- Documentation
- Reviews
- Suggestions
- Automation

AI SHALL operate within approved documentation.

AI SHALL NOT redefine architecture.

---

### Developer

Responsible for:

- Implementation
- Refactoring
- Testing
- Validation

Developers SHALL follow approved specifications.

---

# Workflow Responsibilities

Every participant SHALL know:

- What they receive.
- What they produce.
- What they approve.
- What they cannot modify.

Responsibilities SHALL be clearly separated.

---

# Workflow Inputs

A workflow may begin from:

- New Idea
- Feature Request
- RFC
- Bug Report
- Improvement Proposal
- Technical Debt
- Documentation Request

Every workflow begins with exactly one input.

---

# Workflow Outputs

A completed workflow SHALL produce one or more outputs.

Examples:

- Approved Documentation
- Approved RFC
- Source Code
- UI Asset
- Tested Feature
- Engineering Decision
- Release Candidate

Outputs SHALL be reusable whenever practical.

---

# Workflow Success Criteria

The Workflow is considered successful when:

- Documentation remains synchronized.
- Architecture remains consistent.
- AI can continue work without additional explanation.
- New contributors understand the current task quickly.
- Development remains predictable.

---

# End of Part 1

Part 2 defines the Workflow Engine itself, including:

- Workflow States
- State Transitions
- Decision Gates
- Validation Rules
- State Machine

# Workflow Engine

The OreLabs Workflow Engine defines the official lifecycle of every task.

A task SHALL exist in exactly one workflow state at any given time.

A task MAY move only through valid state transitions.

State transitions SHALL satisfy all required conditions before execution.

---

# Workflow States

The Workflow Engine defines the following official states.

## IDEA

Purpose

A new idea has been created.

Entry Conditions

- A new concept exists.

Outputs

- Initial description.

Next States

- ANALYSIS

---

## ANALYSIS

Purpose

Determine the nature and scope of the task.

Questions

- What problem is being solved?
- Is documentation required?
- Is an RFC required?
- Which systems are affected?
- Which documents are affected?

Outputs

- Task classification.
- Initial implementation strategy.

Next States

- RFC
- SPECIFICATION
- REJECTED

---

## RFC

Purpose

Evaluate significant architectural changes.

RFC SHALL be created when:

- Architecture changes.
- New core systems are introduced.
- Repository structure changes.
- Engineering standards change.
- Long-term workflow changes.

RFC MAY be skipped for:

- Bug fixes.
- Small improvements.
- Documentation corrections.
- Internal refactoring.

Outputs

- Approved RFC.
- Rejected RFC.

Next States

- SPECIFICATION
- REJECTED

---

## SPECIFICATION

Purpose

Design the solution.

The specification SHALL define:

- Purpose
- Scope
- Rules
- Dependencies
- Expected behavior
- Future expansion

Implementation SHALL NOT begin before this state is completed.

Outputs

- Approved specification.

Next States

- IMPLEMENTATION

---

## IMPLEMENTATION

Purpose

Produce the required deliverables.

Examples

- Source code
- Documentation
- UI
- Models
- Configuration
- Assets

Implementation SHALL follow approved specifications.

Outputs

- Candidate implementation.

Next States

- VALIDATION

---

## VALIDATION

Purpose

Verify technical correctness.

Validation SHALL verify:

- Documentation consistency.
- Standard compliance.
- Missing dependencies.
- Missing requirements.
- Architecture compliance.

Outputs

- Validated implementation.

Next States

- REVIEW
- IMPLEMENTATION

---

## REVIEW

Purpose

Evaluate quality.

Review SHALL verify:

- Completeness.
- Consistency.
- Readability.
- Maintainability.
- Scalability.

Review MAY request revisions.

Outputs

- Approved implementation.
- Revision request.

Next States

- COMPLETE
- IMPLEMENTATION

---

## COMPLETE

Purpose

Task successfully finished.

Requirements

- All mandatory states completed.
- Outputs approved.
- Documentation updated when required.

Completed tasks SHALL become part of OreLabs knowledge.

---

## ON HOLD

Purpose

Pause development.

Reasons

- Missing information.
- Waiting for approval.
- External dependency.
- Priority change.

Tasks MAY remain in this state indefinitely.

---

## REJECTED

Purpose

Terminate the workflow.

Reasons

- Invalid idea.
- Duplicate work.
- Rejected RFC.
- Incorrect assumptions.
- No longer required.

Rejected tasks SHALL preserve historical information.

---

# Workflow State Diagram

Every workflow is constructed from these official states.

Official state graph

IDEA

↓

ANALYSIS

↓

Decision

├── RFC Required

│      ↓

│     RFC

│      ↓

└──────────────┐

               ▼

SPECIFICATION

↓

IMPLEMENTATION

↓

VALIDATION

↓

REVIEW

↓

COMPLETE

Alternative exits

ANALYSIS → REJECTED

RFC → REJECTED

ANY STATE → ON HOLD

ON HOLD → Previous State

---

# Decision Gates

The Workflow Engine contains decision gates.

Decision gates determine the next valid state.

Official gates

Gate 1

Is this a new task?

YES → IDEA

NO → ANALYSIS

---

Gate 2

Does the task change architecture?

YES → RFC

NO → SPECIFICATION

---

Gate 3

Is documentation complete?

YES → IMPLEMENTATION

NO → SPECIFICATION

---

Gate 4

Validation successful?

YES → REVIEW

NO → IMPLEMENTATION

---

Gate 5

Review approved?

YES → COMPLETE

NO → IMPLEMENTATION

---

# State Transition Rules

A task SHALL move only through valid transitions.

States SHALL NOT be skipped unless explicitly permitted.

A completed task SHALL NOT return to IDEA.

Rejected tasks SHALL NOT continue without creating a new task.

Every transition SHALL preserve traceability.

---

# Workflow Integrity

The Workflow Engine guarantees:

- Predictable execution.
- Repeatable development.
- Consistent documentation.
- AI compatibility.
- Human readability.
- Architectural stability.

The Workflow SHALL remain deterministic.

The same inputs SHALL produce the same workflow decisions.

---

# End of Part 2

Part 3 defines reusable workflow templates for different task types, including:

- New Gameplay System
- Bug Fix
- Documentation
- UI
- Art
- AI Tasks
- Refactoring
- Balancing

# Workflow Templates

Workflow Templates define the recommended state sequence for common development tasks.

Every template uses the official Workflow Engine.

Templates SHALL NOT redefine workflow states.

Templates SHALL only define valid state transitions.

---

# Template 1 — New Gameplay System

Purpose

Create a completely new gameplay system.

Examples

- Mining
- Pets
- Rebirth
- Forge
- Combat
- Trading

Workflow

IDEA

↓

ANALYSIS

↓

RFC (if required)

↓

SPECIFICATION

↓

IMPLEMENTATION

↓

VALIDATION

↓

REVIEW

↓

COMPLETE

Primary Deliverables

- Knowledge Documentation
- Engineering Documentation
- Implementation
- Tests

---

# Template 2 — Existing System Improvement

Purpose

Improve an existing gameplay system.

Examples

- Balance changes
- New features
- UI improvements

Workflow

ANALYSIS

↓

RFC (if required)

↓

SPECIFICATION

↓

IMPLEMENTATION

↓

VALIDATION

↓

REVIEW

↓

COMPLETE

---

# Template 3 — Bug Fix

Purpose

Correct incorrect behaviour.

Workflow

ANALYSIS

↓

IMPLEMENTATION

↓

VALIDATION

↓

REVIEW

↓

COMPLETE

RFC is normally NOT required.

---

# Template 4 — Documentation

Purpose

Create or improve documentation.

Workflow

ANALYSIS

↓

SPECIFICATION

↓

REVIEW

↓

COMPLETE

Implementation state is not required.

---

# Template 5 — AI Prompt

Purpose

Create reusable AI prompts.

Workflow

ANALYSIS

↓

SPECIFICATION

↓

VALIDATION

↓

REVIEW

↓

COMPLETE

Deliverables

- Prompt
- Prompt Documentation

---

# Template 6 — UI Design

Purpose

Create user interface.

Workflow

IDEA

↓

ANALYSIS

↓

SPECIFICATION

↓

IMPLEMENTATION

↓

VALIDATION

↓

REVIEW

↓

COMPLETE

Deliverables

- UI Design
- Assets
- Documentation

---

# Template 7 — 3D Asset

Purpose

Create models or textures.

Workflow

ANALYSIS

↓

SPECIFICATION

↓

IMPLEMENTATION

↓

VALIDATION

↓

REVIEW

↓

COMPLETE

Deliverables

- Model
- Textures
- Export Files

---

# Template 8 — Economy

Purpose

Design or modify game economy.

Workflow

IDEA

↓

ANALYSIS

↓

RFC

↓

SPECIFICATION

↓

REVIEW

↓

COMPLETE

Implementation SHALL NOT begin before the economy is approved.

---

# Template 9 — Engineering Architecture

Purpose

Modify engineering architecture.

Workflow

ANALYSIS

↓

RFC

↓

SPECIFICATION

↓

REVIEW

↓

IMPLEMENTATION

↓

VALIDATION

↓

COMPLETE

RFC is mandatory.

---

# Template 10 — Repository Structure

Purpose

Modify repository organization.

Workflow

ANALYSIS

↓

RFC

↓

SPECIFICATION

↓

IMPLEMENTATION

↓

REVIEW

↓

COMPLETE

RFC is mandatory.

---

# AI Task Selection

Before starting any task, AI SHALL determine the task category.

The selected category determines the required workflow template.

If no template exists:

1. Use the closest existing template.
2. Preserve the Workflow Engine.
3. Never invent new workflow states.

---

# Workflow Template Priority

If multiple templates apply:

1. Architecture
2. Engineering
3. Knowledge
4. Documentation
5. Assets

The higher-priority template SHALL define the workflow.

---

# Invalid Workflow Examples

The following transitions are prohibited.

IMPLEMENTATION

↓

IDEA

---

COMPLETE

↓

SPECIFICATION

---

IMPLEMENTATION

↓

COMPLETE

(without validation)

---

RFC

↓

IMPLEMENTATION

(without specification)

---

SPECIFICATION

↓

COMPLETE

(without review)

---

# Template Extension

New templates MAY be added.

New templates SHALL:

- Use the Workflow Engine.
- Preserve existing workflow states.
- Preserve transition rules.
- Follow official naming standards.

Templates SHALL extend the Workflow.

Templates SHALL NOT replace the Workflow.

---

# End of Part 3

Part 4 defines:

- Workflow Artifacts
- Deliverables
- Completion Rules
- AI Behaviour
- Founder Behaviour
- Architect Behaviour
- Practical Examples
- Revision History

# Workflow Deliverables

Every completed workflow SHALL produce one or more official deliverables.

Typical deliverables include:

- Approved Documentation
- Approved Specification
- Approved RFC
- Source Code
- UI Assets
- 3D Assets
- Configuration Files
- Test Results
- Knowledge Updates

Every deliverable SHALL have a defined owner.

---

# Completion Criteria

A task SHALL be considered COMPLETE only when:

- Required workflow states have been completed.
- Required deliverables have been produced.
- Documentation is synchronized.
- Validation has passed.
- Review has passed.
- No mandatory workflow step has been skipped.

If any requirement is missing, the task SHALL return to the appropriate previous state.

---

# Founder Responsibilities

The Founder SHALL:

- Define product direction.
- Define priorities.
- Approve strategic decisions.
- Approve constitutional changes.
- Approve major architectural changes.
- Make final product decisions.

The Founder MAY delegate implementation.

The Founder SHALL NOT bypass the Workflow.

---

# Chief Systems Architect Responsibilities

The Chief Systems Architect SHALL:

- Maintain architecture.
- Maintain documentation quality.
- Maintain standards.
- Maintain workflow integrity.
- Maintain engineering consistency.
- Protect long-term scalability.

The Architect SHALL reject solutions that violate approved standards.

---

# AI Responsibilities

AI systems SHALL:

- Read relevant documentation before starting work.
- Follow the Constitution.
- Follow Standards.
- Follow the Workflow.
- Follow approved Specifications.
- Respect document hierarchy.

AI systems MAY:

- Generate implementation.
- Generate documentation.
- Suggest improvements.
- Detect inconsistencies.
- Review existing work.

AI systems SHALL NOT:

- Invent new architecture.
- Ignore approved documentation.
- Skip workflow states.
- Redefine official standards.
- Contradict higher-level documents.

If uncertainty exists, AI SHALL request clarification before proceeding.

---

# Developer Responsibilities

Developers SHALL:

- Follow approved documentation.
- Respect workflow states.
- Maintain implementation quality.
- Preserve architecture.
- Report inconsistencies when discovered.

---

# Workflow Failure Conditions

A workflow SHALL be considered invalid if:

- Documentation is missing.
- Architecture is undefined.
- Workflow states are skipped.
- Approved standards are violated.
- Official document hierarchy is ignored.

Invalid workflows SHALL return to ANALYSIS.

---

# Workflow Recovery

When a workflow becomes invalid:

1. Stop implementation.
2. Identify the earliest invalid state.
3. Correct the issue.
4. Resume the workflow from that state.

Completed work SHALL be preserved whenever possible.

---

# Workflow Examples

## Example 1 — New Gameplay System

IDEA

↓

ANALYSIS

↓

RFC

↓

SPECIFICATION

↓

IMPLEMENTATION

↓

VALIDATION

↓

REVIEW

↓

COMPLETE

---

## Example 2 — Bug Fix

ANALYSIS

↓

IMPLEMENTATION

↓

VALIDATION

↓

REVIEW

↓

COMPLETE

---

## Example 3 — Documentation Update

ANALYSIS

↓

SPECIFICATION

↓

REVIEW

↓

COMPLETE

---

## Example 4 — Repository Change

ANALYSIS

↓

RFC

↓

SPECIFICATION

↓

IMPLEMENTATION

↓

REVIEW

↓

COMPLETE

---

# Workflow Validation

A workflow is considered compliant when:

- Every transition is valid.
- Every required artifact exists.
- Every approval has been completed.
- Every dependency is satisfied.
- Every higher-level document has been respected.

---

# Workflow Evolution

The Workflow Engine is intended to remain stable.

Future versions SHOULD introduce:

- New templates.
- New examples.
- Better automation.

Future versions SHALL NOT redefine the core workflow states without an approved RFC.

---

# Relationship to Other Documents

The Workflow operates within the OreLabs documentation hierarchy.

Constitution

↓

Standards

↓

Workflow

↓

Engineering

↓

Knowledge

↓

RFC

↓

Implementation

Every lower document inherits the rules of higher documents.

---

# Final Statement

The OreLabs Workflow defines how work is performed inside OreLabs Studio.

The Workflow Engine provides a predictable, repeatable and scalable development process.

Every task follows the same engineering principles.

Every completed task strengthens the OreLabs ecosystem.

The Workflow exists to make collaboration between humans and AI deterministic, efficient and sustainable.

---

# Revision History

## v0.1

Initial Release.

Approved as the official development workflow of OreLabs Studio.
