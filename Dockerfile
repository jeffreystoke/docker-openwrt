ARG ARCH=amd64

FROM openwrt-${ARCH}:base
ARG ARCH=amd64

# use mirror
ADD config/mirrorfeeds-${ARCH}.conf /etc/opkg/distfeeds.conf
RUN mkdir /var/lock && \
    opkg update && \
    opkg install uhttpd libjson-c uhttpd-mod-lua && \
    uci set uhttpd.main.interpreter='.lua=/usr/bin/lua' && \
    uci commit uhttpd

ADD config/inittab /etc/inittab
ADD config/network /etc/config/network
ADD healthcheck.sh /healthcheck.sh
RUN chmod +x /healthcheck.sh

HEALTHCHECK --interval=5s \
            --timeout=3s \
            --start-period=3s \
            --retries=1 CMD "/healthcheck.sh"

EXPOSE 80 22

ENTRYPOINT [ "/sbin/init" ]
