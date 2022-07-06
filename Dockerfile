FROM alpine

RUN apk add bind gettext
RUN adduser -S bind9
VOLUME /var/bind/pri

ADD scripts /scripts
RUN chmod +x /scripts/*
ADD config /config
RUN cp /config/named.conf /etc/bind/

CMD ["/usr/sbin/named", "-f", "-u", "bind9", "-4", "-c", "/config/named.conf"]