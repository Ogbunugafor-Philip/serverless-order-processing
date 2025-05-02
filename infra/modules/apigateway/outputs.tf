output "api_id" {
  value = aws_apigatewayv2_api.rest_api.id
}

output "api_endpoint" {
  value = aws_apigatewayv2_api.rest_api.api_endpoint
}
