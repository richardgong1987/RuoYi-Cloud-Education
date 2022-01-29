#!/bin/sh


sh /home/nacos/bin/startup.sh -m standalone

nohup java -jar ./ruoyi-gateway/target/ruoyi-gateway.jar &

nohup java -jar ./ruoyi-auth/target/ruoyi-auth.jar &

nohup java -jar ./ruoyi-modules/system/target/ruoyi-modules-system.jar &

nohup java -jar ./ruoyi-modules/file/target/ruoyi-modules-file.jar &

nohup java -jar ./ruoyi-modules-eduction/education-admin/target/education-admin.jar &


