FROM maven:3.6.1-jdk-8
WORKDIR /app
COPY . /app
RUN mvn -f /app/pom.xml clean package
FROM openjdk:8u171-jre-alpine

WORKDIR /tmp
COPY --from=0 /app/target/*.jar /tmp
#EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/tmp/petclinic.jar"]



#CMD ["java", "-jar", "/tmp/petclinic.jar", "-Dspring.profiles.active=osenv"]
