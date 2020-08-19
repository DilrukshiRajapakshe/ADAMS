#!flask/bin/python
from asyncio import tasks
from os import abort

from flask import Flask, jsonify, request

app = Flask(__name__)

tasks = [
    {
        'id': 0,
        'answer': 'ඔව්,බොහෝ විට,හමුවීම,වෛද්‍ය'
    }
]

@app.route('/api/adams', methods=['GET'])
def get_tasks():
    return jsonify({'tasks': tasks})

if __name__ == '__main__':
    app.run(debug=True)


# Test POST Method
from flask import request

@app.route('/api/adams', methods=['POST'])
def create_task():
    if not request.json or not 'title' in request.json:
        abort(400)
    task = {
        'id': tasks[-1]['id'] + 1,
        'title': request.json['title'],
        'description': request.json.get('description', ""),
        'done': False
    }
    tasks.append(task)
    return jsonify({'task': task}), 201
