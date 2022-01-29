#!/bin/bash

set -eu

cp -f ../../../../ruoyi-modules-eduction/education-admin/target/education-admin.jar ./app.jar

docker-compose build && docker-compose push
