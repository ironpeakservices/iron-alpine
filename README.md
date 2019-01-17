# hardened-alpine
Hardened alpine linux baseimage for Docker.

## Example
```
FROM hardened-alpine:latest
RUN apk add --no-cache nginx \
  && rm -rf /etc/nginx /var/cache/nginx /var/log/nginx

COPY nginx.conf $CONF_DIR/

RUN $APP_DIR/post-install.sh

CMD ["nginx", "-c", "$CONF_DIR/nginx.conf"]
