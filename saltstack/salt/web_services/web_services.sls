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
    - pkgs:
    #install flask tools using pip
      - flask
      - flask-sqlalchemy
      - psycopg2
      - Flask-Restless

#Make sure apache is running
apache2:
  service.running:
    - enable: True
