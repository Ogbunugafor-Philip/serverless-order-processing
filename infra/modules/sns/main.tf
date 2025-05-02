resource "aws_sns_topic" "order_topic" {
  name = var.topic_name
}
