variable "users" {
  type    = list(string)
  default = ["alice", "bob", "alice", "dave"]
}

variable "user_roles" {
  type    = map(string)
  default = {
    alice = "admin"
    bob   = "dev"
    dave  = "qa"
  }
}

variable "json_input" {
  type    = string
  default = "{\"name\":\"test\",\"env\":\"prod\"}"
}

variable "template_vars" {
  type = object({
    app  = string
    port = number
  })
  default = {
    app  = "myapp"
    port = 8080
  }
}