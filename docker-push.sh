mvn clean package

cd ruoyi-ui

yarn build:prod


cd ../docker_pro/ruoyi/auth

sh deploy-dev.sh


cd ../gateway

sh deploy-dev.sh


cd ../modules/file

sh deploy-dev.sh

cd ../system

sh deploy-dev.sh

cd ../../modules-education/education-admin

sh deploy-dev.sh

cd ../../../nginx

sh deploy-dev.sh

version=v2022_01_31_15_44

docker tag richardgong1987/docker_ruoyi-nginx richardgong1987/docker_ruoyi-nginx:$version

docker tag richardgong1987/docker_ruoyi-auth richardgong1987/docker_ruoyi-auth:$version

docker tag richardgong1987/docker_ruoyi-gateway richardgong1987/docker_ruoyi-gateway:$version

docker tag richardgong1987/docker_ruoyi-modules-system richardgong1987/docker_ruoyi-modules-system:$version

docker tag richardgong1987/docker_ruoyi-modules-file richardgong1987/docker_ruoyi-modules-file:$version

docker tag richardgong1987/docker_ruoyi-modules-education-admin richardgong1987/docker_ruoyi-modules-education-admin:$version


docker login --username=richardgong1987 --password-stdin  < ~/DockerPassword.txt


docker push  richardgong1987/docker_ruoyi-nginx:$version
docker push  richardgong1987/docker_ruoyi-gateway:$version
docker push  richardgong1987/docker_ruoyi-auth:$version
docker push  richardgong1987/docker_ruoyi-modules-system:$version
docker push  richardgong1987/docker_ruoyi-modules-file:$version
docker push  richardgong1987/docker_ruoyi-modules-education-admin:$version
