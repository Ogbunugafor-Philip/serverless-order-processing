variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "cognito_user_pool_id" {
  description = "The ID of the Cognito User Pool"
  type        = string
}

variable "cognito_app_client_id" {
  description = "The App Client ID of the Cognito User Pool"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "order_handler_lambda_arn" {
  description = "The invoke ARN of the orderHandler Lambda function"
  type        = string
}
