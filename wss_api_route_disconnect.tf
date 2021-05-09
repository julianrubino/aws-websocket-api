### $disconnect route
resource "aws_apigatewayv2_route" "websocket_api_disconnect_route" {
  api_id    = aws_apigatewayv2_api.websocket_api.id
  route_key = "$disconnect"
  route_response_selection_expression = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.websocket_api_disconnect_integration.id}"
}

### $disconnect route response
resource "aws_apigatewayv2_route_response" "websocket_api_disconnect_route_response" {
  api_id             = aws_apigatewayv2_api.websocket_api.id
  route_id           = aws_apigatewayv2_route.websocket_api_disconnect_route.id
  route_response_key = "$default"
}

### $disconnect route integration
resource "aws_apigatewayv2_integration" "websocket_api_disconnect_integration" {
  api_id                    = aws_apigatewayv2_api.websocket_api.id
  integration_type          = "AWS_PROXY"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "Lambda API integration for disconnectWebSocket function"
  integration_uri           = aws_lambda_function.disconnect_route.invoke_arn
}

### $disconnect route integration response
resource "aws_apigatewayv2_integration_response" "websocket_api_disconnect_integration_response" {
  api_id                   = aws_apigatewayv2_api.websocket_api.id
  integration_id           = aws_apigatewayv2_integration.websocket_api_disconnect_integration.id
  integration_response_key = "/200/"
}
