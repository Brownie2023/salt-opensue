# add vhost conf file to apache for our site
apache_conf:
  file.managed:
    - name: /etc/apache2/vhosts.d/example.conf
    - source: salt://web_services/example_site.conf
    - mode: 644
    - makedirs: True
