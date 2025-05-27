from flask import Flask, jsonify, request
import pyodbc
import os

app = Flask(__name__)

# Database connection settings
server = os.getenv('DB_SERVER')
database = os.getenv('DB_NAME')
username = os.getenv('DB_USERNAME')
password = os.getenv('DB_PASSWORD')
driver = '{ODBC Driver 17 for SQL Server}'

# Establish a connection to the database
def get_db_connection():
    conn = pyodbc.connect(f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password}')
    return conn

@app.route('/api/data', methods=['GET'])
def get_data():
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM your_table_name')  # Replace with your actual table name
    rows = cursor.fetchall()
    cursor.close()
    conn.close()

    return jsonify([dict(zip([column[0] for column in cursor.description], row)) for row in rows])

@app.route('/api/data', methods=['POST'])
def create_data():
    new_data = request.json
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute('INSERT INTO your_table_name (column1, column2) VALUES (?, ?)', 
                   new_data['column1'], new_data['column2'])  # Replace with your actual columns
    conn.commit()
    cursor.close()
    conn.close()

    return jsonify(new_data), 201

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)