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


docker tag docker_ruoyi-auth richardgong1987/docker_ruoyi-auth

docker tag docker_ruoyi-auth richardgong1987/docker_ruoyi-auth

docker tag docker_ruoyi-gateway richardgong1987/docker_ruoyi-gateway

docker tag docker_ruoyi-modules-system richardgong1987/docker_ruoyi-modules-system

docker tag docker_ruoyi-modules-file richardgong1987/docker_ruoyi-modules-file

docker tag docker_ruoyi-modules-education-admin richardgong1987/docker_ruoyi-modules-education-admin


docker login --username=richardgong1987 --password-stdin  < ~/DockerPassword.txt


docker push  richardgong1987/docker_ruoyi-gateway
docker push  richardgong1987/docker_ruoyi-auth
docker push  richardgong1987/docker_ruoyi-modules-system
docker push  richardgong1987/docker_ruoyi-modules-file
docker push  richardgong1987/docker_ruoyi-modules-education-admin
