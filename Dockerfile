FROM openjdk:16-alpine
EXPOSE 8080

COPY . .
RUN ./mvnw spring-boot:run
