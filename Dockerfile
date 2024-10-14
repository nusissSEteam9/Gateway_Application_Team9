# 使用支持多架构的基础镜像
FROM ubuntu:latest

# 更新并安装必要的工具
RUN apt-get update && apt-get install -y findutils

# 设置工作目录
WORKDIR /app

# 复制项目的所有文件到容器中
COPY . .

# 授予 gradlew 脚本执行权限
RUN chmod +x ./gradlew

# 使用 Gradle Wrapper 构建项目
RUN ./gradlew clean build --info --stacktrace

# 暴露 8080 端口
EXPOSE 8080

# 运行应用程序
CMD ["java", "-jar", "build/libs/Gateway_Application_Team9-0.0.1-SNAPSHOT.jar"]