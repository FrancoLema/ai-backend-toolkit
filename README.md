# AI Backend Toolkit

> An opinionated AI toolkit for backend engineers that provides reusable workflows, engineering rules, and development commands for AI coding assistants such as Cursor.

## Overview

AI Backend Toolkit is designed to make AI-assisted software development more predictable, structured, and aligned with engineering best practices.

Instead of asking an AI assistant to immediately generate code, this toolkit guides the development process through a series of reusable workflows that mimic how experienced backend engineers approach a feature.

The toolkit encourages:

* Requirement analysis before implementation
* Small and focused changes
* Incremental development
* Architecture-first thinking
* Test-driven reasoning
* Consistent engineering practices

---

# Philosophy

Large Language Models are excellent at generating code, but they often:

* Implement more than requested
* Make assumptions about business requirements
* Introduce unnecessary abstractions
* Modify unrelated files
* Refactor working code without being asked

This toolkit aims to reduce those behaviors by introducing a structured workflow and a consistent set of engineering rules.

The objective is simple:

> **Think first. Code second.**

---

# Development Workflow

Every implementation follows the same pipeline.

```text
Requirement
      │
      ▼
 Analyze
      │
      ▼
 Create Issues
      │
      ▼
 Implementation Plan
      │
      ▼
 Implement
      │
      ▼
 Test Plan
      │
      ▼
 Testing
      │
      ▼
 Review
      │
      ▼
 Documentation
```

Each stage has a single responsibility and produces an artifact that can be used by the next stage.

---

# Commands

## Analyze

Analyzes a requirement before writing code.

Responsibilities:

* Understand the problem
* Identify ambiguities
* Detect risks
* Identify dependencies
* Produce acceptance criteria
* Estimate implementation complexity

This command intentionally does **not** generate code.

---

## Issues

Transforms the analysis into a structured implementation backlog.

Each issue contains:

* Objective
* Description
* Definition of Done
* Dependencies
* Estimated affected modules

---

## Implementation

Creates a complete implementation strategy before coding.

Typical output includes:

* Architecture impact
* Domain changes
* Persistence changes
* API changes
* Migration considerations
* Rollback strategy
* Observability requirements
* Recommended implementation order

---

## Tests

Generates a testing strategy.

Instead of immediately writing tests, it first identifies:

* Unit tests
* Integration tests
* Edge cases
* Regression scenarios
* Performance considerations
* Security validations

---

## Review

Performs a senior-level review after implementation.

The review evaluates:

* Architecture
* Readability
* Maintainability
* Performance
* SOLID compliance
* Potential bugs
* Code duplication
* Naming consistency
* Test quality

---

## Documentation

Generates project documentation when necessary.

Examples:

* README updates
* Architecture Decision Records (ADR)
* API documentation
* Implementation notes

---

# Engineering Rules

The toolkit includes a reusable set of engineering rules that guide AI assistants during implementation.

These rules focus on:

* SOLID principles
* Clean Architecture
* Python best practices
* Testing
* Security
* Performance
* Documentation
* AI behavior

The goal is not to replace project conventions, but to provide sensible defaults.

---

# Rule Precedence

The toolkit always respects project-specific conventions.

Rules are applied using the following priority:

1. User instructions
2. Project-specific rules
3. AI Backend Toolkit rules
4. Framework conventions
5. Model defaults

If a project already provides its own engineering guidelines (such as Cursor Rules, AGENTS.md, or similar files), those rules take precedence over this toolkit.

---

# Design Principles

The toolkit follows a few fundamental principles.

* Implement only what was requested.
* Never introduce unnecessary features.
* Prefer simple solutions.
* Keep changes small and incremental.
* Avoid modifying unrelated files.
* Preserve existing architecture whenever possible.
* Ask questions when requirements are ambiguous.
* Prefer readability over cleverness.
* Think before generating code.

---

# Goals

* Improve consistency in AI-assisted development
* Reduce unnecessary code generation
* Encourage architecture-first thinking
* Produce maintainable implementations
* Standardize backend engineering workflows
* Make AI behave more like an experienced backend engineer

---

# Roadmap

Future improvements may include:

* Support for additional AI coding assistants
* Framework-specific engineering rules
* Language-specific workflows
* Project templates
* Automated installation
* Community-contributed rules

---

# License

This project is released under the MIT License.
