install_web_packages:
  pkg.installed:
    - pkgs:
      #install apache
      - apache2
      #install pip
      - python-pip
  pip.installed:
    #install flask using pip
    - name: flask
    - name: flask-sqlalchemy

apache2:
  service.running:
    - enable: True
