# Define a set of bucket names
locals {
  bucket_names = toset([
    "my-first-bucket-123",
    "my-second-bucket-456",
    "my-third-bucket-789"
  ])

  bucket_region_names = {
    "us-east-1" : {"bucket_name": "my-first-bucket-123", "acl": "private"}
    "us-west-2" : {"bucket_name": "mmy-second-bucket-456", "acl": "public"}
    "eu-central-1" : {"bucket_name": "my-third-bucket-789", "acl": "private"}
  }
}

# Create multiple S3 buckets using for_each
resource "aws_s3_bucket" "buckets" {
  for_each = local.bucket_names

  bucket = each.value

  tags = {
    Name        = each.value
    Environment = "test"
    Created     = "terraform"
  }
}
# Create multiple S3 buckets using for_each
resource "aws_s3_bucket" "buckets1" {
  for_each = local.bucket_region_names

  bucket = each.key

  tags = {
    Name        = each.key
    Environment = "test"
    Created     = "terraform"
  }
}

resource "aws_s3_bucket_region" "bucket_regions" {
  for_each = local.bucket_region_names
  
  bucket = aws_s3_bucket.buckets1[each.key].id
  region = each.value
}




