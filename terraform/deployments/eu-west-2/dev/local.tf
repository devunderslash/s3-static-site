locals {
    # Define the local variable for the environment
    env = "dev"
    # Define the local variable for the region
    region = "eu-west-2"
    # Define the local variable for the bucket name
    bucket_name = "devunderslash-static-site-${local.env}"
    # Define the local variable for the tags
    tags = {
        Environment = local.env
        ManagedBy   = "terraform"
    }
}