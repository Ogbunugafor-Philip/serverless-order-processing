output "orders_table_name" {
  value = aws_dynamodb_table.orders_table.name
}

output "orders_table_arn" {
  value = aws_dynamodb_table.orders_table.arn
}
