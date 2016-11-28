install_web_packages:
  pkg.installed:
    - pkgs:
      #install apache
      - apache2
      #install pip
      - python-pip
      #install psycopg2 required tools
      - python-devel
      - postgresql94-devel

  pip.installed:
    #install flask tools using pip
    - name: flask
    - name: flask-sqlalchemy
    - name: psycopg2
    - name: Flask-Restless

apache2:
  service.running:
    - enable: True
