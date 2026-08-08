# AI Backend Toolkit

> A structured AI-assisted development workflow for backend engineers.

AI Backend Toolkit provides a guided workflow for taking a software requirement from initial analysis to implementation and review.

It is designed for AI coding assistants such as Cursor, with a focus on **clarity, simplicity, scope control, and sound engineering practices**.

---

## Philosophy

AI coding assistants can generate code quickly, but they can also make assumptions, expand scope, overengineer solutions, or modify unrelated parts of a codebase.

AI Backend Toolkit introduces a structured workflow:

```text
Requirement
    ↓
/analyze-requirement
    ↓
/structure-issue
    ↓
/plan-implementation
    ↓
/create-tests
    ↓
Implementation
    ↓
/review (optional)
```

Each stage has a specific responsibility and acts as a gate for the next one.

The AI **does not automatically execute the next command**. When a stage is complete, it recommends the next step and the developer decides whether to continue.

The core principle is:

> **Understand first. Plan second. Implement third.**

---

## Commands

| Command                | Purpose                                                                          |
| ---------------------- | -------------------------------------------------------------------------------- |
| `/analyze-requirement` | Analyze and clarify the requirement from a product/functional perspective.       |
| `/structure-issue`     | Transform the validated requirement into a well-scoped engineering issue.        |
| `/plan-implementation` | Create a simple, implementation-ready technical plan based on the real codebase. |
| `/create-tests`        | Define the test strategy and scenarios required to validate the implementation.  |
| `/review`              | Perform an independent, critical review of the implemented changes.              |
| `/docs`                | Update relevant documentation when necessary.                                    |

`/review` is an optional step and is not part of the mandatory workflow.

---

## Rules

The toolkit provides three default Cursor rules:

```text
.cursor/rules/
├── 00-agent-behavior.mdc
├── 01-best-practices.mdc
└── 99-rule-precedence.mdc
```

### Project Rules

Project-specific rules always have priority over toolkit rules.

Before working on a project, the AI should inspect its existing rules and conventions.

If project-specific rules exist, they are used.

If no project-specific rules are found, the toolkit rules become the default.

This allows the toolkit to adapt to existing projects instead of imposing its own architecture or conventions.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/FrancoLema/ai-backend-toolkit.git
```

Enter the toolkit directory:

```bash
cd ai-backend-toolkit
```

Grant permissions to the installer
```bash
chmod +x install.sh
```

Install it into an existing project:

```bash
./install.sh /path/to/your/project
```

Or install it into the current directory:

```bash
./install.sh .
```

The installer creates:

```text
your-project/
└── .cursor/
    ├── commands/
    │   ├── analyze-requirement.md
    │   ├── structure-issue.md
    │   ├── plan-implementation.md
    │   ├── create-tests.md
    │   ├── review.md
    │   └── docs.md
    │
    └── rules/
        ├── 00-agent-behavior.mdc
        ├── 01-best-practices.mdc
        └── 99-rule-precedence.mdc
```

The installer preserves project-specific rule files.

---

## Usage

Open the target project with Cursor after installation.

Start with a requirement:

```text
/analyze-requirement
```

Once the requirement is sufficiently defined, Cursor will recommend:

```text
/structure-issue
```

The workflow continues through:

```text
/plan-implementation
/create-tests
```

After the implementation is completed, optionally run:

```text
/review
```

The review focuses on the actual changes introduced by the implementation, preferably using the relevant Git commit and its diff.

---

## Design Principles

AI Backend Toolkit follows a few simple principles:

* Keep the scope explicit.
* Do only what is required.
* Prefer the simplest correct solution.
* Avoid overengineering.
* Respect the existing architecture.
* Reuse existing project patterns.
* Never invent requirements.
* Do not modify unrelated code.
* Keep the developer in control.

---

## Project Structure

```text
ai-backend-toolkit/
│
├── README.md
├── LICENSE
├── install.sh
│
└── .cursor/
    ├── commands/
    │   ├── analyze-requirement.md
    │   ├── structure-issue.md
    │   ├── plan-implementation.md
    │   ├── create-tests.md
    │   ├── review.md
    │   └── docs.md
    │
    └── rules/
        ├── 00-agent-behavior.mdc
        ├── 01-best-practices.mdc
        └── 99-rule-precedence.mdc
```

---

## License

MIT
