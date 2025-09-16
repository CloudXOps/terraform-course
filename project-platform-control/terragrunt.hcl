locals {
  yaml_config = yamldecode(file("config.yaml"))
  instances   = local.yaml_config.instances
}

inputs = {
  instances = local.instances
}

terraform {
  source = "../project-blueprints"
}

