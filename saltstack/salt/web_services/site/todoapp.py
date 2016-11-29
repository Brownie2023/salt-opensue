from flask import Flask, render_template, request
from flask_restless import APIManager
from flask_sqlalchemy import SQLAlchemy
from models import Todo, db

app = Flask(__name__, static_url_path='')
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://jb:opensusepsql@192.168.50.12/todo'

api_manager = APIManager(app, flask_sqlalchemy_db=db)
api_manager.create_api(Todo, methods=['GET', 'POST', 'DELETE', 'PUT'])

@app.route('/')
def index():
    return app.send_static_file("index.html")

if __name__ == '__main__':
    app.run(host='0.0.0.0')
