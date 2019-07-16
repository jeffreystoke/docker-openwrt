FROM alpine:3.9 as downloader

RUN wget --quiet -O /qemu-aarch64-static \
    https://github.com/multiarch/qemu-user-static/releases/download/v4.0.0/qemu-aarch64-static ;\
    chmod +x /qemu-aarch64-static

FROM scratch
ADD rootfs/openwrt-18.06.4-armvirt-64-default-rootfs.tar.gz /

COPY --from=downloader /qemu-aarch64-static /usr/bin/qemu-aarch64-static
