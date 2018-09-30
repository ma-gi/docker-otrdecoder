# Quick Start - Dockerized `otrdecoder` from onlinetvrecorder.com

A minimal Docker image for otrdecoder (onlinetvrecorder.com) based on Alpine Linux.
An easy to use container with less than 13 MB of size.

## Pull the container

```bash
docker pull mgilbert/otrdecoder
```

## Use it with mounted folder for otrkey files

```bash
# specify custom directory for otrkey files
docker run --rm --user="$(id -u):$(id -g)" -v /your/path/to/otrkeyfiles/:/mnt mgilbert/otrdecoder [-i FILE -e EMAIL -p PASSWORD]
 
# use current directory for otrkey files
docker run --rm --user="$(id -u):$(id -g)" -v "$(pwd)":/mnt mgilbert/otrdecoder [-i FILE -e EMAIL -p PASSWORD]
```

## If you like, take a look into the container

```bash
docker run --rm -it --entrypoint="sh" mgilbert/otrdecoder
```
