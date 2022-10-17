echo "### [BULDING ARMV8 $1 VERSION - HUB.DOCKER.COM] ###"
docker buildx build --build-arg NUM=$1 --build-arg PLATFORM=armhf --platform linux/arm/v8 -t $2/expressvpn:$1-arm64 --push .
echo "### [BULDING ARMV8 LATEST VERSION - HUB.DOCKER.COM] ###"
docker buildx build --build-arg NUM=$1 --build-arg PLATFORM=armhf --platform linux/arm/v8 -t $2/expressvpn:latest-arm64 --push .
echo "### [BULDING ARMHF $1 VERSION - HUB.DOCKER.COM] ###"
docker buildx build --build-arg NUM=$1 --build-arg PLATFORM=armhf --platform linux/arm/v7 -t $2/expressvpn:$1-armhf --push .
echo "### [BULDING ARMHF LATEST VERSION - HUB.DOCKER.COM] ###"
docker buildx build --build-arg NUM=$1 --build-arg PLATFORM=armhf --platform linux/arm/v7 -t $2/expressvpn:latest-armhf --push .
echo "### [BULDING AMD64 $1 VERSION - HUB.DOCKER.COM] ###"
docker buildx build --build-arg NUM=$1 --build-arg PLATFORM=amd64 --platform linux/amd64 -t $2/expressvpn:$1 --push .
echo "### [BULDING AMD64 LATEST VERSION - HUB.DOCKER.COM] ###"
docker buildx build --build-arg NUM=$1 --build-arg PLATFORM=amd64 --platform linux/amd64 -t $2/expressvpn:latest --push .
echo "### [CLEANING UP] ###"
docker system prune -a -f --volumes
