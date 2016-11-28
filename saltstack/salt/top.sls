base:
  '*':
    - common
  'minion*':
    - nettools
  'minion1':
    - postgres.postgres_client
    - web_services.web_services
    - web_services.vhost
    - web_services.site
  'minion2':
    - postgres.postgres_service
