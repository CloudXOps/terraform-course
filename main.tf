provider "aws" {
  region = var.aws_region
}

# resource block
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "${var.project_name}-demo-bucket-1"
  tags = {
    Name        = "DemoBucket"
    Environment = var.environment
  }
}

# output "aws_s3_bucket_attributes" {
#   value = aws_s3_bucket.demo_bucket
# }



# data source 
data "aws_s3_bucket" "demo_bucket" {
  bucket = "${var.project_name}-demo-bucket-1"
}

# output "aws_s3_bucket_data" {
#   value = data.aws_s3_bucket.demo_bucket
# }



# state bucket check 
data "aws_s3_bucket" "state_bucket" {
  bucket = "terraform-learning-state-1"
}

# output "state_bucket_data" {
#   value = data.aws_s3_bucket.state_bucket.arn
# }


data "aws_ami" "latest_amzon_linux_ami" {
   most_recent = true
  
  filter {
    name   = "name"
    values = ["amzn2-ami-*-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

output "latest_ami" {
  value = data.aws_ami.latest_amzon_linux_ami
}

# # ec2 
# resource "aws_instance" "demo_instance" {
#   ami           = data.aws_ami.latest_amzon_linux_ami
#   instance_type = "t2.micro"

#   tags = {
#     Name        = "${var.project_name}-demo-instance"
#     Environment = var.environment
#   }
# }


