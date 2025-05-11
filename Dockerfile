FROM openjdk

WORKDIR /app

COPY target/*.war /app

CMD ["java", "-jar", "/app/*.war"]