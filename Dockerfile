# 使用JDK 21的基础镜像
FROM eclipse-temurin:21-jdk

# 设置工作目录为/app
WORKDIR /app

# 将构建好的JAR文件复制到容器中
COPY build/libs/Gateway_Application_Team9-0.0.1-SNAPSHOT.jar /app/app.jar

# 暴露8080端口（Spring Boot默认端口）
EXPOSE 8081

# 运行JAR文件
ENTRYPOINT ["java", "-jar", "/app/app.jar"]