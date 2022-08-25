#!/bin/bash

# Evitar erro com o uso de video
xhost +local:docker

#docker build --no-cache -t hri -f Dockerfile .
docker build -t object-posenet -f Dockerfile .
