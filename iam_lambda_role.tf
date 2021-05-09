locals {
  lambda_role_policy = templatefile("template_files/lambda_policy.json.tpl",
    {
      default_lambda_arn     = aws_lambda_function.default_route.arn
      connect_lambda_arn     = aws_lambda_function.connect_route.arn
      disconnect_lambda_arn     = aws_lambda_function.disconnect_route.arn
      random_word_lambda_arn = aws_lambda_function.random_word_route.arn
      wss_api_arn            = aws_apigatewayv2_api.websocket_api.arn
    }
  )
}

### IAM role for Lambda
resource "aws_iam_role" "wss_lambda_role" {
  name = "wss_lambda_role"

  assume_role_policy = <<POLICY
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
POLICY
}

### IAM policy for allowing the WebSocket API to invoke Lambda functions
resource "aws_iam_policy" "api_gtw_lambda_access" {
  name        = "AllowExecutionFromAPIGateway"
  description = "IAM policy for allow API Gateway to execute getRandomWord Lambda function."
  policy      = local.lambda_role_policy
}

### IAM policy attachment
resource "aws_iam_role_policy_attachment" "api_gtw_lambda_access_attachment" {
  role       = aws_iam_role.wss_lambda_role.name
  policy_arn = aws_iam_policy.api_gtw_lambda_access.arn
}

### IAM LambdaExecute policy attachment
resource "aws_iam_role_policy_attachment" "api_gtw_lambda_execute_attachment" {
  role       = aws_iam_role.wss_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"
}

### IAM DynamoDB policy attachment
resource "aws_iam_role_policy_attachment" "api_gtw_dynamo_db_attachment" {
  role       = aws_iam_role.wss_lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}