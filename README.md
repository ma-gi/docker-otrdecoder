# Dockerized `otrdecoder` from onlinetvrecorder.com

A minimal Docker image for `otrdecoder` (onlinetvrecorder.com) based on Alpine Linux.
An easy to use container with less than 11 MB of size.

[![](https://images.microbadger.com/badges/image/mgilbert/otrdecoder.svg)](https://microbadger.com/images/mgilbert/otrdecoder "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/mgilbert/otrdecoder.svg)](https://microbadger.com/images/mgilbert/otrdecoder "Get your own version badge on microbadger.com")

## Pull the container

```bash
docker pull mgilbert/otrdecoder
```

## Use it with mounted folder for otrkey files

```bash
# specify custom directory for otrkey files
docker container run --rm --user="$(id -u):$(id -g)" -v /your/path/to/otrkeyfiles/:/mnt mgilbert/otrdecoder [-i FILE -e EMAIL -p PASSWORD]
 
# use current directory for otrkey files
docker container run --rm --user="$(id -u):$(id -g)" -v "$(pwd)":/mnt mgilbert/otrdecoder [-i FILE -e EMAIL -p PASSWORD]
```

## Use it with my `docker-otrdecoder.sh` Bash Script

First you have to install it for example in your personal `~/bin/` directory

```bash
wget -O ~/bin/docker-otrdecoder.sh https://raw.githubusercontent.com/ma-gi/docker-otrdecoder/master/docker-otrdecoder.sh
chmod a+x ~/bin/docker-otrdecoder.sh
```

now start using it wherever you need it

```bash
# call it providing your email an password as arguments
docker-otrdecoder.sh -e 'email@example.com' -p 'my#super!secret' *.otrkey

# if your email and password settings are specified in your ~/.docker-otrdecoderrc file
docker-otrdecoder.sh *.otrkey
```


## If you like, take a look into the container

```bash
docker container run --rm -it --entrypoint="sh" mgilbert/otrdecoder
```
