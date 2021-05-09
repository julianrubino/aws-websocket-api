### defaultWebSocket Lambda function
resource "aws_lambda_function" "default_route" {
  filename      = "payloads/defaultWebSocket.zip"
  function_name = "defaultWebSocket"
  role          = aws_iam_role.wss_lambda_role.arn
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.8"
}

### AWS Lambda permission to be invoked by API Gateway
resource "aws_lambda_permission" "default_lambda_permission" {
  statement_id  = "AllowDefaultRouteLambdaInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "defaultWebSocket"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.websocket_api.execution_arn}/*/$default"
}
