# schemas/

> The canonical, current definition of the database, organized by object type.

---

## Purpose

This directory represents the database schema as it exists **today** — not how it got here (`migrations/`), and not sample data (`seeds/`).

Each subdirectory groups one type of database object. Within each subdirectory, **one file represents one object**.

---

## Responsibilities

- Provide a single, organized reference for every table, view, function, and trigger in the project
- Separate database objects by type, so related objects (e.g. all tables) can be reviewed together
- Serve as the source of truth for "what does the schema currently contain?"

---

## Subdirectories

| Directory | Contains |
| --- | --- |
| `tables/` | Table definitions — `CREATE TABLE` statements, one table per file |
| `views/` | View definitions — `CREATE VIEW` statements, one view per file |
| `functions/` | Stored procedures and reusable database functions, one function per file |
| `triggers/` | Trigger definitions and the functions that back them, one trigger per file |

---

## What Belongs Here

- One `CREATE TABLE`, `CREATE VIEW`, `CREATE FUNCTION`, or `CREATE TRIGGER` statement per file
- Files named with a numeric prefix reflecting dependency or logical order (e.g. `01-users.sql` before `02-profiles.sql`, since `profiles` depends on `users`)
- Comments documenting non-obvious constraints, indexes, or relationships

---

## What Should NOT Be Placed Here

- Migration history — incremental `ALTER` statements belong in `migrations/`
- Seed or sample data — belongs in `seeds/`
- Multiple objects defined in a single file (e.g. two tables in one `.sql` file)
- Setup orchestration logic — belongs in `scripts/`

---

## Why These Subdirectories Are Empty in the Template

This template ships with all four subdirectories present but empty (tracked via `.gitkeep`). This is intentional:

- The **structure** is part of what this template teaches — a fixed, predictable place for every type of database object
- The **content** is project-specific and is added as a real project's schema is designed
- A complete, filled-in version of this structure can be studied in `examples/`

---

## Best Practices

- One object per file — this makes diffs in version control meaningful and reviews easier
- Use numeric prefixes in `tables/` to communicate dependency order (a table referenced by a foreign key should have a lower number than the table referencing it)
- Keep `views/`, `functions/`, and `triggers/` files self-contained — each file should be runnable against the tables it depends on
- Treat this directory as the schema's "current state" — if `schemas/` and a real, running database ever disagree, `schemas/` should be updated to match reality

---

## Fixed Structure

The four subdirectories listed above are part of this template's structural contract and must not be renamed, removed, or reorganized. The files placed inside them, however, are entirely project-specific.

---

## Relationship with the Rest of the Repository

- `migrations/` explains how the schema arrived at the state described here
- `scripts/setup.sql` is responsible for creating the objects described in `schemas/` in a fresh database
- `seeds/` populates the tables defined here with data
- `examples/` shows complete, filled versions of this structure for different schema designs