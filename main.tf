provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "${var.project_name}-demo-bucket"
  tags = {
    Name        = "DemoBucket"
    Environment = var.environment
  }
}
