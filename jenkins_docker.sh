#!/bin/bash
######################################
# Script that will install a Jenkins server in a docker container
######################################

docker ps > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
  echo "Docker is not running. Please start the daemon"
  exit 1
fi


echo "Creating jenkins network"
docker network create jenkins

echo "Create jenkins-data volume"
docker volume create jenkins-data

echo "Running the jenkins-docker container"
docker run -it --network="jenkins" --network-alias="myjenkins" \
  --name jenkins-docker --detach \
  --volume jenkins-data:/var/jenkins_home \
  --restart=on-failure \
  --publish 8080:8080 \
  --publish 50000:50000 \
  jenkins/jenkins:jdk11
