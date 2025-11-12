# Sử dụng image Keycloak chính thức làm nền.
FROM quay.io/keycloak/keycloak:26.4

# 1. SAO CHÉP FILE
COPY ./themes/x-invoice-theme /opt/keycloak/themes/x-invoice-theme
COPY ./config/realm-export.json /opt/keycloak/data/import/realm-export.json

# 2. FIX CỨNG CẤU HÌNH (TRỪ ADMIN/PASSWORD)
# --- Cấu hình cốt lõi để chạy (Fix lỗi) ---
ENV KC_HTTP_HOST="0.0.0.0"
ENV KC_START_DEV="true"
ENV KC_HTTP_PORT="9000"
ENV KEYCLOAK_IMPORT="/opt/keycloak/data/import/realm-export.json"

# --- Cấu hình hostname ---
ENV KC_HOSTNAME="https://x-invoice-keycloak.onrender.com"
ENV KC_HOSTNAME_STRICT="false"
ENV KC_HTTP_RELATIVE_PATH="/auth"
ENV KC_PROXY_HEADERS="xforwarded"

# 3. EXPOSE PORT
EXPOSE 9000