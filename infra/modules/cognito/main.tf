resource "aws_cognito_user_pool" "user_pool" {
  name = var.user_pool_name

  auto_verified_attributes = ["email", "phone_number"]

  password_policy {
    minimum_length    = 8
    require_uppercase = true
    require_lowercase = true
    require_numbers   = true
    require_symbols   = true
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name         = var.user_pool_client_name
  user_pool_id = aws_cognito_user_pool.user_pool.id

  generate_secret                          = false
  allowed_oauth_flows                     = ["code"]
  allowed_oauth_scopes                    = ["email", "openid", "profile"]
  supported_identity_providers            = ["COGNITO"]
  callback_urls                           = [var.callback_url]
  allowed_oauth_flows_user_pool_client    = true
}

