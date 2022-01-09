#!/bin/bash

set -eu

# copy html
echo "begin copy html "
cp -r ../../ruoyi-ui/dist/** ./nginx/html/dist

docker-compose build && docker-compose push
