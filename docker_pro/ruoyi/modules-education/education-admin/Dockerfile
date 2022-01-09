FROM openjdk:17-jdk-slim
COPY app.jar /app.jar
WORKDIR /
EXPOSE 9500
ENTRYPOINT ["java","-jar","app.jar"]