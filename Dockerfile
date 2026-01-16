FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

# Copy the built JAR from Jenkins workspace
COPY target/my-app-1.0-SNAPSHOT.jar app.jar

# App runs inside container on 8000
EXPOSE 8000

# Start the Java application
ENTRYPOINT ["java", "-jar", "app.jar"]

