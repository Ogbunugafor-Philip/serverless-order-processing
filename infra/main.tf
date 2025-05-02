module "cognito" {
  source = "./modules/cognito"

  user_pool_name        = var.user_pool_name
  user_pool_client_name = var.user_pool_client_name
  callback_url          = var.callback_url
}

module "apigateway" {
  source  = "./modules/apigateway"
  api_name = var.api_name
}

module "lambda" {
  source      = "./modules/lambda"
  lambda_name = var.lambda_name
}

module "sqs" {
  source     = "./modules/sqs"
  queue_name = var.queue_name
}

module "sns" {
  source     = "./modules/sns"
  topic_name = var.topic_name
}

module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = var.table_name
}

module "iam" {
  source                 = "./modules/iam"
  dynamodb_table_arn     = module.dynamodb.orders_table_arn
  sqs_queue_arn          = module.sqs.main_queue_arn
  sns_topic_arn          = module.sns.topic_arn
  lambda_exec_role_name  = module.lambda.lambda_exec_role_name
}

module "cloudwatch" {
  source         = "./modules/cloudwatch"
  lambda_name    = var.lambda_name
  retention_days = 14
}


