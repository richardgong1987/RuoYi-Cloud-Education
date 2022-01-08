#!/bin/sh


sh /home/nacos/bin/startup.sh -m standalone

docker run -d -p 9000:9000 -p 9001:9001 --restart=always -e "MINIO_ROOT_USER=admin" -e "MINIO_ROOT_PASSWORD=password" -v /home/minio_data:/data quay.io/minio/minio server /data --console-address ":9001"

docker run -d -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" --restart=always docker.elastic.co/elasticsearch/elasticsearch:7.16.2

nohup java -jar ./ruoyi-gateway/target/ruoyi-gateway.jar &

nohup java -jar ./ruoyi-auth/target/ruoyi-auth.jar &

nohup java -jar ./ruoyi-modules/system/target/ruoyi-modules-system.jar &

nohup java -jar ./ruoyi-modules/file/target/ruoyi-modules-file.jar &

nohup java -jar ./ruoyi-modules-eduction/education-admin/target/education-admin.jar &


