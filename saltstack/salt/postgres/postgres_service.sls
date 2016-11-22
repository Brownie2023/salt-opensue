install_postgres:
  pkg.installed:
    - pkgs:
      #install postgres
      - postgresql94-server

postgresql:
  service.running:
    - enable: True
