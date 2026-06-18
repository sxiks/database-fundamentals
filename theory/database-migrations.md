# Migration Guide

Database changes are managed sequentially through SQL scripts located in the `/migrations` directory.

## Execution Order
Migrations must be executed in numerical order based on their prefix.

1. `001-initial-schema.sql`: Base tables and primary keys.
2. `002-add-indexes.sql`: Performance optimizations.

## Rollback Strategy
Every `UP` migration must have a corresponding logic to revert changes in `scripts/teardown.sql` (e.g., `DROP TABLE IF EXISTS`).

## DBeaver Execution
To run migrations manually:
1. Open DBeaver.
2. Select the target development database.
3. Open the migration file (`Ctrl + O` or `Cmd + O`).
4. Execute the script (`Alt + X`).

---

## Overview

A database migration is a controlled change to a database schema.

Instead of manually modifying tables, changes are stored as versioned scripts.

Examples:

- Creating tables
- Adding columns
- Removing columns
- Renaming tables

---

## Why Migrations Matter

Migrations provide:

- Version control for databases
- Repeatable schema changes
- Safer deployments
- Easier collaboration

Without migrations, database changes can become difficult to track.

---

## Example

### Migration 001

```sql
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);
```
### Migration 002


```sql
ALTER TABLE customers
ADD COLUMN email VARCHAR(255);
```
---

## Typical Workflow

1. Create migration.
2. Review migration.
3. Apply migration.
4. Commit migration to version control.

---

## Popular Tools

- Flyway
- Liquibase
- Alembic
- Prisma Migrate

---

## Learning Outcome

After completing this topic, you should understand:

- What migrations are.
- Why databases need versioning.
- How schema changes are managed in real projects.