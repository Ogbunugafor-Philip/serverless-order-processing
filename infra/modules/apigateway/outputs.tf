output "api_id" {
  value = aws_apigatewayv2_api.rest_api.id
}

output "jwt_authorizer_id" {
  value = aws_apigatewayv2_authorizer.jwt_auth.id
}

output "route_id" {
  value = aws_apigatewayv2_route.order_route.id
}
