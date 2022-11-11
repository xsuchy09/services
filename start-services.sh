#!/bin/bash

cd /srv/services/elastic-stack/elasticsearch && task docker:up
cd /srv/services/elastic-stack/kibana && task docker:up
cd /srv/services/keycloak && task docker:up
cd /srv/services/mail && task docker:up
cd /srv/services/mongo && task docker:up
cd /srv/services/postgres && task docker:up
cd /srv/services/rabbitmq && task docker:up
cd /srv/services/traefik && task docker:up
