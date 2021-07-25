FROM adoptopenjdk:11-jre-hotspot
EXPOSE 8080
ARG JAR_FILE=build/libs/front-end-0.0.1-SNAPSHOT.jar
ARG CONFIG_FILE=src/main/resources/application.properties
ADD ${JAR_FILE} app.jar
ADD ${CONFIG_FILE} application.properties
ENTRYPOINT ["java","-jar","/app.jar", "--spring.config.location=file:./application.properties"]