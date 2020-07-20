#!/bin/bash


DATE=$(date +%H-%M-%S)
DB_HOST=$1
DB_USER=$2
DB_USER_PASSWD=$3
SECRET_KEY=$4
BUCKET_NAME=$5

mysqldump -h $DB_HOST -u $DB_USER -p$DB_USER_PASSWD testdb > /tmp/dbbackup-$DATE.sql

export AWS_ACCESS_KEY_ID=AKIA4W5JRKZDW7FWSY4K
export AWS_SECRET_ACCESS_KEY=$SECRET_KEY

aws s3 cp /tmp/dbbackup-$DATE.sql s3://$BUCKET_NAME
