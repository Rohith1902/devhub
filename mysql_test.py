import mysql.connector

db = mysql.connector.connect(
    host = "localhost",
    user = "todo_user",
    password = "todo123",
    database = "tool_db"
)

print("Connected to MariaDB")

db.close()
