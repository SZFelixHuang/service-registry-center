FROM docker-registry.missionsky.com:5000/devops/centos8-openjdk:11
COPY ./target/service-center-1.0.jar /service-center-1.0.jar
ENTRYPOINT ["java", "-jar","/service-registry-center-1.0.jar"]