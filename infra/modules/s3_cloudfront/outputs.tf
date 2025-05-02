output "cloudfront_domain_name" {
  description = "Default CloudFront domain to access the app"
  value       = aws_cloudfront_distribution.cdn.domain_name
}
