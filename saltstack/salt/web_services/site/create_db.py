from todoapp import app
from models import db, Todo

db.create_all()

suse = Todo(title=u"Get SUSE Job")

db.session.add(suse)
db.session.commit()
