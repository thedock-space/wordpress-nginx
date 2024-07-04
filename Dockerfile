FROM bitnami/wordpress-nginx:latest
LABEL org.opencontainers.image.source https://github.com/thedock-space/wordpress-nginx
LABEL org.opencontainers.image.description "Custom wordpress 6.3.0 image with php 8.2, nginx, memcached"
USER 0
RUN install_packages nano wget
COPY ./updraftplus.zip /updraftplus.zip
COPY bitnami /opt/bitnami
COPY certs /certs
COPY ./default-https-server-block.conf /opt/bitnami/nginx/conf/server_blocks/default-https-server-block.conf
RUN mkdir /bitnami/wordpress-nginx && chown -R 1001:1001 /bitnami/wordpress-nginx && chown -R 1001:1001 /certs && chown -R 1001:1001 /opt/bitnami/php && chown -R 1001:1001 /opt/bitnami/nginx && chown 1001:1001 /opt/bitnami/wordpress/wp-content && chown 1001:1001 /opt/bitnami/wordpress/wp-config.php && chown 1001:1001 /usr/local/share/ca-certificates/ && chown 1001:1001 /etc/ssl/certs/ && rm -r -d -f /opt/bitnami/wordpress/wp-content/uploads/*
EXPOSE 8080 8443
USER 1001
RUN chmod 755 /opt/bitnami/wordpress/wp-content && chmod 770 /opt/bitnami/wordpress/wp-config.php
