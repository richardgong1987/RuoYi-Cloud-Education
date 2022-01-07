#!/bin/sh

# 使用说明，用来提示输入参数
usage() {
	echo "Usage: sh 执行脚本.sh [port|base|stop]"
	exit 1
}

# 开启所需端口
port(){
	firewall-cmd --add-port=80/tcp --permanent
	firewall-cmd --add-port=8086/tcp --permanent
	firewall-cmd --add-port=8848/tcp --permanent
	firewall-cmd --add-port=9848/tcp --permanent
	firewall-cmd --add-port=9849/tcp --permanent
	firewall-cmd --add-port=6379/tcp --permanent
	firewall-cmd --add-port=3306/tcp --permanent
	firewall-cmd --add-port=9200/tcp --permanent
	firewall-cmd --add-port=9201/tcp --permanent
	firewall-cmd --add-port=9202/tcp --permanent
	firewall-cmd --add-port=9203/tcp --permanent
	firewall-cmd --add-port=9204/tcp --permanent
	firewall-cmd --add-port=9205/tcp --permanent
	firewall-cmd --add-port=9206/tcp --permanent
	firewall-cmd --add-port=9207/tcp --permanent
	service firewalld restart
}


# 启动程序模块（必须）
base(){

	java -jar ./ruoyi/gateway/jar/ruoyi-gateway.jar
	java -jar ./ruoyi/auth/jar/ruoyi-auth.jar
	java -jar ./modules/system/jar/ruoyi-modules-system.jar
	java -jar ./modules/file/jar/ruoyi-modules-file.jar

	java -jar ./modules/file/jar/ruoyi-modules-file.jar

	java -jar ./modules-education/education-admin/jar/education-admin.jar

}

# 关闭所有环境/模块
stop(){
	sh stop-allRuoYiApp.sh
}



# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"port")
	port
;;
"base")
	base
;;
"modules")
	modules
;;
"stop")
	stop
;;
"rm")
	rm
;;
*)
	usage
;;
esac
