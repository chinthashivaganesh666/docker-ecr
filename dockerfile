FROM tomcat:9.0-jdk17-temurin

COPY target/TrainBook-1.0.0-SNAPSHOT.war /usr/local/tomcat/webapps/TrainBook.war

EXPOSE 8080
