terraform {
  backend "s3" {
    bucket = "terraform-learning-state-1"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}