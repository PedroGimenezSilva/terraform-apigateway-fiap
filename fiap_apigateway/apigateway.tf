resource "aws_apigatewayv2_api" "fiap_apigateway" {
  name          = "fiap-tech-challenge-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "fiap_apigateway_integration" {
  api_id           = aws_apigatewayv2_api.fiap_apigateway.id
  integration_type = "HTTP_PROXY"
  integration_uri  = "http://teste"
}

resource "aws_apigatewayv2_route" "fiap_apigateway_integration" {
  api_id    = aws_apigatewayv2_api.fiap_apigateway.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_apigateway_integration.id}"
}

resource "aws_apigatewayv2_stage" "fiap_apigateway_stage" {
  api_id      = aws_apigatewayv2_api.fiap_apigateway.id
  name        = "prod"
  auto_deploy = true
}

