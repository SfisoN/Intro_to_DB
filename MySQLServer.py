import mysql.connector
from mysql.connector import Error


def create_db():
    """Create a new database named 'alx_sql_db'."""
    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='EMi6gR7@US!qrjA'
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_sql_db' created successfully.")

    except mysql.connector.Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
      if 'cursor' in locals() and cursor is not None:
          cursor.close()
      if connection in locals() and connection.is_connected():
          connection.close()


if __name__ == "__main__":
    create_db()