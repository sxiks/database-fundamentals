# Data Dictionary

## Overview

A Data Dictionary is a document that describes the structure of a database.

It provides information about:

- Tables
- Columns
- Data types
- Constraints
- Relationships
- Business meaning

Data dictionaries help developers, analysts, and database administrators understand how data is organized.

---

## Why It Matters

Without documentation:

- Database structures become difficult to understand.
- New team members require more onboarding time.
- Business rules become unclear.

A data dictionary acts as a reference for everyone working with the database.

---

## Example

### customers

| Column | Data Type | Description |
|----------|----------|-------------|
| id | INTEGER | Unique customer identifier |
| name | VARCHAR(100) | Customer full name |
| email | VARCHAR(255) | Customer email address |
| country | VARCHAR(100) | Customer country |

---

### orders

| Column | Data Type | Description |
|----------|----------|-------------|
| id | INTEGER | Unique order identifier |
| customer_id | INTEGER | Customer reference |
| order_date | DATE | Order creation date |
| total_amount | DECIMAL(10,2) | Order total |

---

## Best Practices

- Document every table.
- Document every column.
- Include business meaning.
- Keep documentation updated.
- Store the dictionary alongside the database project.

---

## Learning Outcome

After completing this topic, you should be able to:

- Document database structures.
- Create maintainable database projects.
- Improve collaboration between developers and analysts.