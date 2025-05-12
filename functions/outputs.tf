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
    sanitized_str    = local.sanitized_str
  }
}