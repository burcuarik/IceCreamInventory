FROM ubuntu:latest AS build
LABEL Name=icecreaminventory Version=0.0.1
RUN apt-get update 
RUN apt-get install openjdk-20-jdk -y
COPY . .
RUN ./mvnw bootJar --no-daemon

FROM openjdk:17-jdk
EXPOSE 8080 
COPY --from=build /app/target/IceCreamInventory-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]


