# output "bucket_name_upper" {
#   description = "S3 bucket name in uppercase (function demo)"
#   value       = upper(aws_s3_bucket.demo_bucket.bucket)
# }

# output "is_prod_env" {
#   description = "Is this a production environment? (expression demo)"
#   value       = var.environment == "prod"
# }

# output "bucket_name_length" {
#   description = "Length of the bucket name (function demo)"
#   value       = length(aws_s3_bucket.demo_bucket.bucket)
# }

# output "bucket_name_with_suffix" {
#   description = "Bucket name with '-2024' suffix (operator demo)"
#   value       = "${aws_s3_bucket.demo_bucket.bucket}-2024"
# }

# output "bucket_tags" {
#   description = "Tags as a map (expression demo)"
#   value       = aws_s3_bucket.demo_bucket.tags
# }
