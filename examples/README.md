# examples/

> Complete, runnable demonstrations. This is the only directory in the template where full implementations exist.

---

## Purpose

Every other directory in this template (`schemas/`, `migrations/`, `scripts/`, `seeds/`) describes **structure** — where things go and what rules apply, without committing to a specific schema design. `examples/` is the opposite: it contains **complete, working SQL** that shows those structures filled in for a real (if simplified) design.

If `docs/` and the directory-level READMEs explain the rules, `examples/` shows the rules followed.

---

## Learning Path

The four examples form a progression. Each one builds on the concepts introduced in the previous one.

| Order | Example | Concept Taught | Difficulty |
| --- | --- | --- | --- |
| 1 | `example-01-basic-schema` | Table creation, primary keys, basic column constraints | Beginner |
| 2 | `example-02-relations` | Foreign keys, parent-child tables, referential integrity | Beginner → Intermediate |
| 3 | `example-03-complex-queries` | Views, joins, aggregations, multi-table queries | Intermediate |
| 4 | `example-04-postgresql-standard` | PostgreSQL-specific conventions, types, and idioms | Intermediate → Advanced |

---

## Example Details

### `example-01-basic-schema`

**Concept taught:** how to define a single, well-formed table.

This is the entry point. It covers `CREATE TABLE` syntax, choosing appropriate data types, defining a primary key, and applying basic column-level constraints (`NOT NULL`, `UNIQUE`, `DEFAULT`). No relationships between tables are introduced yet — the goal is to get comfortable with a single object before combining several.

**Files:** `README.md`, `schema.sql`

---

### `example-02-relations`

**Concept taught:** how tables relate to each other.

Builds directly on `example-01` by introducing a second table that references the first through a foreign key. Covers referential integrity, the practical meaning of parent/child tables, and why dependency order matters when creating tables (a referenced table must exist before the table that references it).

**Files:** `README.md`, `schema.sql`

**Prerequisite:** `example-01-basic-schema`

---

### `example-03-complex-queries`

**Concept taught:** how to read data across multiple related tables.

With a multi-table schema in place (from `example-02`), this example shifts focus from `CREATE` statements to `SELECT` statements: joins across the related tables, aggregations (`GROUP BY`, `COUNT`, `SUM`), and at least one `CREATE VIEW` that encapsulates a reusable query.

**Files:** `README.md`, `schema.sql`

**Prerequisite:** `example-02-relations`

---

### `example-04-postgresql-standard`

**Concept taught:** conventions and features specific to PostgreSQL.

The first three examples are written to be as portable as possible across SQL engines. This example intentionally breaks that constraint to demonstrate PostgreSQL-specific conventions — naming standards, PostgreSQL-specific data types, and idioms that don't necessarily translate to other database engines. It exists to show *where* the line between portable SQL and engine-specific SQL sits, and why that line matters.

**Files:** `README.md`, `schema.sql`

**Prerequisite:** `example-03-complex-queries`

---

## Recommended Study Order

```text
example-01-basic-schema
        ↓
example-02-relations
        ↓
example-03-complex-queries
        ↓
example-04-postgresql-standard
```

Each example's own `README.md` contains the specific objectives, the SQL itself, and notes on what to look for. This index exists to orient — the detail lives one level down.

---

## Relationship with Repository Documentation

| This directory shows... | ...the concept documented in |
| --- | --- |
| A filled-in `tables/`, `views/` structure | `schemas/README.md` |
| A baseline schema plus an incremental change | `migrations/README.md` |
| A schema designed for portability vs. one that isn't | `docs/architecture.md` |
| Engine-specific conventions (example 04) | `docs/migration-guide.md` |

`examples/` does not replace the directory-level documentation — it complements it. The READMEs explain *why* the template is organized the way it is; the examples show *what that organization produces* once a real schema is designed.