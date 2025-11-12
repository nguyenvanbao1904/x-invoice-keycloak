# Sử dụng image Keycloak chính thức làm nền.
FROM quay.io/keycloak/keycloak:26.4

# Sao chép thư mục theme tùy chỉnh (giống docker-compose.yml)
COPY ./themes/x-invoice-theme /opt/keycloak/themes/x-invoice-theme

# Sao chép realm config để import (giống docker-compose.yml volume)
COPY ./config/realm-export.json /opt/keycloak/data/import/realm-export.json

# Expose port (Railway sẽ tự động set PORT env variable)
# Nếu Railway set PORT, dùng PORT; nếu không, dùng 9000 như docker-compose
EXPOSE 9000

# Build optimized Keycloak for production (nhanh hơn dev mode)
# Production mode cần database, sẽ config qua env variables trên Render
RUN /opt/keycloak/bin/kc.sh build

# Start Keycloak in production mode
# Database config sẽ được set qua env variables: KC_DB, KC_DB_URL, KC_DB_USERNAME, KC_DB_PASSWORD
CMD ["/bin/sh", "-c", "/opt/keycloak/bin/kc.sh start --http-port=${PORT} --http-host=0.0.0.0 --import-realm --optimized"]