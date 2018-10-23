#!/usr/bin/env bash
################################################################################
# Use this script to decode .otrkey files from www.onlinetvrecorder.com
#
# Read more at https://hub.docker.com/r/mgilbert/otrdecoder/
# (c) Marco Gilbert <marco.gilbert@gmail.com>
################################################################################
# You can use the file ~/.docker-otrdecoderrc to read your email and password
# from. The file must contain at least two lines.
#
# Example:
# EMAIL='email@example.com'
# PASSWORD='my#super!secret'

RCFILE="${HOME}"/.docker-otrdecoderrc

while getopts e:p: opt
do
    case $opt in
        e) EMAIL=$OPTARG;;
        p) PASSWORD=$OPTARG;;
    esac
done

# if no email and password is given, try to read from file
if [[ -z "${EMAIL}" && -z "${PASSWORD}" ]]; then
    [ -f "${RCFILE}" ] && source "${RCFILE}"
fi

# exit if no email is set
if [ ! "${EMAIL}" ]; then
	echo "No email given. Please specify it using the -e 'email@example.com' option or create an ${RCFILE} file."
	exit 1
fi

# exit if no password is set
if [ ! "${PASSWORD}" ]; then
    echo "No password given. Please specify it using the -p 'my#super!secret' option or create an ${RCFILE} file."
	exit 1
fi

# start decoding process using docker container mgilbert/otrdecoder from dockerhub
while [ "${#}" -ne 0 ]; do
    if [ -f "${1}" ] && [[ "${1}" == *otrkey ]]; then
        MOUNTDIR="$(dirname "$(readlink -f "${1}")")"
        FILENAME="$(basename "${1}")"
        docker container run --rm --user="$(id -u)":"$(id -g)" -v "${MOUNTDIR}":/mnt mgilbert/otrdecoder -i "${FILENAME}" -e "${EMAIL}" -p "${PASSWORD}"
    fi
    shift
done
