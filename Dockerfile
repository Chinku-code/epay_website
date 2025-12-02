##FROM registry.dev.sbiepay.sbi:8443/ubi9/nginx-126:9.6-1755735243
FROM registry.dev.sbiepay.sbi:8443/ubi9/nginx-126:9.6-1756959223
USER 0
#RUN mkdir -p /usr/share/nginx/html/transactiontracking
#COPY ./dist/ /usr/share/nginx/html/transactiontracking
#RUN ls -lrth /usr/share/nginx/html/transactiontracking
#RUN chmod 755 -R  /usr/share/nginx/html/transactiontracking
#RUN chown -R nginx:nginx /usr/share/nginx/html/transactiontracking

RUN mkdir -p /usr/share/nginx/html/home
COPY ./dist/ /usr/share/nginx/html/home
RUN ls -lrth /usr/share/nginx/html/home
RUN chmod 755 -R  /usr/share/nginx/html/home
RUN chown -R nginx:nginx /usr/share/nginx/html/home
COPY ./nginx.conf /etc/nginx/nginx.conf
RUN find /etc/nginx -type d | xargs chmod 750
RUN find /etc/nginx -type f | xargs chmod 640
EXPOSE 8080/tcp
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
