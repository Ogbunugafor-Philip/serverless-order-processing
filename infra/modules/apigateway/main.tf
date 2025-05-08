# Create the API Gateway (HTTP API)
resource "aws_apigatewayv2_api" "rest_api" {
  name          = var.api_name
  protocol_type = "HTTP"
}

# Lambda Integration (orderHandler)
resource "aws_apigatewayv2_integration" "order_handler" {
  api_id                 = aws_apigatewayv2_api.rest_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = var.order_handler_lambda_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}

# JWT Authorizer using Cognito
resource "aws_apigatewayv2_authorizer" "jwt_auth" {
  name               = "JWTAuthorizer"
  api_id             = aws_apigatewayv2_api.rest_api.id
  authorizer_type    = "JWT"
  identity_sources   = ["$request.header.Authorization"]

  jwt_configuration {
    audience = [var.cognito_app_client_id]
    issuer   = "https://cognito-idp.${var.region}.amazonaws.com/${var.cognito_user_pool_id}"
  }
}

# Route: POST /orders (protected with JWT)
resource "aws_apigatewayv2_route" "order_route" {
  api_id             = aws_apigatewayv2_api.rest_api.id
  route_key          = "POST /orders"
  target             = "integrations/${aws_apigatewayv2_integration.order_handler.id}"
  authorizer_id      = aws_apigatewayv2_authorizer.jwt_auth.id
  authorization_type = "JWT"
}

# ✅ API Gateway Stage - REQUIRED to expose the

