variable "s3_bucket_list"{
    type = set(string)
    default = [ "bucket-1", "bucket-2" ]
}

// variable "s"


variable "s3_config"{
    type = object({
       transition_days = number
       versioning = bool
       sse_algorithm = string
       storage_class = string
    })

    default = {
      transition_days = 30
      versioning = true
      sse_algorithm = "AES256"
      storage_class = "GLACIER"
    }
}