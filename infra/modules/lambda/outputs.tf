output "lambda_function_name" {
  value = aws_lambda_function.lambda_func.function_name
}

output "lambda_function_arn" {
  value = aws_lambda_function.lambda_func.arn
}

output "lambda_exec_role_name" {
  value = aws_iam_role.lambda_exec.name

}
