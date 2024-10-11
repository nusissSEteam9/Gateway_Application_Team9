# jre 17 的镜像
# docker build -t gateway/gatewaydocker .
FROM openjdk:21
MAINTAINER gatewaydocker
WORKDIR /Health-Recipe
# jvm启动参数
ENV APP_ARGS="-XX:+UseG1GC -Xms1024m -Xmx1024m -Xss256k -XX:MetaspaceSize=128m"
ADD app/Gateway_Application_Team9.jar /Health-Recipe/gateway.jar
# 镜像启动后运行的脚本
ENTRYPOINT ["java","-jar","/Health-Recipe/gateway.jar","${APP_ARGS}","--spring.profiles.active=dev","-c"]
