FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/devOpsTargil.jar
COPY ${JAR_FILE} devOpsTargil.jar
ENTRYPOINT ["java","-jar","/devOpsTargil.jar"]
