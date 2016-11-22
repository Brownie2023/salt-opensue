site_conf:
  file.recurse:
    - user: root
    - name: /srv/www/htdocs
    - source: salt://web_services/site
    - dir_mode: 2775
    - file_mode: 0664
    - makedirs: True
