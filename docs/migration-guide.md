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