module "cognito" {
  source = "./modules/cognito"

  user_pool_name        = var.user_pool_name
  user_pool_client_name = var.user_pool_client_name
  callback_url          = var.callback_url
}


