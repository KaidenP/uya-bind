FROM alpine

RUN apk add bind gettext
VOLUME /var/bind/pri

ADD scripts /scripts
RUN chmod +x /scripts/*
ADD config /config
RUN cp /config/named.conf /etc/bind/

CMD ["/usr/sbin/named", "-f", "-u", "named", "-4", "-c", "/config/named.conf", "-g"]