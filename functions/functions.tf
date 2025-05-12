
variable "region" {
  default = "us-west-2"
}

variable "instance_types" {
  default = ["t2.micro", "t3.micro", "t2.small", "t3.small"]
}

variable "amis" {
  default = {
    "us-east-1" = "ami-0abcdef1234567890"
    "us-west-2" = "ami-0123456789abcdef0"
  }
}

locals {
  merged_instance_types = concat(["t2.nano"], var.instance_types)
  filtered_instance     = element(var.instance_types, 2)
  sliced_types          = slice(var.instance_types, 1, 3)
  has_t3small           = contains(var.instance_types, "t3.small")
  region_ami            = lookup(var.amis, var.region, "ami-default")
  merged_maps           = merge({ Name = "example" }, { Env = "dev" })
  instance_count        = length(var.instance_types)
}

data "aws_ami" "selected" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }


  filter {
    name   = "image-id"
    values = [local.region_ami]
  }
}

resource "aws_instance" "example" {
  count         = local.instance_count > 2 ? 2 : 1
  ami           = data.aws_ami.selected.id
  instance_type = local.filtered_instance
  tags          = local.merged_maps
}

output "info" {
  value = {
    merged_types = local.merged_instance_types
    sliced       = local.sliced_types
    contains     = local.has_t3small
    ami_used     = local.region_ami
    tag_data     = local.merged_maps
  }
}



