output "user_pool_id" {
  value = module.cognito.user_pool_id
}

output "user_pool_client_id" {
  value = module.cognito.user_pool_client_id
}

output "api_id" {
  value = module.apigateway.api_id
}

output "region" {
  value = var.aws_region
}
