FROM ubuntu:latest AS build
LABEL Name=icecreaminventory Version=0.0.1
RUN apt-get update 
RUN apt-get install  -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/* 
COPY . .
RUN ./mvnw bootJar --no-daemon

FROM openjdk:17-jdk-slim
EXPOSE 8080 
COPY --from=build /app/target/IceCreamInventory-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]


