FROM alpine:edge
MAINTAINER Nicolas Lorin <androw95220@gmail.com>

RUN mkdir -p /usr/local/etc/unbound/
RUN apk add --update --no-cache unbound=1.18.0-r0 curl ca-certificates && curl -o /usr/local/etc/unbound/root.hints https://www.internic.net/domain/named.cache
RUN unbound-anchor -4 -a /usr/local/etc/unbound/root.key ; true
RUN chown -R unbound:unbound /usr/local/etc/unbound/

EXPOSE 53
EXPOSE 53/udp

CMD ["/usr/sbin/unbound", "-d", "-v"]
