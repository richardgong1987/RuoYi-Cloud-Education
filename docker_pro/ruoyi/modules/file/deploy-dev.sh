#!/bin/bash

set -eu

cp -f ../../../ruoyi-ruoyi-modules/ruoyi-file/target/ruoyi-modules-file.jar ./app.jar

docker-compose build && docker-compose push
