
resource "aws_s3_bucket" "secure_bucket" {
  bucket   = "test-bucket"
  tags = {
    Environment = "terraform-learning"
  }
}


# Block public access
resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket                  = aws_s3_bucket.secure_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Enable versioning
resource "aws_s3_bucket_versioning" "versioning" {

  bucket = aws_s3_bucket.secure_bucket.id

  versioning_configuration {
    status = var.s3_config.versioning ? "Enabled" : "Suspended"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.s3_config.sse_algorithm
    }
  }
}

# Enable logging (requires a target bucket)
resource "aws_s3_bucket_logging" "logging" {
  bucket        = aws_s3_bucket.secure_bucket.id
  target_bucket = aws_s3_bucket.secure_bucket.id
  target_prefix = "logs/"
}

# Lifecycle policy (move to Glacier after 30 days)
resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    id     = "MoveToGlacier"
    status = "Enabled"

    filter {
      prefix = ""
    }

    transition {
      days          = var.s3_config.transition_days
      storage_class = var.s3_config.storage_class
    }
  }
}
