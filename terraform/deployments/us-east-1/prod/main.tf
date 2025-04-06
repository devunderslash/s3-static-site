module "static_website_prod" {
  source = "../../../modules/static_site"

  bucket_name = local.bucket_name
  tags = merge(
    var.tags,
    local.tags
  )
} 

provider "aws" {
  region     = local.region
  profile    = "Dev"
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
}

output "endpoint" {
  value = module.static_website_prod.website_endpoint
}