### $connect route
resource "aws_apigatewayv2_route" "websocket_api_connect_route" {
  api_id                              = aws_apigatewayv2_api.websocket_api.id
  route_key                           = "$connect"
  route_response_selection_expression = "$default"
  target                              = "integrations/${aws_apigatewayv2_integration.websocket_api_connect_integration.id}"
}

### $connect route response
resource "aws_apigatewayv2_route_response" "websocket_api_connect_route_response" {
  api_id             = aws_apigatewayv2_api.websocket_api.id
  route_id           = aws_apigatewayv2_route.websocket_api_connect_route.id
  route_response_key = "$default"
}

### $connect route integration
resource "aws_apigatewayv2_integration" "websocket_api_connect_integration" {
  api_id                    = aws_apigatewayv2_api.websocket_api.id
  integration_uri           = aws_lambda_function.connect_route.invoke_arn
  integration_type          = "AWS_PROXY"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "Lambda API integration for connectWebSocket function"
}

### $connect route integration response
resource "aws_apigatewayv2_integration_response" "websocket_api_connect_integration_response" {
  api_id                   = aws_apigatewayv2_api.websocket_api.id
  integration_id           = aws_apigatewayv2_integration.websocket_api_connect_integration.id
  integration_response_key = "/200/"
}
