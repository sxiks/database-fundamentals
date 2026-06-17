# E-Commerce ERD

Example entity relationship diagram for an e-commerce platform.

```mermaid
erDiagram

CUSTOMER ||--o{ ORDER : places

ORDER ||--|{ ORDER_ITEM : contains

PRODUCT ||--o{ ORDER_ITEM : referenced_by
```
