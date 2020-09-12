FROM openjdk:16-alpine
EXPOSE 8080

RUN apt upgrade && apt install -y maven
COPY . .
RUN chmod +x ./mvnw
RUN ./mvnw spring-boot:run
