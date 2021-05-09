### connectWebSocket Lambda function
resource "aws_lambda_function" "connect_route" {
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  function_name = var.connect_function_name
  role          = aws_iam_role.wss_lambda_role.arn
  filename      = "payloads/${var.connect_function_name}.zip"
}

### AWS Lambda permission to be invoked by API Gateway
resource "aws_lambda_permission" "connect_lambda_permission" {
  action        = var.lambda_invoke_permission
  principal     = var.api_gateway_dns
  function_name = var.connect_function_name
  source_arn    = "${aws_apigatewayv2_api.websocket_api.execution_arn}/*/$connect"
  statement_id  = "AllowConnectRouteLambdaInvoke"
}
