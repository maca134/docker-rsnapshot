FROM ghcr.io/linuxserver/baseimage-alpine:3.14

# install packages
RUN \
    echo "**** install build packages ****" && \
    echo "**** install runtime packages ****" && \
    apk add --no-cache \
        openssh \
        rsnapshot \
        flock \
        rsync && \
    echo "**** cleanup ****" && \
    rm -rf \
        /root/.cache \
        /tmp/*

# add local files
COPY root/ /

VOLUME /config
VOLUME /snapshots
