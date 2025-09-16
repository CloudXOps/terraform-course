variable "instances" {
  description = "Map of instance configurations"
  type = map(object({
    instance_type = string
    ami           = string
    tags          = map(string)
    subnet_id     = string
  }))
}