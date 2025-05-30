// Inside a block in Terraform, you define arguments and nested blocks.
// Arguments are key-value pairs (e.g., required_version = ">= 1.0.0").
// Nested blocks are blocks within blocks (e.g., required_providers { ... } inside terraform { ... }).


// block_type "label" {
//   argument_name = value
//   nested_block_type {
//     nested_argument = value
//   }
// }


terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws" 
      version = "~> 5.6.0"      
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"           
    }
    null = {
      source  = "hashicorp/null"  
      version = "~> 3.0"           
    }
  }

  backend "s3" {
    bucket = "terraform-learning-state-1"
    key    = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-learning-state-lock"
  }
}
