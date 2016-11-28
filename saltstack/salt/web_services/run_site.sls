set_flask_app:
  cmd.run:
    - name: export FLASK_APP=/srv/www/htdocs/todoapp.py
    - name: echo $FLASK_APP

run_flask_app:
  cmd.run:
    - name: flask run --host=0.0.0.0
