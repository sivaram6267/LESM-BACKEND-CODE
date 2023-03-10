FROM maven as build
WORKDIR /app
COPY . .
RUN mvn clean install -Dmaven.test.skip=true 
#jdk
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/LESM-Status-Monitor-0.0.1-SNAPSHOT.jar /app
CMD ["java", "-jar", "LESM-Status-Monitor-0.0.1-SNAPSHOT.jar"]
