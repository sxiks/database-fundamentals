# Example 04: PostgreSQL Standard

Modern relational implementation using PostgreSQL. This folder demonstrates syntax differences and best practices for the secondary engine.

## Configuration Steps for Debian
1. Install PostgreSQL: `sudo apt update && sudo apt install postgresql postgresql-contrib`
2. Start service: `sudo systemctl start postgresql`
3. Switch to postgres user: `sudo -i -u postgres`
4. Create user and DB: 
   ```bash
   createuser --interactive
   createdb academic_pg_db
5. Connect via DBeaver using port 5432.