FROM registry.dev.sbiepay.sbi:8443/ubi9/nginx-126:9.6-1756959223

USER 0

# Create app folder + copy build output + set permissions
RUN mkdir -p /usr/share/nginx/html/home

COPY dist/ /usr/share/nginx/html/home/

RUN chmod -R 755 /usr/share/nginx/html/home && \
    chown -R nginx:nginx /usr/share/nginx/html/home

# DO NOT COPY nginx.conf (ConfigMap will inject it based on ENV)
# Correct dynamic NGINX setup — NO STATIC nginx.conf inside image

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
