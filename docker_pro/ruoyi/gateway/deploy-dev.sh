#!/bin/bash

set -eu

cp -f ../../../ruoyi-gateway/target/ruoyi-gateway.jar ./app.jar

#docker-compose build && docker-compose push
docker-compose build
