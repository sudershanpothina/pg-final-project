# docker run -p 8080:8080 -d -e MYSQL_DB=${MYSQL_DB} -e MYSQL_HOST=${MYSQL_HOST} \
# -e MYSQL_USER=${MYSQL_USERNAME} -e MYSQL_PASSWORD=${MYSQL_PASSWORD} frontend:1.0
FROM adoptopenjdk:11-jre-hotspot
EXPOSE 8080
ARG JAR_FILE=build/libs/front-end-0.0.1-SNAPSHOT.jar
ARG CONFIG_FILE=src/main/resources/application.properties
ADD ${JAR_FILE} app.jar
ADD ${CONFIG_FILE} application.properties
ENTRYPOINT ["java","-jar","/app.jar", "--spring.config.location=file:./application.properties"]