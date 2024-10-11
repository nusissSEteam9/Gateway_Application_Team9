# 使用 Gradle 的基础镜像带有 JDK 支持
FROM openjdk:17-jdk

# 设置工作目录
WORKDIR /app

# 复制项目的所有文件到容器中
COPY . .

# 授予 gradlew 脚本执行权限
RUN chmod +x ./gradlew

# 使用 Gradle Wrapper 构建项目
RUN ./gradlew clean build

EXPOSE 8080

# 运行应用程序
CMD ["java", "-jar", "build/libs/Gateway_Application_Team9-0.0.1-SNAPSHOT.jar"]