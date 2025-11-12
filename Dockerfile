# Sử dụng image Keycloak chính thức làm nền.
FROM quay.io/keycloak/keycloak:26.4

# Sao chép thư mục theme tùy chỉnh
COPY ./themes/x-invoice-theme /opt/keycloak/themes/x-invoice-theme

# Sao chép realm config để import
COPY ./config/realm-export.json /opt/keycloak/data/import/realm-export.json