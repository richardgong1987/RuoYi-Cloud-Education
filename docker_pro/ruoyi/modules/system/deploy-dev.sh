#!/bin/bash

set -eu

cp -f ../../../../ruoyi-modules/ruoyi-system/target/ruoyi-modules-system.jar ./app.jar


#docker-compose build && docker-compose push
docker-compose build
