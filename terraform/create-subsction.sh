#!/usr/bin/env bash
read -p "Enter sns topic name: "  topicname
read -p "Enter sns region: "  region
read -p "Enter sns accountID: "  accountID
read -p "Enter sns email address to subscribe: "  email
aws sns create-topic --name $topicname

aws sns subscribe \
    --topic-arn arn:aws:sns:$region:$accountID:$topicname \
    --protocol email \
    --notification-endpoint $email
