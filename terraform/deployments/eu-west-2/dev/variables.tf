# variable "aws_region" {
#   description = "The AWS region to deploy resources to"
#   type        = string
# }

# variable "aws_access_key" {
#   description = "AWS access key"
#   type        = string
#   sensitive   = true
# }

# variable "aws_secret_key" {
#   description = "AWS secret key"
#   type        = string
#   sensitive   = true
# }

# variable "bucket_name" {
#   description = "The name of the S3 bucket for the static website"
#   type        = string
# }

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
} 