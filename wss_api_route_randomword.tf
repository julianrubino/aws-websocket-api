### randomword route
resource "aws_apigatewayv2_route" "websocket_api_random_word_route" {
  api_id                              = aws_apigatewayv2_api.websocket_api.id
  route_key                           = "randomword"
  route_response_selection_expression = "$default"
  target                              = "integrations/${aws_apigatewayv2_integration.websocket_api_random_word_integration.id}"
}

### randomword route response
resource "aws_apigatewayv2_route_response" "websocket_api_random_word_route_response" {
  api_id             = aws_apigatewayv2_api.websocket_api.id
  route_id           = aws_apigatewayv2_route.websocket_api_random_word_route.id
  route_response_key = "$default"
}

### randomword route integration
resource "aws_apigatewayv2_integration" "websocket_api_random_word_integration" {
  api_id                    = aws_apigatewayv2_api.websocket_api.id
  integration_uri           = aws_lambda_function.random_word_route.invoke_arn
  integration_type          = "AWS_PROXY"
  content_handling_strategy = "CONVERT_TO_TEXT"
  description               = "Lambda API integration for random_word function"
}

### randomword route integration response
resource "aws_apigatewayv2_integration_response" "websocket_api_random_word_integration_response" {
  api_id                   = aws_apigatewayv2_api.websocket_api.id
  integration_id           = aws_apigatewayv2_integration.websocket_api_random_word_integration.id
  integration_response_key = "/200/"
}
