FROM openjdk:17

WORKDIR /app

COPY /target/*.war /app

CMD [ "java", "-jar", "*.war" ]