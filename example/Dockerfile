FROM ironpeakservices/hardened-alpine
RUN apk add --no-cache nginx \
  && rm -rf /etc/nginx /var/cache/nginx /var/log/nginx

COPY nginx.conf $CONF_DIR/

RUN $APP_DIR/post-install.sh

EXPOSE 8080 8443
USER $APP_USER
CMD ["nginx", "-c", "/app/conf/nginx.conf", "-g", "pid /app/tmp/nginx.pid; error_log /dev/stderr;", "-p", "/app"]
