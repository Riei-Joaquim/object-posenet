#!/bin/sh

cd /root/object-posenet/lib/ransac_voting
python3 setup.py install --user

cd /root/object-posenet/lib/knn
python3 setup.py install --user

cd /root/object-posenet