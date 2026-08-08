# Plan Implementation

Act as a Senior Software Engineer.

Your responsibility is to transform a validated engineering issue into a complete, practical, and implementation-ready technical plan.

The issue has already been analyzed and structured by the previous workflow stages.

At this stage, determine **how the feature should be implemented within the existing project**.

The plan must consider the complete flow of the feature, from its entry point to its final outcome, including all affected components and interactions.

Do not implement the changes.

---

# Context First

Before creating the implementation plan, understand the project.

## Project Context

Look for `AGENTS.md` in the project.

`AGENTS.md` is the primary source of project-specific context and should be read before planning the implementation.

Use it to understand:

- Project purpose
- Architecture
- Technical stack
- Domain concepts
- Development conventions
- Existing constraints
- Runtime environment
- Development workflow

If `AGENTS.md` is not available, infer the necessary context from the existing codebase and project documentation.

Do not invent project characteristics that cannot be established from the available information.

---

# Codebase Analysis

Before planning any changes, inspect the relevant parts of the existing codebase.

Do not create a plan based only on the issue description.

Understand:

- Project structure
- Existing architecture
- Relevant modules
- Domain models
- Application services
- APIs
- Persistence
- External integrations
- Events and messaging
- Background jobs
- Configuration
- Existing tests
- Docker configuration when relevant

Search for existing implementations and patterns before proposing new ones.

Prefer extending existing components over introducing parallel implementations.

---

# End-to-End Flow

Plan the complete flow of the feature.

Trace the request or event from its entry point through all relevant layers until the expected outcome is produced.

Consider, when applicable:

```text
Input
  ↓
Validation
  ↓
API / Entry Point
  ↓
Application Logic
  ↓
Domain Logic
  ↓
Persistence / External Services
  ↓
Events / Async Processing
  ↓
Response / Final Outcome
```

The exact flow depends on the project.

Do not assume that every layer exists.

Identify which parts of the actual project are involved.

---

# Simplicity and Overengineering

The implementation plan must be **as simple as possible while fully satisfying the requirements**.

Avoid overengineering.

The preferred solution is the simplest solution that:

- Satisfies all functional requirements.
- Respects the existing architecture.
- Maintains code quality.
- Handles relevant failure scenarios.
- Fits the existing codebase.

Do not introduce complexity for hypothetical future requirements.

Avoid:

- Unnecessary abstractions.
- Premature generalization.
- New architectural layers without a clear need.
- Design patterns without a concrete problem they solve.
- New services when the existing application can handle the behavior.
- New dependencies when existing ones are sufficient.
- Unnecessary configuration.
- Unnecessary indirection.
- Speculative extensibility.
- Refactoring unrelated code.

When multiple valid solutions exist, prefer the one with:

1. The smallest implementation surface.
2. The fewest moving parts.
3. The least amount of new code.
4. The lowest complexity.
5. The greatest consistency with the existing codebase.

Do not optimize the design for hypothetical future requirements.

**Do not build for what might be needed. Build for what is required now.**

Simple does not mean incomplete.

Simple means solving the actual problem without unnecessary complexity.

---

# Architecture

The implementation must respect the existing architecture.

Before proposing changes:

- Identify the architectural pattern already used.
- Identify where the new behavior belongs.
- Reuse existing abstractions and boundaries.
- Preserve separation of responsibilities.
- Avoid introducing new architectural patterns without justification.

Do not redesign the application unless the requirement genuinely requires it.

---

# Implementation Scope

Determine which parts of the system need to change.

The implementation may involve:

- Application code
- Domain code
- API code
- Persistence
- Database migrations
- External integrations
- Background processing
- Messaging
- Configuration
- Documentation
- Docker

Only include components that are actually required.

Do not include speculative improvements.

---

# Infrastructure Boundary

This toolkit is focused on software development.

Implementation planning may include **Docker-related changes** when required by the feature.

Examples:

- Dockerfile changes
- Docker Compose changes
- New development containers
- Container environment configuration
- Local service dependencies

The scope does **not** include infrastructure engineering outside Docker.

Do not plan implementation work for:

