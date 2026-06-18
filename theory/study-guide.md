# Database Fundamentals Study Guide

## Goal

Learn the core concepts required to design relational databases correctly.

## Learning Path

### 1. Database Fundamentals

Topics:

- What is a database
- DBMS (Database Management Systems)
- Relational databases

Resources:

- database-architecture.md

Learning Outcome:

- Understand how relational databases store and organize information.

---

### 2. Data Modeling

Topics:

- Entities
- Attributes
- Relationships
- Cardinality

Resources:

- diagrams/erd/one-to-one.md
- diagrams/erd/one-to-many.md
- diagrams/erd/many-to-many.md
- diagrams/erd/erd-diagram.md
- diagrams/erd/ecommerce-erd.md

Learning Outcome:

- Design simple Entity-Relationship Diagrams (ERDs).

---

### 3. SQL Fundamentals

Topics:

- CREATE TABLE
- INSERT
- SELECT
- UPDATE
- DELETE

Resources:

- examples/ddl
- examples/relationships
- exercises/beginner

Learning Outcome:

- Create tables and manipulate data using SQL.

---

### 4. Database Normalization

Topics:

- First Normal Form (1NF)
- Second Normal Form (2NF)
- Third Normal Form (3NF)

Resources:

- diagrams/normalization/first-normal-form.md
- diagrams/normalization/second-normal-form.md
- diagrams/normalization/third-normal-form.md
- diagrams/normalization/normalization-process.md

Learning Outcome:

- Design schemas that reduce redundancy and improve consistency.

---

### 5. Indexing

Topics:

- B-Tree indexes
- Query performance
- Index usage

Resources:

- diagrams/indexing/btree-index.md
- diagrams/indexing/query-with-index.md
- diagrams/indexing/query-without-index.md

Learning Outcome:

- Understand when and why indexes improve performance.

---

### 6. Complex Queries

Topics:

- JOINs
- Aggregations
- GROUP BY
- HAVING
- Subqueries

Resources:

- examples/queries

Learning Outcome:

- Retrieve and analyze data across multiple tables.

---

### 7. Transactions

Topics:

- ACID Properties
- Isolation Levels
- Transaction Lifecycle

Resources:

- diagrams/transactions/acid-properties.md
- diagrams/transactions/isolation-levels.md
- diagrams/transactions/transaction-lifecycle.md

Learning Outcome:

- Understand consistency and reliability in database operations.

---

### 8. Database Documentation

Topics:

- Data Dictionaries
- Database Documentation

Resources:

- data-dictionary.md

Learning Outcome:

- Document database structures clearly.

---

### 9. Database Migrations

Topics:

- Schema Versioning
- Controlled Database Changes

Resources:

- database-migrations.md

Learning Outcome:

- Understand how database schemas evolve over time.

---

## Final Outcome

After completing this repository, you should be able to:

- Design relational database schemas
- Apply normalization principles
- Create SQL databases
- Write complex queries
- Use indexes effectively
- Understand transactional behavior