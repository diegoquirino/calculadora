FROM openjdk:16-alpine
EXPOSE 8080

COPY . .
RUN chmod +x ./mvnw
RUN ./mvnw spring-boot:run
