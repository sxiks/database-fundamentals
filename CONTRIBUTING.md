# Contributing Guidelines

## Workflow
1. This repository strictly follows Git Flow.
2. Main branches: `main` (production-ready) and `develop` (integration).
3. Create a feature branch from `develop`: `git checkout -b feature/your-feature-name`.

## Commit Standards
Use conventional commits for all changes. 
- `feat:` New feature or structural addition.
- `fix:` Bug fix or query correction.
- `docs:` Documentation updates.
- `refactor:` Code restructuring without changing behavior.

Example: `feat: add index to users email column`

## Naming Conventions
- All directories and files must use `kebab-case`.
- SQL tables and columns must use `snake_case`.