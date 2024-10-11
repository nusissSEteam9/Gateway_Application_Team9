# 使用 openjdk:17-jdk 作为基础镜像
FROM openjdk:17-jdk

# 安装 wget 和 unzip
RUN apt-get update && apt-get install -y wget unzip

# 设置 Gradle 版本
ENV GRADLE_VERSION 8.10.1

# 下载并安装 Gradle
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /tmp \
    && unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /opt \
    && rm /tmp/gradle-${GRADLE_VERSION}-bin.zip

# 设置 Gradle 环境变量
ENV GRADLE_HOME /opt/gradle-${GRADLE_VERSION}
ENV PATH $GRADLE_HOME/bin:$PATH

# 工作目录
WORKDIR /app

# 复制当前目录到容器中
COPY . .

# 构建项目
RUN gradle clean build