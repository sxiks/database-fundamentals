# Query Without Index

Without an index, the database scans rows sequentially.

```mermaid
flowchart LR

Query

--> FullTableScan

--> Result
```
