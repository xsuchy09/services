#!/bin/bash

cd /srv/services/elastic-stack/elasticsearch && task docker:down
cd /srv/services/elastic-stack/kibana && task docker:down
cd /srv/services/keycloak && task docker:down
cd /srv/services/mail && task docker:down
cd /srv/services/mongo && task docker:down
cd /srv/services/postgres && task docker:down
cd /srv/services/rabbitmq && task docker:down
cd /srv/services/traefik && task docker:down
