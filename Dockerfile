FROM openjdk:16-jdk-alpine
EXPOSE 8080

RUN apk update && apk add maven
COPY . .
RUN mvn -N io.takari:maven:wrapper
RUN chmod +x ./mvnw

#Linha de Comando para a imagem, uma vez criada
#ENTRYPOINT ./mvnw clean spring-boot:run

