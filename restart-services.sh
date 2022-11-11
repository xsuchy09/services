#!/bin/bash

cd /srv/services/elastic-stack/elasticsearch && task docker:down && task docker:up
cd /srv/services/elastic-stack/kibana && task docker:down && task docker:up
cd /srv/services/keycloak && task docker:down && task docker:up
cd /srv/services/mail && task docker:down && task docker:up
cd /srv/services/mongo && task docker:down && task docker:up
cd /srv/services/postgres && task docker:down && task docker:up
cd /srv/services/rabbitmq && task docker:down && task docker:up
cd /srv/services/traefik && task docker:down && task docker:up
