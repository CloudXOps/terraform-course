module "ec2_instance" {
    for_each = var.instances
    source = "/home/madhu/repos/eaf/terraform/modules/ec2"
    instance = each.value
}