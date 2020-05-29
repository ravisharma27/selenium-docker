FROM openjdk:8u191-jre-alpine3.8
RUN apk add curl jq

# Workspace
WORKDIR /usr/share/udemy

# ADD .jar under target from host
# inside this image
ADD target/selenium-docker.jar          selenium-docker.jar
ADD target/selenium-docker-tests.jar    selenium-docker-tests.jar
ADD target/libs                         libs

# In case of any other dependencies like .csv/.json/.xlsx, please add that as well
# ADD suite files
ADD book-flight-module.xml              book-flight-module.xml
ADD search-module.xml                   search-module.xml

#ADD health check script
ADD healthcheck.sh                      healthcheck.sh

# BROWSER
# HUB_HOST
# MODULE
ENTRYPOINT bat healthcheck.sh