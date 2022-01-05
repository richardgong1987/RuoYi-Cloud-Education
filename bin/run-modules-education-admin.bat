@echo off
echo.
echo  'jar education-admin.jar'
echo.

cd %~dp0
cd ../ruoyi-modules-eduction/education-admin/target

set JAVA_OPTS=-Xms512m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m

java -Dfile.encoding=utf-8 %JAVA_OPTS% -jar education-admin.jar

cd bin
pause