FROM alpine:3.8

LABEL maintainer="Marco Gilbert <marco.gilbert@gmail.com>"

# Install required tools an libraries
RUN apk add --no-cache ca-certificates && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk && \
    wget -q -O - https://www.onlinetvrecorder.com/downloads/otrdecoder-bin-64bit-linux-static-v519.tar.bz2 | tar -xjC /usr/local/bin/ otrdecoder-bin-64bit-linux-static-v519/otrdecoder --strip-components 1 && \
    apk add glibc-2.28-r0.apk && \
    rm glibc-2.28-r0.apk

# Set the working directory to /mnt
WORKDIR /mnt

ENTRYPOINT ["otrdecoder"]
CMD ["-h"]