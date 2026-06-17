# Transaction Lifecycle

A transaction moves through several stages before completion.

```mermaid
flowchart LR

BEGIN

--> Operations

--> COMMIT

COMMIT --> Persisted

Operations --> ROLLBACK

ROLLBACK --> Reverted
```
