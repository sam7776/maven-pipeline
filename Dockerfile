FROM openjdk:latest-jdk-slim

WORKDIR /app

COPY target/*.war /app

CMD ["java", "-jar", "/app/*.war"]