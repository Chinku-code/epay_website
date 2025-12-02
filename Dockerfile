##FROM registry.dev.sbiepay.sbi:8443/ubi9/nginx-126:9.6-1755735243
FROM registry.dev.sbiepay.sbi:8443/ubi9/nginx-126:9.6-1756959223

USER 0

# Create app folder
RUN mkdir -p /usr/share/nginx/html/home

# Copy frontend build output
COPY ./dist/ /usr/share/nginx/html/home
RUN chmod 755 -R /usr/share/nginx/html/home
RUN chown -R nginx:nginx /usr/share/nginx/html/home

# DO NOT COPY nginx.conf (this will break multi-env)
# nginx.conf will be injected from Helm ConfigMap
# COPY ./nginx.conf /etc/nginx/nginx.conf   <-- REMOVE THIS LINE

EXPOSE 8080

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
