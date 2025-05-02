resource "aws_apigatewayv2_api" "rest_api" {
  name          = var.api_name
  protocol_type = "HTTP"
}
