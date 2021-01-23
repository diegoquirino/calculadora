FROM openjdk:16-jdk-alpine
EXPOSE 8080

RUN apk update && apk add maven
COPY . .
RUN mvn -N io.takari:maven:wrapper
RUN chmod +x ./mvnw

#ENTRYPOINT ./mvnw clean spring-boot:run

