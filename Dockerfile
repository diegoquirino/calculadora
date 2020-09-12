FROM openjdk:16
EXPOSE 8080

COPY . .
RUN mvnw spring-boot:run
