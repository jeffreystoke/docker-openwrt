FROM alpine:3.9 as downloader

RUN wget --quiet -O /qemu-arm-static \
    https://github.com/multiarch/qemu-user-static/releases/download/v4.0.0/qemu-arm-static ;\
    chmod +x /qemu-arm-static

FROM scratch
ADD rootfs/openwrt-18.06.4-armvirt-32-default-rootfs.tar.gz /

COPY --from=downloader /qemu-arm-static /usr/bin/qemu-arm-static
