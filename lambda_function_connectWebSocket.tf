### connectWebSocket Lambda function
resource "aws_lambda_function" "connect_route" {
  filename      = "payloads/connectWebSocket.zip"
  function_name = "connectWebSocket"
  role          = aws_iam_role.wss_lambda_role.arn
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.8"
}

### AWS Lambda permission to be invoked by API Gateway
resource "aws_lambda_permission" "connect_lambda_permission" {
  statement_id  = "AllowConnectRouteLambdaInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "connectWebSocket"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.websocket_api.execution_arn}/*/$connect"
}
