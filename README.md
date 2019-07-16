# docker-openwrt

OpenWRT as a container

## Build

```bash
make build-amd64
```

## Run

```bash
docker run -d -p 8080:80 -p 8022:22 \
    --hostname OpenWrt \
    --name op \
    openwrt-amd64:18.06.4
```

Then you can access your openwrt via web (`http://localhost:8080`) or ssh (`ssh -p 8022 root@localhost`)

## Notice

- `HEALHCHECK` is used as a tool to kill `ip` process inside the container after the container has been in running state

## Thanks to

- [openwrt/docker](https://github.com/openwrt/docker)
