from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://jb:opensusepsql@192.168.50.12/todo'
db = SQLAlchemy(app)

class Todo (db.Model):
    __tablename__ = "todo"
    id = db.Column('id', db.Integer, primary_key=True)
    title = db.Column('title', db.Unicode, default=u"Get SUSE Job")
    date_created = db.Column('date_created', db.Date, default=datetime.utcnow())
    date_completed = db.Column('date_completed', db.Date)
    complete = db.Column('complete', db.Boolean, default=False)

def __init__(self, title):
    self.title = title
