//
variable "users" {
  default = ["alice", "bob", "alice", "dave"]
}

variable "user_roles" {
  default = {
    alice = "admin"
    bob   = "dev"
    dave  = "qa"
  }
}

variable "json_input" {
  default = "{\"name\":\"test\",\"env\":\"prod\"}"
}

variable "template_vars" {
  default = {
    app  = "myapp"
    port = 8080
  }
}

locals {
  # 1. distinct, sort, chunklist
  distinct_users = distinct(var.users)
  sorted_users   = sort(var.users)
  chunked_users  = chunklist(var.users, 2)

  # 2. keys, values
  user_keys   = keys(var.user_roles)
  user_values = values(var.user_roles)

  # 3. jsonencode 
  encoded_json = jsonencode(var.user_roles)
  //jsondecode
  decoded_json = jsondecode(var.json_input)

  # 4. file / templatefile (assume file path exists)
  config_file     = file("${path.module}/config.txt")
  rendered_config = templatefile("${path.module}/config.tpl", var.template_vars)

  # 5. coalesce
  fallback_user = coalesce("", "", "default_user")

  # 6. try
  try_example = try(var.user_roles["admin"], "fallback_value")

  # 7. format
  formatted_string = format("App: %s, Port: %d", var.template_vars.app, var.template_vars.port)

  # 8. join / split
  joined_users = join(",", var.users)
  split_users  = split(",", "alice,bob,dave")

  # 9. regex, regexreplace
  email_match   = regex("^[a-z]+@[a-z]+\\.[a-z]{2,3}$", "user@example.com")
  # sanitized_str = regexreplace("file: config.yaml", "file: (.*)", "$1")


  hcl_values = jsondecode(file("${path.module}/values.json"))

}



output "function_examples" {
  value = {
    distinct_users   = local.distinct_users
    sorted_users     = local.sorted_users
    user_keys        = local.user_keys
    user_values      = local.user_values
    decoded_json     = local.decoded_json
    config_file      = local.config_file
    rendered_config  = local.rendered_config
    fallback_user    = local.fallback_user
    try_example      = local.try_example
    formatted_string = local.formatted_string
    joined_users     = local.joined_users
    split_users      = local.split_users
    email_match      = local.email_match
    # sanitized_str    = local.sanitized_str
    hcl_values       = local.hcl_values
  }
}
