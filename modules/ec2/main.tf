resource "aws_instance" "instance" {
    instance_type = var.instance.instance_type
    ami           = var.instance.ami            
    tags = var.instance.tags
    subnet_id = var.instance.subnet_id
}