FROM bcit.io/alpine:3.17

LABEL maintainer="jesse@weisner.ca, chriswood.ca@gmail.com"
LABEL build_id="1678491857"

ENV HOME /certs
ENV CAROOT ""
ENV CERTFILE ""
ENV KEYFILE ""
ENV CACERTFILE ""

ENTRYPOINT ["/tini", "--", "/docker-entrypoint.sh"]

ADD https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 /mkcert
ADD mkcert.sh /docker-entrypoint.d/mkcert.sh

RUN \
    chmod 755 /mkcert \
 && mkdir /certs \
 && chmod 1777 /certs

WORKDIR /certs
