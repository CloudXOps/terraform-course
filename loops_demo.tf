
// Example using count
resource "aws_s3_bucket" "count_example" {
  count  = 2
  bucket = "tf-operators-demo-count-${count.index + 1}"
  tags = {
    Purpose = "CountExample"
  }
}

// Example using for_each
locals {
  for_each_buckets = {
    bucket_a = "tf-operators-demo-each-a"
    bucket_b = "tf-operators-demo-each-b"
  }
}

resource "aws_s3_bucket" "for_each_example" {
  for_each = local.for_each_buckets
  bucket   = each.value
  tags = {
    Purpose = "ForEachExample"
  }
}

output "count_splat_example" {
  value = {
    count_bucket_names = aws_s3_bucket.count_example[*].bucket
    count_bucket_arns  = aws_s3_bucket.count_example[*].arn
  }
}

output "for_each_splat_example" {
  value = {
    for_each_bucket_names = [for b in aws_s3_bucket.for_each_example : b.bucket]
    for_each_bucket_arns  = [for b in aws_s3_bucket.for_each_example : b.arn]
  }
}
