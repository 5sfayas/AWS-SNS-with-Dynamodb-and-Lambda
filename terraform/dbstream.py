 import jason
 import boto3
 
 AWS = require("aws-sdk")
 sns = boto3.resource('sns')
 
 def lamda_handle(event, context):
     for record in event['Record']:
         if record['EventName'] == 'INSERT':
             newImgae = record['dynamodb'['NewImage']
             newEmail = NewImage['Email']['S']
             fname = NewImage['fname']['S']
             feedback = NewImage['feedback']['S']
             
             try:
                 sns.publish(
                     Subject: 'A new feedback from ' + fname,
                     Message: 'A new user ' + fname + 'left a feed which is '+ feedback + ':\n\n And his Email is ' + newEmail,
                     MessageStructure='json',
                     TopicArn: 'arn:aws:sns:$region:$accountID:$topicname'
                                         
                 )
             
             except Exception as e:
                 print (e)
     

