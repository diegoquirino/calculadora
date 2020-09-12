FROM openjdk:16-alpine
EXPOSE 8080

RUN apt-get update && apt-get install maven
COPY . .
RUN chmod +x mvnw
RUN mvnw spring-boot:run
