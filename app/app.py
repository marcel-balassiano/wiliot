from flask import Flask, jsonify, request
import psycopg2
import os

app = Flask(__name__)

# Database configuration from environment variables
db_config = {
    'host': os.getenv('DB_HOST'),
    'user': os.getenv('DB_USER'),
    'password': os.getenv('DB_PASSWORD'),
    'database': os.getenv('DB_NAME'),
    'port': os.getenv('DB_PORT', 5432)
}

def create_table():
    conn = psycopg2.connect(**db_config)
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS data (
            id SERIAL PRIMARY KEY,
            content VARCHAR(255),
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')
    conn.commit()
    conn.close()

@app.route('/hello', methods=['GET'])
def hello():
    return jsonify({"message": "Hello Marcel!"})

@app.route('/insert', methods=['POST'])
def insert_data():
    data = request.json
    conn = psycopg2.connect(**db_config)
    cursor = conn.cursor()
    cursor.execute('INSERT INTO data (content) VALUES (%s) RETURNING id', (data['content'],))
    new_id = cursor.fetchone()[0]
    conn.commit()
    conn.close()
    return jsonify({"status": "success", "id": new_id})

@app.route('/select', methods=['GET'])
def select_data():
    conn = psycopg2.connect(**db_config)
    cursor = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    cursor.execute('SELECT * FROM data ORDER BY created_at DESC')
    results = [dict(row) for row in cursor.fetchall()]
    conn.close()
    return jsonify(results)

if __name__ == '__main__':
    create_table()
    app.run(host='0.0.0.0', port=5000)