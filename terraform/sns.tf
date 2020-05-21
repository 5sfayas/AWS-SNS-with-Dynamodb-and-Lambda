resource "aws_sns_topic" "user_updates" {
  name = "user_topics"

}
#resource "aws_sns_topic_subscription" "user_topics_subscription" {
 # topic_arn = "${aws_sns_topic.user_tpoics.arn}"
  #protocol  = "email"
  #notification-endpoint fayas_akram@yahoo.co.uk
#}
#note: aws sends and confirmation email to you. click through and get the changes from sns
#but protocol-email is unsoppurted in terrafrom. the endpoint needs to be authorized
#and does not generate an ARN until the target email address has been validated.
#this breaks the Terraform model and as a result are not currently supported.
# I used awscli command to create subscription
# please run create-subscription.sh