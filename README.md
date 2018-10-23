# Docker image for otrdecoder

[![](https://images.microbadger.com/badges/image/mgilbert/otrdecoder.svg)](https://microbadger.com/images/mgilbert/otrdecoder "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/mgilbert/otrdecoder.svg)](https://microbadger.com/images/mgilbert/otrdecoder "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/mgilbert/otrdecoder.svg)](https://microbadger.com/images/mgilbert/otrdecoder "Get your own commit badge on microbadger.com")

A minimal and easy to use Docker image for otrdecoder with less than 11 MB of size.

Please use it to decode video recordings you have made at [onlinetvrecorder.com](https://www.onlinetvrecorder.com/)


### Use it with mounted folder for otrkey files

```bash
# specify custom directory for otrkey files
docker container run --rm --user="$(id -u):$(id -g)" -v /your/path/to/otrkeyfiles/:/mnt mgilbert/otrdecoder [-i FILE -e EMAIL -p PASSWORD]
 
# use current directory for otrkey files
docker container run --rm --user="$(id -u):$(id -g)" -v "$(pwd)":/mnt mgilbert/otrdecoder [-i FILE -e EMAIL -p PASSWORD]
```

### Use it with my `otrdecoder-docker.sh` Bash Script

#### Install

First you have to install it for example in your personal `~/bin/` directory

```bash
wget -O ~/bin/otrdecoder-docker.sh https://raw.githubusercontent.com/ma-gi/docker-otrdecoder/master/otrdecoder-docker.sh
chmod a+x ~/bin/otrdecoder-docker.sh
```

#### Now start using it wherever you need it

call it providing your email an password as arguments

```bash
otrdecoder-docker.sh -e 'email@example.com' -p 'my#super!secret' *.otrkey
```

if your email and password settings are specified in your ~/.docker-otrdecoderrc file

```bash
otrdecoder-docker.sh *.otrkey
```

### If you like, take a look into the container

```bash
docker container run --rm -it --entrypoint="sh" mgilbert/otrdecoder
```
