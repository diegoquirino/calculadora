FROM openjdk:16
EXPOSE 8080

RUN apt update -y && apt install -y maven
COPY . .
CMD mvnw spring-boot:run
