output "bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.website.id
}

output "website_endpoint" {
  description = "The website endpoint URL"
  value       = aws_s3_bucket_website_configuration.website.website_endpoint
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = aws_s3_bucket.website.arn
} 
