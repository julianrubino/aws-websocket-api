
### WebSocket API
resource "aws_apigatewayv2_api" "websocket_api" {
  name                       = "websocket-api"
  protocol_type              = "WEBSOCKET"
  route_selection_expression = "$request.body.action"
}

### WebSocket API Stage
resource "aws_apigatewayv2_stage" "websocket_api_stage" {
  api_id      = aws_apigatewayv2_api.websocket_api.id
  name        = "ws-stage"
  auto_deploy = true
}
