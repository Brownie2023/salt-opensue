install_postgres:
  pkg.installed:
    - pkgs:
      #install postgres
      - postgresql94-server

# Initialize our postgres database
pg-initdb:
  cmd.wait:
  - name: initdb -D /var/lib/pgsql/data -E UTF8 --locale C && rm -f /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/postgresql.conf
  - user: postgres
  - watch:
    - pkg: install_postgres

# Replace our conf files so other computers can connect and postgres is running on :5432
postgres_conf:
  file.managed:
    - name: /var/lib/pgsql/data/postgresql.conf
    - source: salt://postgres/postgresql.conf
    - user: postgres
    - group: postgres
    - mode: 600
    - makedirs: True
    - require:
        - cmd: pg-initdb

pg_hba_conf:
  file.managed:
    - name: /var/lib/pgsql/data/pg_hba.conf
    - source: salt://postgres/pg_hba.conf
    - user: postgres
    - group: postgres
    - mode: 600
    - makedirs: True
    - require:
        - cmd: pg-initdb

# Make sure postgres is running
postgresql:
  service.running:
    - enable: True
    - require:
      - file: /var/lib/pgsql/data/postgresql.conf
      - file: /var/lib/pgsql/data/pg_hba.conf

# Set up our user and databse for app
postgres-database-setup:
  postgres_user:
    - present
    - name: jb
    - password: opensusepsql
    - createdb: True
    - user: postgres
    - require:
      - service: postgresql

  postgres_database:
    - present
    - name: todo
    - encoding: UTF8
    - lc_ctype: en_US.UTF8
    - lc_collate: en_US.UTF8
    - template: template0
    - owner: jb
    - user: postgres
    - require:
      - postgres_user: postgres-database-setup
