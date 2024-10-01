resource "aws_apigatewayv2_api" "fiap_apigateway" {
  name          = "fiap-tech-challenge-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_vpc_link" "loadbalancer-vpc-link" {
  name               = "loadbalancer-vpc-link"
  subnet_ids         = ["subnet-0754183aca138c7aa", "subnet-0115b6d08158577bf"]
  security_group_ids = ["sg-0aa865e43167f6313"]
  tags = {
    Name = "loadbalancer-vpc-link"
  }
}

resource "aws_apigatewayv2_stage" "fiap_apigateway_stage" {
  api_id      = aws_apigatewayv2_api.fiap_apigateway.id
  name        = "$default"
  auto_deploy = true
}

