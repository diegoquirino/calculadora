FROM openjdk:16-alpine
EXPOSE 8080

RUN apt update -y && apt install -y maven
COPY . .
RUN mvnw spring-boot:run
