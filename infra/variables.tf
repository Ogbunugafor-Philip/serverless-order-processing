variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix for project resources"
  type        = string
  default     = "serverless-order-processing"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "lambda_runtime" {
  description = "Lambda function runtime"
  type        = string
  default     = "nodejs18.x"
}

variable "user_pool_name" {
  default = "serverless-order-processing-user-pool"
}

variable "user_pool_client_name" {
  default = "serverless-order-app-client"
}

variable "callback_url" {
  default = "https://example.com/callback"
}

variable "api_name" {
  default = "serverless-order-api"
}

variable "lambda_name" {
  default = "order-processing-handler"
}

variable "queue_name" {
  default = "order-queue"
}

variable "topic_name" {
  default = "order-notification-topic"
}

variable "table_name" {
  default = "orders"
}

variable "bucket_name" {
  default = "serverless-order-frontend-bucket"
}
