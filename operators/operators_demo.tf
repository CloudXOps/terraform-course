provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "tf-operators-demo-bucket"
  tags = {
    Purpose = "OperatorsDemo"
    Environment = "Demo"
    Owner = "TerraformUser"
  }
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "tf-operators-demo-bucket-2"
  tags = {
    Purpose = "OperatorsDemo"
  }
}

locals {
  // Arithmetic Operators: Use bucket name lengths
  bucket1_length = length(aws_s3_bucket.bucket1.bucket)
  bucket2_length = length(aws_s3_bucket.bucket2.bucket)
  sum          = local.bucket1_length + local.bucket2_length
  difference   = local.bucket1_length - local.bucket2_length
  product      = local.bucket1_length * 2
  quotient     = local.bucket1_length / 2
  modulus      = local.bucket1_length % 5

  // Comparison Operators
  is_equal      = aws_s3_bucket.bucket1.bucket == aws_s3_bucket.bucket2.bucket
  is_not_equal  = aws_s3_bucket.bucket1.bucket != aws_s3_bucket.bucket2.bucket
  is_greater    = local.bucket1_length > local.bucket2_length
  is_greater_eq = local.bucket1_length >= local.bucket2_length
  is_less       = local.bucket1_length < local.bucket2_length
  is_less_eq    = local.bucket1_length <= local.bucket2_length

  // Logical Operators
  both_buckets_private = ( (aws_s3_bucket.bucket1.acl == "private") && (aws_s3_bucket.bucket2.acl == "private") )
  any_bucket_private   = ( (aws_s3_bucket.bucket1.acl == "private") || (aws_s3_bucket.bucket2.acl == "private") )
  not_private          = ! (aws_s3_bucket.bucket1.acl == "private")

  // Conditional (Ternary) Operator
  // main_expression ? ( exp1 : exp 2)

  longer_bucket = (local.bucket1_length > local.bucket2_length) ? (aws_s3_bucket.bucket1.bucket) : ( 5>2 ? "apple": "banana")


  // Indexing
  bucket_names = [aws_s3_bucket.bucket1.bucket, aws_s3_bucket.bucket2.bucket]
  first_bucket = local.bucket_names[0]

  tags_map     = aws_s3_bucket.bucket1.tags
  purpose_tag  = local.tags_map["Purpose"]
  owner_tag = local.tags_map["Owner"]

  // Splat Operator
  all_buckets      = [aws_s3_bucket.bucket1, aws_s3_bucket.bucket2]

  all_bucket_names = [for b in local.all_buckets : b.bucket]  // using list comprehension
  all_bucket_names_1 = local.all_buckets.*.id

  all_tags         = local.all_buckets.*.tags // list of all tags

  // Additional Splat Operator bucket1s
  all_bucket_arns  = local.all_buckets[*].arn
  all_bucket_ids   = local.all_buckets[*].id

  all_purpose_tags = [for t in local.all_buckets[*].tags : t["Purpose"]]
}

output "arithmetic_bucket1s" {
  value = {
    bucket1_length = local.bucket1_length
    bucket2_length = local.bucket2_length
    sum          = local.sum
    difference   = local.difference
    product      = local.product
    quotient     = local.quotient
    modulus      = local.modulus
  }
}

output "comparison_bucket1s" {
  value = {
    is_equal      = local.is_equal
    is_not_equal  = local.is_not_equal
    is_greater    = local.is_greater
    is_greater_eq = local.is_greater_eq
    is_less       = local.is_less
    is_less_eq    = local.is_less_eq
  }
}

output "logical_bucket1s" {
  value = {
    both_buckets_private = local.both_buckets_private
    any_bucket_private   = local.any_bucket_private
    not_private          = local.not_private
  }
}

output "ternary_bucket1" {
  value = local.longer_bucket
}

output "indexing_bucket1s" {
  value = {
    first_bucket = local.first_bucket
    purpose_tag  = local.purpose_tag
  }
}

output "splat_operator_bucket1" {
  value = {
    all_bucket_names = local.all_bucket_names
    all_tags         = local.all_tags
    all_bucket_arns  = local.all_bucket_arns
    all_bucket_ids   = local.all_bucket_ids
    all_purpose_tags = local.all_purpose_tags
  }
}
