
output "aws_s3_bucket_attributes" {
  value = aws_s3_bucket.demo_bucket
}

output "aws_s3_bucket_data" {
  value = data.aws_s3_bucket.demo_bucket
}

output "state_bucket_data" {
  value = data.aws_s3_bucket.state_bucket.arn
}

output "latest_ami" {
  value = data.aws_ami.latest_amzon_linux_ami
}
