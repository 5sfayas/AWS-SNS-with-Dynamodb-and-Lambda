#create a role for lamda access aws resouces
#read dynamodb stream data
#write logs to cloud watch
#send sns topic

resouce "aws_iam_role" "lamda-iam"{
	#role name
	name="lamda-dynamodb"
	
	#assume role to a services
	assume_role_policy =<<EOF
	{
		"Version": "2012-10-17",
		"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
			"Service": "lambda.amazonaws.com"
		},
		"Effect": "Allow",
		"Sid": ""
    }
		]
	}
EOF
}
# create policy for role to assume dynamodb
#read dynamodb stream data
#write logs to cloud watch
#send sns topic
#invoke lamda function lambda_test
resource "aws_iam_role_policy" "dynamodb-lambda-policy"{
	name = "dynamodb_lambda_policy"
	role = "${aws_iam_role.lamda-iam.id}"

	policy = <<EOF
	{
		"Version": "2012-10-17",
		"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"dynamodb:DescribeStream",
                "dynamodb:GetRecords",
                "dynamodb:GetShardIterator",
                "dynamodb:ListStreams"
			],
			"Resource": "${aws_dynamodb_table.dynamodb.arn}"
		},
		{
            "Effect": "Allow",
            "Action": "lambda:InvokeFunction",
            "Resource": "${aws_lamda_function.lambda_test.arn}"
        },
		{
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": ":aws:logs:eu-west-1:444-444444:*"
        },
		{
            "Effect": "Allow",
            "Action": [
                "sns:Publish"
            ],
            "Resource": [
                "*"
            ]
        }
		
		]
	}
	EOF
}
