resource "aws_lambda_function" "lambda_func" {
  function_name = "order-processing-handler"

  filename         = "${path.module}/order-handler.zip"  # Placeholder for now
  source_code_hash = filebase64sha256("${path.module}/order-handler.zip")

  handler = "index.handler"
  runtime = "nodejs18.x"

  role = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      STAGE = "dev"
    }
  }
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
