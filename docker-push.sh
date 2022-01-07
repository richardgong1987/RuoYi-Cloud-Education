mvn clean package

cd docker

sh copy.sh

docker-compose build --no-cache

docker tag docker_ruoyi-redis richardgong1987/docker_ruoyi-redis
docker tag docker_ruoyi-minio richardgong1987/docker_ruoyi-minio
docker tag docker_ruoyi-nginx richardgong1987/docker_ruoyi-nginx
docker tag docker_ruoyi-elasticsearch richardgong1987/docker_ruoyi-elasticsearch

docker tag docker_ruoyi-gateway richardgong1987/docker_ruoyi-gateway
docker tag docker_ruoyi-auth richardgong1987/docker_ruoyi-auth
docker tag docker_ruoyi-modules-system richardgong1987/docker_ruoyi-modules-system
docker tag docker_ruoyi-modules-file richardgong1987/docker_ruoyi-modules-file
docker tag docker_ruoyi-modules-education-admin richardgong1987/docker_ruoyi-modules-education-admin

docker login --username=richardgong1987 --password-stdin  < ~/DockerPassword.txt

docker push  richardgong1987/docker_ruoyi-nginx
docker push  richardgong1987/docker_ruoyi-redis
docker push  richardgong1987/docker_ruoyi-minio
docker push  richardgong1987/docker_ruoyi-elasticsearch

docker push  richardgong1987/docker_ruoyi-gateway
docker push  richardgong1987/docker_ruoyi-auth
docker push  richardgong1987/docker_ruoyi-modules-system
docker push  richardgong1987/docker_ruoyi-modules-file
docker push  richardgong1987/docker_ruoyi-modules-education-admin
