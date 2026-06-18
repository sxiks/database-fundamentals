import psycopg2

connection = psycopg2.connect(
    host="localhost",
    database="academic_db",
    user="postgres",
    password="password"
)

cursor = connection.cursor()

cursor.execute("SELECT * FROM students")

for row in cursor.fetchall():
    print(row)

connection.close()