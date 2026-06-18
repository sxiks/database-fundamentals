CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TABLE students_audit (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER update_students_audit_modtime
BEFORE UPDATE ON students_audit
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();