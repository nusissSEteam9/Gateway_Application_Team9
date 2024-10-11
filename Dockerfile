FROM gradle:8.10.1-jdk17

WORKDIR /app

COPY . .

RUN gradle clean build