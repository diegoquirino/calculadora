FROM openjdk:16-alpine
EXPOSE 8080

RUN apk update && apk add maven
COPY . .
RUN mvn -N io.takari:maven:wrapper
RUN mvn install
RUN chmod +x ./mvnw

RUN ./mvnw spring-boot:start

