FROM adoptopenjdk/openjdk11:jdk-11.0.12_7-alpine AS build
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

FROM adoptopenjdk/openjdk11:jre-11.0.12_7-alpine
WORKDIR /app
COPY --from=build /app/target/java-spring-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app/app.jar"]
