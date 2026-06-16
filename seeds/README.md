# seeds/

> Reproducible data for development and testing environments, separated by purpose.

---

## Purpose

This directory provides a place for data that populates the database after `schemas/` has been created — data that exists for **development convenience** or **automated testing**, never production data.

The separation into `development/` and `testing/` reflects two different purposes for seed data, with different expectations for each.

---

## Responsibilities

- Provide realistic, usable data for developers working locally
- Provide deterministic, minimal data for automated tests
- Keep these two purposes clearly separated so neither compromises the other

---

## Subdirectories

| Directory | Purpose |
| --- | --- |
| `development/` | Data for local development — realistic enough to build and demo features against |
| `testing/` | Data for automated tests — deterministic, minimal, and covering the edge cases tests rely on |

---

## What Belongs Here

- SQL `INSERT` statements, organized by environment
- Data that is safe to commit to version control — fictional names, placeholder emails, generated identifiers
- Comments explaining *why* a specific row exists, when it covers a specific case (e.g. "a user with no profile, to test the join")

---

## What Should NOT Be Placed Here

- Real user data or anything resembling production data, including real names, emails, or identifiers
- Large datasets — seed files should stay small enough to read and review
- Schema definitions — belong in `schemas/`
- Data that only makes sense for one environment but is placed in the other (e.g. test-only edge cases inside `development/`)

---

## Development vs. Testing — The Contract

| Aspect | `development/` | `testing/` |
| --- | --- | --- |
| Goal | Realistic data to work with | Deterministic data to assert against |
| Volume | Enough to feel like a real app | Minimal — only what tests require |
| Content | Representative, varied | Predictable, including edge cases |
| Stability | Can change over time | Should change only when tests change |

---

## Best Practices

- Use clearly fictional data (e.g. `Jane Doe`, `user1@example.com`) — never real personal information
- In `testing/`, include data that exercises edge cases your schema needs to handle (nullable fields left null, boundary values, duplicate-looking-but-distinct rows)
- In `development/`, prioritize variety and volume that make the application feel populated
- Keep seed files idempotent where possible — running `seed.sql` twice should not produce duplicate data or errors

---

## Relationship with the Rest of the Repository

- `seeds/` populates the tables defined in `schemas/tables/`
- `scripts/seed.sql` is the orchestration script that loads data from this directory
- `config/environments.yml` mirrors this same environment separation (development vs. testing) at the configuration level
- `examples/` may demonstrate seed data alongside complete schema examples