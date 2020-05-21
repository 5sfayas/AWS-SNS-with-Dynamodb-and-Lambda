#!/usr/bin/env bash

echo "Hi guys let's try to test our implent"
echo "plsease replace the  of dbstream file with your region, accountid, topicname TopicArn: 'arn:aws:sns:region:accountID:topicname'"
echo "in iam.tf, change the following line with your accountid at line 62"
echo "Resource": ":aws:logs:eu-west-1:accountid"
echo "Resource": ":aws:logs:eu-west-1:444444"

read -p "Enter table name: "  tablename
read -p "Enter your first name: "  fname
read -p "Enter Email ID: "  email
read -p "Enter your feed: "  feedback

aws dynamodb put-item \
    --table-name $tablename \
    --item email={S="$email"},fname={S="$fname"},feedback={S="$feedback"}
	
echo "I think succes fully added test your dn and email "