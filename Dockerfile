FROM openjdk
#FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY target/*.war .

CMD ["java", "-jar", "*.war"]
