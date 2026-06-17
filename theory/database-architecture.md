# Database Architecture

## Engines
- **MySQL (Primary):** Used for standard relational implementations. Default engine for academic deliveries and basic feature examples.
- **PostgreSQL (Secondary):** Used for advanced spatial data, complex JSON processing, and modern backend integrations.

## Schema Design Rules
1. Every table must have a primary key (`id` INT AUTO_INCREMENT or UUID).
2. Use `created_at` and `updated_at` timestamps on all transactional tables.
3. Enforce referential integrity using `FOREIGN KEY` constraints.
4. Soft deletes should be implemented using a `deleted_at` timestamp or `is_active` boolean rather than hard deleting records.

## Tooling
- Schema management and query testing are handled via DBeaver.
- SQL scripts are written and formatted in VSCode.