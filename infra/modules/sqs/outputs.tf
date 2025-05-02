output "main_queue_url" {
  value = aws_sqs_queue.main_queue.id
}

output "main_queue_arn" {
  value = aws_sqs_queue.main_queue.arn
}

output "dlq_arn" {
  value = aws_sqs_queue.dlq.arn
}
