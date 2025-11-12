# Sử dụng image Keycloak chính thức làm nền.
FROM quay.io/keycloak/keycloak:26.4

# 1. SAO CHÉP FILE
COPY ./themes/x-invoice-theme /opt/keycloak/themes/x-invoice-theme
COPY ./config/realm-export.json /opt/keycloak/data/import/realm-export.json

# 2. FIX CỨNG CẤU HÌNH (TRỪ DB VÀ ADMIN)
ENV KC_HTTP_HOST="0.0.0.0"
ENV KC_HTTP_PORT="9000"
ENV KEYCLOAK_IMPORT="/opt/keycloak/data/import/realm-export.json"
ENV KC_HOSTNAME="https://x-invoice-keycloak.onrender.com"
ENV KC_HOSTNAME_STRICT="false"
ENV KC_HTTP_RELATIVE_PATH="/auth"

# --- CÁC SỬA LỖI QUAN TRỌNG ---
ENV KC_PROXY_HEADERS="xforwarded"
ENV KC_HTTP_ENABLED="true"
ENV KC_DB="mysql"

# 3. BUILD PRODUCTION (Sẽ lâu, nhưng chỉ 1 lần)
RUN /opt/keycloak/bin/kc.sh build

# 4. EXPOSE PORT
EXPOSE 9000

# 5. LỆNH KHỞI ĐỘNG (Sẽ rất nhanh)
CMD ["start"]