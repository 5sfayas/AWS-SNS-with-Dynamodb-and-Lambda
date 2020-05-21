resource "aws_dynamodb_table" "dynamodb"{
	name="mywebsite"
	hash_key="email"
	
	attribute=[
	{
		name="email"
		type="s"
	}	
	]
	
	stream_enabled = "true"
	stream_view_type ="NEW_AND_OLD_IMAGES"
}