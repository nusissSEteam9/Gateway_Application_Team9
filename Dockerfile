# 使用JDK 17的基础镜像
FROM openjdk:17-jdk

# 安装Gradle 8.10.1
ENV GRADLE_VERSION 8.10.1
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp \
    && unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    && rm /tmp/gradle-${GRADLE_VERSION}-bin.zip

# 设置Gradle的环境变量
ENV GRADLE_HOME /opt/gradle-${GRADLE_VERSION}
ENV PATH $PATH:$GRADLE_HOME/bin

# 设置工作目录
WORKDIR /app

# 复制项目文件到容器
COPY . .

# 构建命令
ENTRYPOINT ["gradle", "clean", "build"]