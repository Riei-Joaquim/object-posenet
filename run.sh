#!/bin/sh

# Runs a docker container with the image created by build.sh
until nvidia-docker ps
do
    echo "Waiting for docker server"
    sleep 1
done

XSOCK=/tmp/.X11-unix

XAUTH=/root/.Xauthority

SRC_CONTAINER=/root/object-posenet
SRC_HOST="$(pwd)"

xhost local:root

nvidia-docker run \
    --name object-posenet \
    -it --rm \
    --ipc="host" \
    --volume=$XSOCK:$XSOCK:rw \
    --volume=$XAUTH:$XAUTH:rw \
    --volume=$SRC_HOST:$SRC_CONTAINER:rw \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --privileged -v /dev/bus/usb:/dev/bus/usb \
    --net=host \
    object-posenet
