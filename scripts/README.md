# scripts/

> Environment orchestration: setup, seeding, and teardown.

---

## Purpose

This directory contains SQL scripts that operate on the database **as a whole** — building it, populating it, or tearing it down. These scripts orchestrate the objects defined in `schemas/` and the data defined in `seeds/`; they do not define schema or data themselves.

---

## Responsibilities

- Provide a repeatable way to build a fresh database environment
- Provide a repeatable way to populate that environment with seed data
- Provide a repeatable way to remove all database objects for a clean reset

---

## What Belongs Here

| File | Purpose |
| --- | --- |
| `setup.sql` | Creates all database objects — tables, views, functions, triggers — in the correct dependency order |
| `seed.sql` | Populates the database with seed data after `setup.sql` has run |
| `teardown.sql` | Drops all database objects, returning the database to an empty state |

Additional automation scripts may be added here as a project grows (e.g. `backup.sql`, `analyze.sql`, `restore.sql`), as long as they operate on the database as a whole rather than defining new schema or data.

---

## What Should NOT Be Placed Here

- Table, view, function, or trigger **definitions** — these belong in `schemas/`; `setup.sql` should reference or build on them, not redefine them
- Seed **data** — belongs in `seeds/`; `seed.sql` should load from there, not contain large inline datasets
- Migration logic — belongs in `migrations/`
- Application-level scripts (deployment, backend service startup, etc.) — this template is database-only

---

## Execution Order

The three scripts are designed to be run in this order for a fresh environment:

```text
1. setup.sql     — creates schema objects
2. seed.sql      — loads seed data
3. teardown.sql  — (only when resetting) drops everything
```

A typical development cycle looks like:

```bash
psql -U your_user -d your_db -f scripts/setup.sql
psql -U your_user -d your_db -f scripts/seed.sql

# ... development work ...

# To reset the environment:
psql -U your_user -d your_db -f scripts/teardown.sql
psql -U your_user -d your_db -f scripts/setup.sql
psql -U your_user -d your_db -f scripts/seed.sql
```

---

## Best Practices

- **Idempotency** — `setup.sql` should be safe to run against a fresh database without manual intervention; use `IF NOT EXISTS` where the target database engine supports it
- **Dependency order** — `setup.sql` must create objects in an order that respects foreign key dependencies (referenced tables before referencing tables)
- **Symmetry** — `teardown.sql` should reverse `setup.sql`; if `setup.sql` creates five objects, `teardown.sql` should remove all five, typically in reverse order
- Keep these scripts engine-agnostic where possible, or clearly document any engine-specific syntax used

---

## Relationship with the Rest of the Repository

- `setup.sql` brings the database to the state described in `schemas/`
- `seed.sql` populates that database using data organized under `seeds/`
- `teardown.sql` reverses the effect of `setup.sql`
- `config/` describes *which* database these scripts run against — these scripts describe *what happens* to that database