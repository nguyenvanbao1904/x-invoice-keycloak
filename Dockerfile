FROM quay.io/keycloak/keycloak:26.4

COPY ./themes/x-invoice-theme /opt/keycloak/themes/x-invoice-theme
COPY ./config/realm-export.json /opt/keycloak/data/import/realm-export.json

ENV KC_HTTP_HOST="0.0.0.0"
ENV KC_HTTP_PORT="9000"
ENV KEYCLOAK_IMPORT="/opt/keycloak/data/import/realm-export.json"
ENV KC_HOSTNAME="https://x-invoice-keycloak.onrender.com"
ENV KC_HOSTNAME_STRICT="false"
ENV KC_HTTP_RELATIVE_PATH="/auth"

ENV KC_PROXY="edge"

EXPOSE 9000

CMD ["start"]