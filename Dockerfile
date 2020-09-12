FROM openjdk:16-oraclelinux8
EXPOSE 8080

# RUN apt-get update && apt-get install -y maven
COPY . .
CMD  mvnw spring-boot:run
