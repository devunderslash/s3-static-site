terraform {
  backend "s3" {
    bucket         = "devunderslash-state-dev"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    use_lockfile   = true  #S3 native locking
  }
}
