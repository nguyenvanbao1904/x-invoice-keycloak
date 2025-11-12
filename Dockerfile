# Sử dụng image Keycloak chính thức làm nền.
FROM quay.io/keycloak/keycloak:26.4

# Sao chép thư mục theme tùy chỉnh
COPY ./themes/x-invoice-theme /opt/keycloak/themes/x-invoice-theme

# Sao chép realm config để import
COPY ./config/realm-export.json /opt/keycloak/data/import/realm-export.json

# Expose port
EXPOSE 9000

# Dùng "shell form" (không có ngoặc vuông)
# Lệnh này sẽ GHI ĐÈ ENTRYPOINT mặc định và chạy qua /bin/sh -c
# Điều này cho phép ${PORT} được mở rộng (expanded)
CMD /opt/keycloak/bin/kc.sh start-dev --http-port=${PORT} --http-host=0.0.0.0 --import-realm