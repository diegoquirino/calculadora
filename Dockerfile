FROM openjdk:16-jdk-alpine
EXPOSE 8080

RUN apk update && apk add maven
COPY . .
RUN mvn -N io.takari:maven:wrapper
# RUN mvn clean install
RUN chmod +x ./mvnw

CMD ./mvnw spring-boot:run

