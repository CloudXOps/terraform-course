
data "aws_s3_bucket" "demo_bucket" {
  bucket = "${var.project_name}-demo-bucket-1"
}
 
data "aws_s3_bucket" "state_bucket" {
  bucket = "terraform-learning-state-1"
}

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




