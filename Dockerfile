# Sử dụng image Keycloak chính thức làm nền.
FROM quay.io/keycloak/keycloak:26.4

# Sao chép thư mục theme tùy chỉnh
COPY ./themes/x-invoice-theme /opt/keycloak/themes/x-invoice-theme

# Sao chép realm config để import
COPY ./config/realm-export.json /opt/keycloak/data/import/realm-export.json

# Expose port
EXPOSE 9000

# GHI ĐÈ ENTRYPOINT:
# Bắt buộc dùng /bin/sh -c để ${PORT} có thể được mở rộng
ENTRYPOINT ["/bin/sh", "-c"]

# CMD bây giờ là một chuỗi lệnh ĐẦY ĐỦ mà shell sẽ thực thi
CMD ["/opt/keycloak/bin/kc.sh start-dev --http-port=${PORT} --http-host=0.0.0.0 --import-realm"]