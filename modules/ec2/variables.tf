variable instance {
    type = object({
        instance_type = string
        ami = string
        tags = map(string)
        subnet_id = string
    })

     default = {
        instance_type = "t3.micro"
        ami           = "ami-08a6efd148b1f7504" # Example AMI ID, update as needed
        tags          = {
            Name = "DefaultInstance"
            Env  = "terraform-learning"
        }
        subnet_id     = "subnet-0078cc5bca4bf4ba4" # Example subnet ID, update as needed
    }
}