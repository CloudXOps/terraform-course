// Inside a block in Terraform, you define arguments and nested blocks.
// Arguments are key-value pairs (e.g., required_version = ">= 1.0.0").
// Nested blocks are blocks within blocks (e.g., required_providers { ... } inside terraform { ... }).
//
// Example structure:
// block_type "label" {
//   argument_name = value
//   nested_block_type {
//     nested_argument = value
//   }
// }

// In Terraform, arguments are key-value pairs defined inside a block.
// They assign values to configuration settings or resource attributes.
// Syntax: argument_name = value
// The value can be a string, number, bool, list, map, or expression.
//
// Examples:
//   required_version = ">= 1.0.0"   // string argument
//   count = 3                       // number argument
//   enabled = true                  // boolean argument
//   tags = { Name = "example" }     // map argument
//
// Arguments are used to configure how a block behaves or to set resource properties.
// They are not blocks themselves, but simple assignments within a block.

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws" // string
      version = "~> 5.0"        // string
    }
    random = {
      source  = "hashicorp/random" // string
      version = "~> 3.0"           // string
    }
    null = {
      source  = "hashicorp/null"   // string
      version = "~> 3.0"           // string
    }
    // ...other providers...
  }

#   backend "s3" {
#     bucket = "my-terraform-remote-state-bucket"
#     key    = "global/s3/terraform.tfstate"
#     region = "us-east-1"
#     encrypt = true
#     // ...other backend options...
#   }
  // ...other optional settings like backend...
}
