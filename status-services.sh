#!/bin/bash

cd /srv/services/elastic-stack/elasticsearch && task docker:ps
cd /srv/services/elastic-stack/kibana && task docker:ps
cd /srv/services/keycloak && task docker:ps
cd /srv/services/mail && task docker:ps
cd /srv/services/mongo && task docker:ps
cd /srv/services/postgres && task docker:ps
cd /srv/services/rabbitmq && task docker:ps
cd /srv/services/traefik && task docker:ps
