terraform {
  backend "s3" {
    bucket         = "devunderslash-state-prod"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile   = true  #S3 native locking
  }
}
