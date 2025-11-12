# Sử dụng image Keycloak chính thức làm nền.
FROM quay.io/keycloak/keycloak:26.4

# Sao chép thư mục theme tùy chỉnh (giống docker-compose.yml)
COPY ./themes/x-invoice-theme /opt/keycloak/themes/x-invoice-theme

# Sao chép realm config để import (giống docker-compose.yml volume)
COPY ./config/realm-export.json /opt/keycloak/data/import/realm-export.json

# Expose port (Railway sẽ tự động set PORT env variable)
# Nếu Railway set PORT, dùng PORT; nếu không, dùng 9000 như docker-compose
EXPOSE 9000

# Command giống docker-compose.yml: start-dev --http-port=9000 --import-realm
# Railway sẽ tự set PORT env, nên dùng ${PORT:-9000} để fallback về 9000
CMD ["/bin/sh", "-c", "/opt/keycloak/bin/kc.sh start-dev --http-port=${PORT:-9000} --import-realm"]
