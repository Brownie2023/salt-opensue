install_postgres:
  pkg.installed:
    - pkgs:
      #install postgres
      - postgresql94-server

postgresql:
  service.running:
    - enable: True
    - watch:
      - file: /var/lib/pgsql/data/*

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

postgres_conf:
  file.managed:
    - name: /var/lib/pgsql/data/postgresql.conf
    - source: salt://postgres/postgresql.conf
    - user: postgres
    - group: postgres
    - mode: 600
    - makedirs: True

pg_hba_conf:
  file.managed:
    - name: /var/lib/pgsql/data/pg_hba.conf
    - source: salt://postgres/pg_hba.conf
    - user: postgres
    - group: postgres
    - mode: 600
    - makedirs: True
