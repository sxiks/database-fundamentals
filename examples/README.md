# examples/

> Complete, runnable demonstrations. This is the only directory in the template where full implementations exist.

---

## Learning Path

The four examples form a progression. Each one builds on the concepts introduced in the previous one.

| Order | Example | Concept Taught | Difficulty |
| --- | --- | --- | --- |
| 1 | `ddl` | Table creation, primary keys, basic column constraints | Beginner |
| 2 | `relationships` | Foreign keys, parent-child tables, referential integrity | Beginner → Intermediate |
| 3 | `queries` | Views, joins, aggregations, multi-table queries | Intermediate |
| 4 | `example-postgresql` | PostgreSQL-specific conventions, types, and idioms | Intermediate → Advanced |

---

## Example Details

### `ddl`

**Concept taught:** how to define a single, well-formed table.

This is the entry point. It covers `CREATE TABLE` syntax, choosing appropriate data types, defining a primary key, and applying basic column-level constraints (`NOT NULL`, `UNIQUE`, `DEFAULT`). No relationships between tables are introduced yet — the goal is to get comfortable with a single object before combining several.

**Files:** `README.md`, `schema.sql`

---

### `relationships`

**Concept taught:** how tables relate to each other.

Builds directly on `ddl` by introducing a second table that references the first through a foreign key. Covers referential integrity, the practical meaning of parent/child tables, and why dependency order matters when creating tables (a referenced table must exist before the table that references it).

**Files:** `README.md`, `schema.sql`

**Prerequisite:** `ddl`

---

### `queries`

**Concept taught:** how to read data across multiple related tables.

With a multi-table schema in place (from `queries`), this example shifts focus from `CREATE` statements to `SELECT` statements: joins across the related tables, aggregations (`GROUP BY`, `COUNT`, `SUM`), and at least one `CREATE VIEW` that encapsulates a reusable query.

**Files:** `README.md`, `schema.sql`

**Prerequisite:** `relationship`

---

### `example-postgresql`

**Concept taught:** conventions and features specific to PostgreSQL.

The first three examples are written to be as portable as possible across SQL engines. This example intentionally breaks that constraint to demonstrate PostgreSQL-specific conventions — naming standards, PostgreSQL-specific data types, and idioms that don't necessarily translate to other database engines. It exists to show *where* the line between portable SQL and engine-specific SQL sits, and why that line matters.

**Files:** `README.md`, `schema.sql`

**Prerequisite:** `queries`

---

## Recommended Study Order

```text
DDL
↓
Relationships
↓
DML
↓
Queries
↓
PostgreSQL Example
↓
Exercises
```

Each example's own `README.md` contains the specific objectives, the SQL itself, and notes on what to look for. This index exists to orient — the detail lives one level down.

`examples/` does not replace the directory-level documentation — it complements it. The READMEs explain *why* the template is organized the way it is; the examples show *what that organization produces* once a real schema is designed.