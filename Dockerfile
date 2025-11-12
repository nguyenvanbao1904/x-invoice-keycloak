# Sử dụng image Keycloak chính thức làm nền.
FROM quay.io/keycloak/keycloak:26.4

# Sao chép thư mục theme tùy chỉnh
COPY ./themes/x-invoice-theme /opt/keycloak/themes/x-invoice-theme

# Sao chép realm config để import
COPY ./config/realm-export.json /opt/keycloak/data/import/realm-export.json

# Expose port
EXPOSE 9000

# Cung cấp tham số cho ENTRYPOINT (đã có sẵn là kc.sh)
# Render sẽ tự gán biến PORT
CMD ["start-dev", "--http-port=${PORT}", "--http-host=0.0.0.0", "--import-realm"]