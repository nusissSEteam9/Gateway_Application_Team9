#!/bin/bash
# 打jar包
./gradlew buildGatewayJar
# 构建docker镜像
docker build -t gatewaydocker .
# 运行镜像
# docker run --name=gatewaydocker -d -p 8080:8080 gatewaydocker
