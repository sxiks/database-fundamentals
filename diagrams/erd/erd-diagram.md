# Entity Relationship Diagram


## Overview
The schema represents a basic academic management system. 

## Relations
- **students (1) to (N) enrollments:** A student can have multiple course enrollments.
- **courses (1) to (N) enrollments:** A course can have multiple students enrolled.
- **enrollments:** Junction table resolving the Many-to-Many relationship between `students` and `courses`.