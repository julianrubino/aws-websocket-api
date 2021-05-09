### randomword Lambda function
resource "aws_lambda_function" "random_word_route" {
  filename      = "payloads/getRandomWord.zip"
  function_name = "getRandomWord"
  role          = aws_iam_role.wss_lambda_role.arn
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.8"
}

### AWS Lambda permission to be invoked by API Gateway
resource "aws_lambda_permission" "random_word_lambda_permission" {
  statement_id  = "AllowRandomWordRouteLambdaInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "getRandomWord"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.websocket_api.execution_arn}/*/randomword"
}
