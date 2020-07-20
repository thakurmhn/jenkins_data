#!/bin/bash

export JENKINS_URL=http://jenkins:8080
export JENKINS_USER=admin
export JENKINS_TOKEN=Letme1in
export COOKIE_JAR=/tmp/cookies

## Retrive Crumb Issuer token
JENKINS_CRUMB=$(curl --silent --cookie-jar $COOKIE_JAR $JENKINS_URL'/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)' -u $JENKINS_USER:$JENKINS_TOKEN)
echo $JENKINS_CRUMB

curl -I --cookie-jar $COOKIE_JAR -u builder:1234 -H "$crumb_token" -X POST http://jenkins.mhn.com:8080/job/Print_jenkins_global_vars/build?delay=0sec -v


# Call JSON API

#curl http://jenkins:8080/crumbIssuer/api/json -u builder:1234
