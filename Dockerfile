FROM openjdk:latest

WORKDIR /app

COPY /target/*.war /app

CMD [ "java", "-jar", "*.war" ]