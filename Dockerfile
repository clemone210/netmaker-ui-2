FROM node:18-alpine3.17 as build

# LABELS
LABEL \
  org.opencontainers.image.authors="Netmaker Inc." \
  org.opencontainers.image.vendor="ReactJS" \
  org.opencontainers.image.url="local" \
  org.opencontainers.image.source="https://dockerhub.com/" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$REVISION" \
  vendor="ReactJS" \
  name="Netmaker UI" \
  version="$VERSION-$REVISION" \
  summary="The frontend of Netmaker. Netmaker builds fast, secure virtual networks." \
  description="This image contains the Netmaker frontend running with ReactJS."

WORKDIR /usr/app
COPY . /usr/app

# Switch for SaaS or Standalone build
ENV VITE_IS_SAAS_BUILD=true

# Essential vars

# Standalone build mandatory vars
# This value is used if `BACKEND_URL` env var is unset.
# BACKEND_URL is used for dynamic URL injection
ENV VITE_BASE_URL=https://api.clustercat.com

# EE customisations
ENV VITE_TENANT_LOGO=
ENV VITE_TENANT_NAME=

# Other vars
ENV VITE_NETCLIENT_BIN_URL_TEMPLATE=https://fileserver.netmaker.org/releases/download/:version/:fileName

RUN npm ci
RUN npm audit fix
RUN npm run build

# final image
FROM nginx:1.24.0-alpine3.17

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./generate-config.sh /
COPY ./docker-entrypoint.sh /

RUN chmod +x generate-config.sh docker-entrypoint.sh

COPY --from=build /usr/app/dist /usr/share/nginx/html

EXPOSE 80
ENTRYPOINT ["/docker-entrypoint.sh"]
