#pull base image	
FROM openjdk:8-jdk-alpine
WORKDIR /usr/src/app
COPY . ./
#expose port 8080	
EXPOSE 8080

#default command
#CMD java -jar /data/monitoring-rest-app-0.1.0.jar

#copy hello world to docker image
#ADD ./data/monitoring-rest-app-0.1.0.jar /data/monitoring-rest-app-0.1.0.jar
