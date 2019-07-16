build-amd64:
	docker build -t openwrt-amd64:base -f amd64.dockerfile .
	docker build --build-arg ARCH=amd64 \
	-t openwrt-amd64:latest -t openwrt-amd64:18.06.4 .

build-arm32:
	docker build -t openwrt-arm32:base -f arm32.dockerfile .
	docker build --build-arg ARCH=arm32 \
	-t openwrt-arm32:latest -t openwrt-arm32:18.06.4 .

build-arm64:
	docker build -t openwrt-arm64:base -f arm64.dockerfile .
	docker build --build-arg ARCH=arm64 \
	-t openwrt-arm64:latest -t openwrt-arm64:18.06.4 .
