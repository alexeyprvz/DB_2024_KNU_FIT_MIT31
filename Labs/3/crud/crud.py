from flask import Flask, request, jsonify
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(
    dbname="vacuum_cleaners_db",
    user="postgres",
    password="1234",
    host="127.0.0.1",
    port="5433"
)
cur = conn.cursor()

# READ /vacuum_cleaners
@app.route('/vacuum_cleaners', methods=['GET'])
def get_vacuum_cleaners():
    cur.execute('SELECT * FROM "VacuumCleaner"')
    vacuum_cleaners = cur.fetchall()
    return jsonify(vacuum_cleaners)

# READ /vacuum_cleaners/<int:vacuum_cleaner_id>
@app.route('/vacuum_cleaners/<int:vacuum_cleaner_id>', methods=['GET'])
def get_vacuum_cleaner_by_id(vacuum_cleaner_id):
    try:
        cur.execute("""
            SELECT * FROM "VacuumCleaner"
            WHERE vacuum_cleaner_id = %s
        """, (vacuum_cleaner_id,))
        vacuum_cleaner = cur.fetchone()
        if vacuum_cleaner:
            return jsonify(vacuum_cleaner)
        else:
            return jsonify({'error': 'Vacuum cleaner not found'}), 404
    except Exception as e:
        return jsonify({'error': str(e)}), 500

# CREATE /vacuum_cleaners
@app.route('/vacuum_cleaners', methods=['POST'])
def add_vacuum_cleaner():
    data = request.json
    cur.execute('INSERT INTO "VacuumCleaner" (brand_id, name, manufacture_country_id, type_id, power_w, weight_kg) VALUES (%s, %s, %s, %s, %s, %s)',
                (data['brand_id'], data['name'], data['manufacture_country_id'], data['type_id'], data['power_w'], data['weight_kg']))
    conn.commit()
    return jsonify({'message': 'Vacuum cleaner added successfully'})

# UPDATE /vacuum_cleaners/<vacuum_cleaner_id>
@app.route('/vacuum_cleaners/<int:vacuum_cleaner_id>', methods=['PUT'])
def update_vacuum_cleaner(vacuum_cleaner_id):
    try:
        data = request.json
        brand_id = data.get('brand_id')
        name = data.get('name')
        manufacture_country_id = data.get('manufacture_country_id')
        type_id = data.get('type_id')
        power_w = data.get('power_w')
        weight_kg = data.get('weight_kg')

        cur.execute('UPDATE "VacuumCleaner" SET brand_id = %s, name = %s, manufacture_country_id = %s, type_id = %s, power_w = %s, weight_kg = %s WHERE vacuum_cleaner_id = %s',
                    (brand_id, name, manufacture_country_id, type_id, power_w, weight_kg, vacuum_cleaner_id))

        conn.commit()

        return jsonify({'message': 'Vacuum cleaner updated successfully'})
    except Exception as e:
        conn.rollback()
        return jsonify({'error': str(e)}), 500

# DELETE /vacuum_cleaners/<vacuum_cleaner_id>
@app.route('/vacuum_cleaners/<int:vacuum_cleaner_id>', methods=['DELETE'])
def delete_vacuum_cleaner(vacuum_cleaner_id):
    try:
        cur.execute('DELETE FROM "VacuumCleaner" WHERE vacuum_cleaner_id = %s', (vacuum_cleaner_id,))

        conn.commit()

        return jsonify({'message': 'Vacuum cleaner deleted successfully'})
    except Exception as e:
        conn.rollback()
        return jsonify({'error': str(e)}), 500
    
# Порахуавти к-ть моделей одного бренду
# COUNT /vacuum_cleaners/count_by_brand/<int:brand_id>
@app.route('/vacuum_cleaners/count_by_brand/<int:brand_id>', methods=['GET'])
def count_vacuum_cleaners_by_brand(brand_id):
    try:
        cur.execute('SELECT COUNT(*) FROM "VacuumCleaner" WHERE brand_id = %s', (brand_id,))
        count = cur.fetchone()[0]
        return jsonify({'brand_id': brand_id, 'count': count})
    except Exception as e:
        return jsonify({'error': str(e)}), 500
    
# Порахуавти к-ть моделей виготовлених в одній країні
# COUNT /vacuum_cleaners/count_by_country/<int:manufacture_country_id>
@app.route('/vacuum_cleaners/count_by_country/<int:manufacture_country_id>', methods=['GET'])
def count_vacuum_cleaners_by_country(manufacture_country_id):
    try:
        cur.execute('SELECT COUNT(*) FROM "VacuumCleaner" WHERE manufacture_country_id = %s', (manufacture_country_id,))
        count = cur.fetchone()[0]
        return jsonify({'manufacture_country_id': manufacture_country_id, 'count': count})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)