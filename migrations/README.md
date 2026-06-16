# migrations/

> Chronological, append-only history of schema changes.

---

## Purpose

This directory records how the database schema has evolved over time. Each file represents a single, deliberate change to the schema, applied in the order the files are numbered.

Migrations answer the question: **"How did the schema get to its current state, step by step?"**

This is different from `schemas/`, which answers: **"What does the schema look like right now?"**

---

## Responsibilities

- Provide a chronological record of schema changes
- Allow a database to be rebuilt from nothing by applying migrations in order
- Make schema evolution reviewable, one change at a time

---

## What Belongs Here

- One file per schema change, named `NNN-description.sql` (e.g. `001-initial-schema.sql`, `002-add-indexes.sql`)
- DDL statements: `CREATE`, `ALTER`, `DROP`, index creation, constraint changes
- Comments explaining *why* a change was made, when the reason isn't obvious from the SQL alone

---

## What Should NOT Be Placed Here

- Edits to existing migration files after they have been merged — see Rules below
- Seed or sample data — that belongs in `seeds/`
- The current, consolidated definition of a table, view, function, or trigger — that belongs in `schemas/`
- Multiple unrelated changes bundled into a single migration file

---

## Rules

1. **Append only.** New changes are added as new files; existing files are never modified.
2. **Never rewrite historical migrations.** If a past migration was wrong, a new migration that corrects it is added — the original stays as a historical record.
3. **Maintain chronological order.** The numeric prefix (`NNN`) determines execution order and must increase sequentially.
4. **One logical change per file.** A migration that adds a table and a migration that adds an index are two separate files, even if related.

---

## Best Practices

- Use descriptive names: `003-add-orders-table.sql` is more useful than `003-update.sql`
- Keep each migration small and reviewable — large migrations are harder to reason about
- Write migrations so they can run in order against a fresh database — this is what makes `scripts/setup.sql` reliable
- Use comments to record intent, not just the SQL itself

---

## Examples

This template includes two reference migrations:

| File | Demonstrates |
| --- | --- |
| `001-initial-schema.sql` | The starting point — initial table creation for a project |
| `002-add-indexes.sql` | An incremental change — adding indexes to an existing table without altering its original definition |

Together, these two files demonstrate the core pattern: an initial migration establishes the baseline, and every subsequent migration is an incremental, additive step.

---

## Relationship with the Rest of the Repository

- `migrations/` shows **how** the schema reached its current form, in order
- `schemas/` shows the **current** form of the schema, organized by object type
- `scripts/setup.sql` is responsible for bringing a fresh database to the state described by the schema, consistent with the migration history
- `examples/` contains complete, runnable schemas that demonstrate these concepts applied end-to-end