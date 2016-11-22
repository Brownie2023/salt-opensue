base:
  '*':
    - common
  'minion*':
    - nettools
  'minion1':
    - web_services.web_services
    - web_services.vhost
    - web_services.site
  'minion2':
    - postgres.postgres_service
