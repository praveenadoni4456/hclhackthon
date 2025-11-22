FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY pom.xml /app
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests
FROM openjdk:17-jdk-slim AS runtime
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
RUN useradd nonroot && chown nonroot:nonroot /app
USER nonroot
EXPOSE 8080
CMD ["java", "-jar", "order-service-0.0.1-SNAPSHOT.jar"]
