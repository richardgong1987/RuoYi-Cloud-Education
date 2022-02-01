#!/bin/bash

set -eu

# copy html
echo "begin copy html "

cp -fr ../../ruoyi-ui/dist/** ./html/dist

docker-compose build && docker-compose push
#docker-compose build
