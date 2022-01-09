mvn clean package

cd docker_pro/ruoyi/auth

sh deploy-dev.sh



cd ../gateway

sh deploy-dev.sh

cd ../modules/file

sh deploy-dev.sh

cd ../modules/system

sh deploy-dev.sh

cd ../../modules-education/education-admin

sh deploy-dev.sh





#docker tag docker_ruoyi-nginx richardgong1987/docker_ruoyi-nginx

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
