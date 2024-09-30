
output "api_gateway_url" {
  value = aws_apigatewayv2_stage.fiap_apigateway_stage.invoke_url
}