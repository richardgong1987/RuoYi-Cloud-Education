#!/bin/sh

echo 'Stopping all RuoYi running service...'
pids=( $(jps | grep RuoYi | awk '{print $1}') )

for pid in "${pids[@]}"; do
     echo "killing $pid"
     kill -9 $pid
done

sh /home/nacos/bin/startup.sh -m standalone

nohup java -jar ./ruoyi-gateway/target/ruoyi-gateway.jar &

nohup java -jar ./ruoyi-auth/target/ruoyi-auth.jar &

nohup java -jar ./ruoyi-modules/ruoyi-system/target/ruoyi-modules-system.jar &

nohup java -jar ./ruoyi-modules/ruoyi-file/target/ruoyi-modules-file.jar &

nohup java -jar ./ruoyi-modules-eduction/education-admin/target/education-admin.jar &


