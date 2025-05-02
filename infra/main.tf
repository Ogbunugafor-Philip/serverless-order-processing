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


