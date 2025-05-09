variable "gha_iam_roles" {
  description = "Map of objects - each representing a gha-iam-role to be created in the account."
  type = map(object({
    managed_policy_arns  = list(string)
    assume_role_policy   = string
    max_session_duration = optional(number, 3600) # (Optional) Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.
    tags                 = optional(map(string))
  }))

  default = {
    "oidc_gha_read_platform-control-aws" = {
      assume_role_policy  = "read_assume_role.json"
      managed_policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
    }
    "oidc_gha_prod_platform-control-aws" = {
      assume_role_policy  = "prod_assume_role.json"
      managed_policy_arns = ["arn:aws:iam::aws:policy/AdministratorAccess"]
    }
  }
}


variable "role_name" {
  type = string
}

variable "number_of_roles" {
  type = number
}

variable "create_role" {
  type = bool
}

variable "roles" {
  type    = list(string)
  default = ["role_1", "role_2"]
}

variable "list_of_int" {
  type    = list(number)
  default = [1, 2, 3]
}

variable "list_of_bool" {
  type    = list(number)
  default = [true, false]
}

variable "map_of_string" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "map_of_string" {
  type = map(number)
  default = {
    key1 = 1
    key2 = 5
  }
}

variable "object_type" {
  description = "This is a variable of type object"
  type = object({
    name    = string
    age     = number
    address = string
  })

  default = {
    name    = "ravi"
    age     = 30
    address = "bangalore"
  }
}


variable "persons" {
  type = map(object({
    name    = string
    age     = number
    address = string
  }))

  default = {
    "person1" = {
      name    = "ravi"
      age     = 30
      address = "bangalore"
    }
    "person2" = {
      name    = "raju"
      age     = 20
      address = "hyd"
    }
  }
}


variable "list_of_objects" {
  type = list(object)
  default = [
    {
      name    = "ravi"
      age     = 30
      address = "bangalore"
    },
    {
      name    = "raju"
      age     = 20
      address = "hyd"
    }
  ]
}
