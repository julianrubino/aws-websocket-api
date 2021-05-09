### disconnectWebSocket Lambda function
resource "aws_lambda_function" "disconnect_route" {
  filename      = "payloads/disconnectWebSocket.zip"
  function_name = "disconnectWebSocket"
  role          = aws_iam_role.wss_lambda_role.arn
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.8"
}

### AWS Lambda permission to be invoked by API Gateway
resource "aws_lambda_permission" "disconnect_lambda_permission" {
  statement_id  = "AllowDisconnectRouteLambdaInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "disconnectWebSocket"
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.websocket_api.execution_arn}/*/$disconnect"
}
