# create lambda 
# post
resource "aws_lambda_function" "lambda_dbstream"{
	function_name = "dbstream"
	filename = "./dbstream.zip/dbstream.py"
	role = "${aws_iam_role.lamda-iam.arn}"
	handler = "dbstream.handler"
	runtime = "python3.7"	
}
#Provides a Lambda event source mapping. This allows Lambda functions to get events from DynamoDB
resource "aws_lambda_event_source_mapping" "lamda-dynamodb" {
  event_source_arn  = "${aws_dynamodb_table.dynamodb.stream_arn}"
  function_name     = "${aws_lambda_function.lambda_dbstream.arn}"
  starting_position = "LATEST"
}