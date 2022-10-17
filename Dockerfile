FROM debian:bookworm-slim

ENV CODE="code"
ENV SERVER="smart"
ENV HEALTHCHECK=""
ENV BEARER=""
ENV NETWORK="on"
ENV PROTOCOL="lightway_udp"
ENV CIPHER="chacha20"

ARG NUM
ARG PLATFORM
ARG TARGETPLATFORM

COPY files/ /expressvpn/

RUN if [ "${TARGETPLATFORM}" = "linux/arm64" ]; \
  then dpkg --add-architecture armhf && \
  apt-get update && \
  apt-get install -y libc6:armhf libstdc++6:armhf && \
  cd /lib && \
  ln -s arm-linux-gnueabihf/ld-2.23.so ld-linux.so.3; fi

RUN apt-get update && apt-get install -y --no-install-recommends \
  expect curl ca-certificates iproute2 wget jq iptables \
  && wget -q https://www.expressvpn.works/clients/linux/expressvpn_${NUM}-1_${PLATFORM}.deb -O /expressvpn/expressvpn_${NUM}-1_${PLATFORM}.deb \
  && dpkg -i /expressvpn/expressvpn_${NUM}-1_${PLATFORM}.deb

HEALTHCHECK --start-period=30s --timeout=5s --interval=2m --retries=3 CMD bash /expressvpn/healthcheck.sh

ENTRYPOINT ["/bin/bash", "/expressvpn/start.sh"]
