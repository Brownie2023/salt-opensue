# Create our initial table in our todo db for our app
create_postgres_table_with_python:
  cmd.run:
    - name: python /srv/www/htdocs/create_db.py
