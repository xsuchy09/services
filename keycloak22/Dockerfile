FROM quay.io/keycloak/keycloak:22.0 as builder

# environments from docker compose
ARG KC_HEALTH_ENABLED
ARG KC_DB
ARG KC_DB_URL
ARG KC_DB_USERNAME
ARG KC_DB_PASSWORD
ARG KC_HOSTNAME

WORKDIR /opt/keycloak

# copy providers
COPY ./docker/keycloak/providers/* /opt/keycloak/providers/

# for demonstration purposes only, please make sure to use proper certificates in production instead
ARG KEYTOOL_EXT="SAN:c=DNS:${KC_HOSTNAME},IP:127.0.0.1"
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext ${KEYTOOL_EXT} -keystore conf/server.keystore
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:22.0
COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
