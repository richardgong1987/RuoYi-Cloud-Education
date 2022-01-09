#!/bin/bash

set -eu

cp -f ../../../ruoyi-auth/target/ruoyi-auth.jar ./app.jar

docker-compose build && docker-compose push
