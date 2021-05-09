output wss_stage_invoke_url {
  value       = aws_apigatewayv2_stage.websocket_api_stage.invoke_url
  description = "The URL to invoke the API pointing to the stage."
}
