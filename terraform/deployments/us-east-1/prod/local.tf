locals {
    # Define the local variable for the environment
    env = "prod"
    # Define the local variable for the region
    region = "us-east-1"
    # Define the local variable for the bucket name
    bucket_name = "devunderslash-static-site-${local.env}"
    # Define the local variable for the tags
    tags = {
        Environment = local.env
        ManagedBy   = "terraform"
    }
}