FROM alpine:3.8

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Marco Gilbert <marco.gilbert@gmail.com>" \
    org.label-schema.build-date="${BUILD_DATE}" \
    org.label-schema.name="Docker image for otrdecoder" \
    org.label-schema.description="A minimal and easy to use Docker image for otrdecoder with less than 11 MB of size." \
    org.label-schema.vcs-url="https://github.com/ma-gi/docker-otrdecoder" \
    org.label-schema.vcs-ref="${VCS_REF}" \
    org.label-schema.schema-version="1.0"

# Install required tools and libraries
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk \
    && wget -q -O - https://www.onlinetvrecorder.com/downloads/otrdecoder-bin-64bit-linux-static-v519.tar.bz2 | tar -xjC /usr/local/bin/ otrdecoder-bin-64bit-linux-static-v519/otrdecoder --strip-components 1 \
    && apk --no-cache add ca-certificates glibc-2.28-r0.apk \
    && rm glibc-2.28-r0.apk

# Set the working directory to /mnt
WORKDIR /mnt
VOLUME /mnt

ENTRYPOINT ["otrdecoder"]
CMD ["-v"]
