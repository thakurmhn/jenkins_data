#!/bin/bash
## Retrive Crumb Issuer token
#crumb_token=$(curl -u builder:1234 -s 'http://jenkins:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
crumb_token=$(curl --silent --cookie-jar /tmp/cookies http://jenkins:8080'/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)' -u builder:1234)
echo $crumb_token

curl -u builder:1234 -H "$crumb_token" -X POST http://jenkins.mhn.com:8080/job/Print_jenkins_global_vars/build?delay=0sec


# Call JSON API

#curl http://jenkins:8080/crumbIssuer/api/json -u builder:1234
