FROM openjdk:15-jdk-alpine
EXPOSE 8080

RUN apk update && apk add maven
COPY . .
RUN mvn clean package

ENTRYPOINT java -jar ./target/calculadora-1.0.0.jar

