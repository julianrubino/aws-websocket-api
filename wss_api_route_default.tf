### $default route
resource "aws_apigatewayv2_route" "websocket_api_default_route" {
  api_id    = aws_apigatewayv2_api.websocket_api.id
  route_key = "$default"
  route_response_selection_expression = "$default"
  target    = "integrations/${aws_apigatewayv2_integration.websocket_api_default_integration.id}"
}

### $default route response
resource "aws_apigatewayv2_route_response" "websocket_api_default_route_response" {
  api_id             = aws_apigatewayv2_api.websocket_api.id
  route_id           = aws_apigatewayv2_route.websocket_api_default_route.id
  route_response_key = "$default"
}

### $default route integration
resource "aws_apigatewayv2_integration" "websocket_api_default_integration" {
  api_id                    = aws_apigatewayv2_api.websocket_api.id
  integration_type          = "AWS_PROXY"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "Lambda API integration for defaultWebSocket function"
  integration_uri           = aws_lambda_function.default_route.invoke_arn
}

### $default route integration response
resource "aws_apigatewayv2_integration_response" "websocket_api_default_integration_response" {
  api_id                   = aws_apigatewayv2_api.websocket_api.id
  integration_id           = aws_apigatewayv2_integration.websocket_api_default_integration.id
  integration_response_key = "/200/"
}
