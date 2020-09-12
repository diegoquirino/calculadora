FROM openjdk:16-alpine
EXPOSE 8080

COPY . .
WORKDIR .
CMD ["mvnw","spring-boot:run"]
