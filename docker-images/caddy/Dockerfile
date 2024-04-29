FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:f38b5158ba33159ee0b7c6f6d919f3f8599bd87231182abfdb35869973394af0 as builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare
    # src: https://github.com/caddy-dns/cloudflare

FROM docker.io/library/caddy:2.7.6-alpine@sha256:a6054d207060158cd0f019d6a35907bf47d1f8dacf58cdb63075a930d8ebca38
COPY --from=builder /usr/bin/caddy      /usr/bin/caddy

# Release
ARG DOCKER_DEPLOY_ENV
COPY ./Caddyfile.${DOCKER_DEPLOY_ENV}   /etc/caddy/Caddyfile