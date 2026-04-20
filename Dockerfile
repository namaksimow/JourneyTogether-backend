FROM maven:3.9.14-eclipse-temurin-25 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn package -DskipTests -B

FROM eclipse-temurin:25.0.2_10-jre-jammy
WORKDIR /app
COPY --from=builder /app/target/*.jar backend-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-Xmx512M", "-jar", "backend-0.0.1-SNAPSHOT.jar"]