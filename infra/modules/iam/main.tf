data "aws_iam_policy_document" "lambda_policy" {
  statement {
    actions = [
      "dynamodb:PutItem",
      "dynamodb:UpdateItem"
    ]
    resources = [var.dynamodb_table_arn]
  }

  statement {
    actions = [
      "sqs:ReceiveMessage",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes"
    ]
    resources = [var.sqs_queue_arn]
  }

  statement {
    actions = [
      "sns:Publish"
    ]
    resources = [var.sns_topic_arn]
  }
}

resource "aws_iam_policy" "lambda_policy" {
  name   = "lambda-access-policy"
  policy = data.aws_iam_policy_document.lambda_policy.json
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = var.lambda_exec_role_name
  policy_arn = aws_iam_policy.lambda_policy.arn
}