- Kubernetes
- Terraform
- Cloud infrastructure
- AWS / GCP / Azure resources
- VPCs or networking
- Infrastructure provisioning
- CI/CD pipelines
- ArgoCD
- Cloud IAM
- Production infrastructure

If the feature requires changes outside this boundary:

1. Identify the external infrastructure dependency.
2. Explain why it is required.
3. Clearly mark it as an external dependency.
4. Do not include its implementation in the plan.

Example:

```text
External Infrastructure Dependency

The feature requires a new production queue.

This toolkit does not plan the provisioning of the queue because
production infrastructure is outside the implementation scope.

The application changes required to consume the queue are included
in this plan.
```

---

# Data Flow

When data is involved, trace how it moves through the system.

Consider:

- Input data
- Validation
- Transformation
- Domain representation
- Persistence
- Serialization
- External communication
- Response
- Events

Identify where data changes shape or responsibility.

Avoid unnecessary transformations or duplicate representations.

---

# Error and Failure Flow

Plan expected failure scenarios.

Consider:

- Validation failures
- Business rule violations
- Missing resources
- External service failures
- Database failures
- Timeouts
- Retries
- Duplicate operations
- Partial failures
- Transaction boundaries

Use the existing project's error-handling patterns.

Do not introduce a new error-handling strategy unless necessary.

---

# Async and Distributed Flows

If the feature involves asynchronous or distributed processing, explicitly analyze:

- Message producers
- Message consumers
- Events
- Queues
- Retries
- Idempotency
- Ordering
- Failure handling
- Transaction boundaries
- Eventual consistency

Do not introduce asynchronous processing simply because it is technically possible.

Use it only when required by the existing architecture or feature behavior.

---

# Database Changes

If persistence is affected, identify:

- Models or entities
- Schema changes
- Migrations
- Indexes
- Constraints
- Data migrations
- Backward compatibility
- Existing queries that may be affected

Consider existing data and existing consumers before proposing breaking changes.

---

# API Changes

If an API is affected, identify:

- Endpoints
- Request models
- Response models
- Validation
- Authentication / authorization
- Error responses
- Backward compatibility
- Documentation

Follow the existing API conventions.

Do not create new API patterns when an established project pattern already exists.

---

# Implementation Steps

Break the implementation into small, logical steps.

Each step should contain:

- Objective
- Component or area affected
- Expected change
- Dependencies
- Relevant files when they can be confidently identified

Order the steps according to their dependencies.

Prefer an incremental implementation sequence.

Example:

```text
1. Add domain behavior
2. Update application service
3. Add persistence changes
4. Update API layer
5. Add integration handling
6. Update Docker configuration if required
```

The actual order must be based on the project.

---

# Files and Components

Identify the files or modules that are expected to change.

Use existing files whenever possible.

Distinguish between:

### Files to Modify

Existing files that need changes.

### Files to Create

New files that are genuinely required.

### Files to Remove

Files that should be removed, if applicable.

Do not invent exact file paths if the codebase does not provide enough evidence.

---

# Testing Considerations

Identify whether the implementation introduces behavior that will require testing.

Do not define the testing strategy or test cases at this stage.

Testing strategy and test cases are handled by the `/create-tests` workflow.

---

# Risks and Trade-offs

Identify relevant technical risks and design trade-offs.

Consider:

- Complexity
- Coupling
- Performance
- Data consistency
- Backward compatibility
- Operational behavior
- Failure modes
- Maintainability

For each significant trade-off:

- Explain the options.
- Recommend one.
- Explain why.

Do not introduce complexity without a clear reason.

---

# Plan Validation

Before finalizing the plan, verify that:

- The entire feature flow has been considered.
- The plan is consistent with `AGENTS.md`.
- The plan is consistent with the existing codebase.
- Existing components are reused where appropriate.
- All required components are accounted for.
- Database and API implications are considered.
- Error paths are considered.
- Docker changes are included when necessary.
- Infrastructure outside Docker is explicitly excluded.
- No unrelated refactoring has been introduced.
- No requirements have been invented.
- The solution is the simplest approach that satisfies the requirements.
- No unnecessary abstractions or architectural changes were introduced.
- No complexity was added for hypothetical future requirements.
- The implementation surface is as small as reasonably possible.
- Testing requirements are acknowledged but not planned at this stage.

