FROM docker.elastic.co/elasticsearch/elasticsearch:${STACK_VERSION:-8.6.1}

COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/

# Install plugins from remote
RUN elasticsearch-plugin install analysis-icu

# Install plugins from files
#COPY plugins /elasticsearch-plugins
#RUN elasticsearch-plugin install file:/elasticsearch-plugins/analysis-icu-8.6.1.zip
