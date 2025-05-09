variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "tf-demo"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}
