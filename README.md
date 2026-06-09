# template-database

> Database project template with schema versioning, seed data, organized DDL, and documentation — for SQL projects that grow predictably and stay maintainable.

---

# Purpose

`template-database` provides a structured foundation for database projects that extend beyond a few simple `CREATE TABLE` statements.

The template introduces three fundamental concepts used in professional database development:

- **Migrations** — schema version control
- **Seeds** — reproducible development and testing data
- **Schemas** — organized DDL separated by object type

The template separates database concerns into distinct areas:

| Concern | Directory |
| --- | --- |
| Current database structure | `schemas/` |
| Schema evolution history | `migrations/` |
| Development and testing data | `seeds/` |
| Setup automation | `scripts/` |

This organization mirrors practices used in professional software development environments.

---

# When to Use This Template

## Use `template-database` when:

- The project is primarily focused on database design
- You need schema version tracking
- The project contains multiple related tables
- You need reproducible development or testing data
- You are learning or demonstrating:
  - SQL
  - Entity-Relationship Design (ERD)
  - Data Modeling
  - Database Architecture

---

## Do NOT Use `template-database` when:

### Backend APIs with a Database

Use:

```text
template-backend-api
```

instead, since it already contains its own database layer structure.

### Simple SQL Practice Exercises

Use:

```text
db-fundamentals
```

instead.

### Projects Without Data Persistence

A database template is unnecessary.

---

# Use Cases

This template is suitable for:

- SENA database design deliverables
- Database architecture portfolio projects
- ERD and normalization demonstrations
- Independent database planning projects
- SQL testing environments
- Query experimentation
- View development
- Reporting systems
- Schema prototyping before application development

---

# Features

## Schema Control Structure

Separates:

- Current schema definitions
- Historical migrations

This allows database evolution to be tracked cleanly over time.

---

## Idempotent Setup Scripts

Includes:

```text
scripts/setup.sql
```

which can:

- Rebuild the database
- Recreate objects
- Execute in the proper order
- Provide a repeatable environment setup

---

## Environment-Agnostic Data Seeding

Provides structured seed files such as:

```text
seeds/01-base-seed.sql
```

to generate reproducible development data.

---

## Documentation Templates

Pre-configured documentation structure inside:

```text
docs/
```

including:

- ERD documentation
- Data dictionary documentation

---

## SQL Coding Standards

Includes predefined conventions for:

- Constraints
- Object naming
- Structural organization
- Modern SQL formatting practices

---

# Architecture and Structure

```text
template-database/
├── docs/
│   ├── data-dictionary.md
│   └── erd-diagram.md
│
├── migrations/
│   ├── 001-init-schema.sql
│   └── 002-add-verification.sql
│
├── schemas/
│   ├── functions/
│   ├── tables/
│   │   ├── 01-users.sql
│   │   └── 02-profiles.sql
│   ├── triggers/
│   └── views/
│
├── scripts/
│   └── setup.sql
│
├── seeds/
│   └── 01-base-seed.sql
│
├── .gitignore
└── README.md
```

---

# Directory Responsibilities

## docs/

Database architecture documentation.

| File | Purpose |
| --- | --- |
| `data-dictionary.md` | Tables, columns, constraints, and data types |
| `erd-diagram.md` | ERD diagrams or Mermaid representations |

---

## migrations/

Chronological schema evolution.

| File | Purpose |
| --- | --- |
| `001-init-schema.sql` | Initial schema creation |
| `002-add-verification.sql` | Example schema modification |

### Rules

- Append only
- Never rewrite historical migrations
- Maintain chronological order

---

## schemas/

Canonical database definition.

### tables/

Contains table definitions.

| File | Purpose |
| --- | --- |
| `01-users.sql` | User table definition |
| `02-profiles.sql` | Profile table definition |

### views/

Virtual query projections.

### functions/

Stored procedures and reusable database logic.

### triggers/

Event-driven database automation.

---

## scripts/

Environment orchestration.

| File | Purpose |
| --- | --- |
| `setup.sql` | Master setup execution file |

---

## seeds/

Development datasets.

| File | Purpose |
| --- | --- |
| `01-base-seed.sql` | Base testing data |

---

# Quick Start

## 1. Initialize the Repository

Use GitHub's **Use this template** button to generate a new repository.

Clone it locally:

```bash
git clone https://github.com/your-username/your-database-project.git

cd your-database-project
```

---

## 2. Configure Your Database Target

Open your preferred database client.

Examples:

- DBeaver
- DataGrip
- PostgreSQL CLI (`psql`)
- MySQL CLI

Create or connect to a local database instance.

---

## 3. Run the Structural Baseline Setup

Execute:

```bash
psql -U your_user -d your_db -f scripts/setup.sql
```

Alternatively:

1. Open `scripts/setup.sql`
2. Connect to the target database
3. Execute the entire script

Example in DBeaver:

```text
Alt + X
```

---

## 4. Verify Database Integrity

Run a validation query:

```sql
SELECT * FROM users;
```

Verify:

- Tables were created
- Constraints exist
- Seed data was inserted successfully

---

# Customization and Scaling Rules

Maintain the following structural contract.

| Element | Scalable? | Notes |
| --- | --- | --- |
| `schemas/` directory names | No  | Fixed structure |
| Files inside `schemas/` | Yes | One object per file |
| Migration numbering | No  | Always `NNN-description.sql` |
| Migration content | No  | Never edit after merge |
| `seeds/` structure | Yes | Environment-specific seeds allowed |
| `scripts/` | Yes | Additional automation scripts may be added |

---

## Fixed Schema Directories

The following directories must remain unchanged:

```text
schemas/
├── tables/
├── views/
├── functions/
└── triggers/
```

---

## Migration Convention

Always use:

```text
001-init-schema.sql
002-add-users.sql
003-add-orders.sql
004-create-reporting-view.sql
```

Format:

```text
NNN-description.sql
```

---

## Seed Expansion

Additional environments may be added:

```text
seeds/
├── development/
├── staging/
└── production/
```

---

## Script Expansion

Additional automation scripts may be created:

```text
scripts/
├── setup.sql
├── backup.sql
├── analyze.sql
└── restore.sql
```

---

# Roadmap

- [ ] Add `example-01-basic-schema`
- [ ] Add `example-02-relations`
- [ ] Add `example-03-complex-queries`
- [ ] Add Mermaid ERD starter examples
- [ ] Add `scripts/migrate.sh`
- [ ] Add PostgreSQL-specific setup scripts
- [ ] Add MySQL-specific setup scripts

---

# References

## Database Systems

- PostgreSQL Documentation
- DBeaver – Universal Database Tool

---

## Database Design

- Database Normalization
- Mermaid ERD Diagrams

---

## SQL Standards

- SQL Style Guide – Simon Holywell

---

## Version Control

- Conventional Commits

---

# Ecosystem

Part of the sxiks project ecosystem.

**Type:** Template

**Domain:** Database