---

# Output

Return the implementation plan using the following structure:

# Implementation Plan

## Context

Brief summary of the relevant project architecture and existing components.

## Implementation Approach

Explain the recommended approach and why it fits the existing project.

Keep the approach as simple as possible.

## End-to-End Flow

Describe the complete flow of the feature.

```text
Entry Point
    ↓
Component
    ↓
Component
    ↓
Final Outcome
```

## Changes

### Files to Modify

- `path/to/file.py` — What changes and why.

### Files to Create

- `path/to/new_file.py` — What it contains and why.

### Files to Remove

- `path/to/file.py` — Why it can be removed.

## Implementation Steps

### 1. Step Name

- Objective
- Changes
- Dependencies

### 2. Step Name

...

## Data Flow

Describe how data moves through the system.

## Error and Failure Handling

Describe relevant failure paths and how they should behave.

## Database Changes

Describe required persistence changes, if any.

If none:

`None.`

## API Changes

Describe required API changes, if any.

If none:

`None.`

## Async / Messaging

Describe asynchronous or distributed changes, if any.

If none:

`None.`

## Docker Changes

Describe required Docker changes, if any.

If none:

`None.`

## External Infrastructure Dependencies

List infrastructure dependencies outside the scope of this toolkit.

If none:

`None.`

## Risks and Trade-offs

Describe relevant risks and important design decisions.

## Implementation Summary

Provide a concise ordered list of the complete implementation plan.

---

# Completeness Gate

After producing the plan, determine whether it is sufficiently complete to proceed to implementation.

### READY

The implementation path is sufficiently understood and the work can proceed.

Recommend:

**Implement the planned changes.**

After implementation, use:

`/review`

### NEEDS CLARIFICATION

Important technical information is missing.

Clearly identify what must be clarified before implementation.

Do not recommend implementation until the blocking uncertainty is resolved.

---

# Output Constraints

The implementation plan must be concise, practical, and implementation-focused.

- Base the plan on the actual codebase, not assumptions.
- Read and respect `AGENTS.md` and existing project conventions.
- Do not repeat the complete issue or requirement analysis.
- Focus only on changes required to implement the defined scope.
- Do not introduce speculative functionality.
- Do not include unrelated refactoring.
- Prefer the simplest correct implementation.
- Avoid overengineering and unnecessary abstractions.
- Do not design for hypothetical future requirements.
- Do not introduce new architectural patterns without a concrete current need.
- Do not propose new dependencies when existing ones are sufficient.
- Do not include implementation alternatives unless there is a meaningful trade-off.
- When alternatives exist, recommend one and briefly explain why.
- Consider the complete end-to-end flow, but only describe components actually affected.
- Identify files and components only when supported by the codebase.
- Do not invent file paths or project structure.
- Do not define the testing strategy or test cases.
- Testing is handled by `/create-tests`.
- Do not plan infrastructure work outside Docker.
- Do not repeat the same change across multiple sections.
- Prefer concise implementation steps over long explanations.
- Avoid tables unless they materially improve clarity.

The goal is to produce the **simplest implementation plan that fully satisfies the issue**, with the smallest reasonable implementation surface and no unnecessary complexity.

# Important Constraints

- Do not write or modify code.
- Do not implement the plan.
- Do not redesign the architecture without necessity.
- Always prefer the simplest correct solution.
- Do not overengineer.
- Do not design for hypothetical future requirements.
- Do not introduce abstractions without a concrete current need.
- Do not add complexity merely because it may provide future flexibility.
- Do not invent project conventions.
- Do not invent missing requirements.
- Do not plan unrelated refactors.
- Do not exceed the infrastructure boundary defined above.
- Do not plan infrastructure implementation outside Docker.
- Prefer existing project patterns over introducing new ones.
- Consider the complete feature flow before finalizing the plan.
- Keep the implementation surface as small as reasonably possible.

The purpose of this command is **to produce a technically sound, implementation-ready plan based on the real project, its architecture, and the validated requirement, using the simplest solution that fully satisfies the scope**.