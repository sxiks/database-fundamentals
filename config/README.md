# config/

> Reference configuration templates for database connections and environment-specific settings.

---

## Purpose

This directory provides reference templates for database connection configuration. These files demonstrate **how** a project should structure its configuration — not **what** the real values should be.

`config/database.yml` and `config/environments.yml` are templates. They contain placeholder values intended to be replaced when this template is used for a real project, and the replaced values are expected to live outside version control.

---

## Responsibilities

- Document the configuration keys a database project typically needs (connection strings, ports, credential placeholders, environment names)
- Demonstrate a clean separation between environments (development, testing, staging, production)
- Show a structure that can be adapted to any database engine (PostgreSQL, MySQL, SQLite, etc.)

---

## What Belongs Here

- `database.yml` — reference structure for database connection settings, using placeholder values
- `environments.yml` — reference structure for environment-specific overrides (development, testing, production)
- Additional reference configuration templates, as long as they contain placeholder values only

---

## What Should NOT Be Placed Here

- Real database credentials — usernames, passwords, hosts, or ports of an actual database
- `.env` files or any file containing secrets
- Local override files intended for personal use (e.g. `database.local.yml`) — these are excluded by `.gitignore` and should never be committed
- Application code that reads or parses these files — this template is database-only and does not include an application layer

---

## Best Practices

- Treat every value in `database.yml` and `environments.yml` as a **placeholder**, never as a real credential
- When adapting this template for a real project, create local override files (e.g. `database.local.yml`) and keep them out of version control — `.gitignore` already excludes this pattern
- Prefer environment variables for secrets in real projects; configuration files should reference variable names, not literal values
- Keep the structure of these files stable across environments — only values should differ, not keys

---

## Examples

`database.yml` (illustrative structure):

```yaml
development:
  adapter: postgresql
  host: localhost
  port: 5432
  database: app_development
  username: ENV_DB_USERNAME
  password: ENV_DB_PASSWORD

testing:
  adapter: postgresql
  host: localhost
  port: 5432
  database: app_testing
  username: ENV_DB_USERNAME
  password: ENV_DB_PASSWORD
```

`environments.yml` (illustrative structure):

```yaml
development:
  log_level: debug
  seed_on_setup: true

testing:
  log_level: warn
  seed_on_setup: true

production:
  log_level: error
  seed_on_setup: false
```

---

## Relationship with the Rest of the Repository

- `scripts/setup.sql` is conceptually executed against a database described by `database.yml`
- `environments.yml` mirrors the environment separation used in `seeds/development/` and `seeds/testing/`
- This directory does not interact with `migrations/` or `schemas/` directly — it describes *where* the database lives, not *what* it contains