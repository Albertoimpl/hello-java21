FROM openjdk:21

COPY ./build/libs/hello-java21-0.0.1-SNAPSHOT.jar /opt/hello-java21/
WORKDIR /opt/hello-java21/
ENTRYPOINT ["java", "-jar", "/opt/hello-java21/hello-java21-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
