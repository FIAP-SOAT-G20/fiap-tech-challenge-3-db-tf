variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "my-vpc"
}

variable "db_username" {
  description = "Master username for the PostgreSQL RDS instance"
  type        = string
  default     = "pguser"
}

variable "db_password" {
  description = "Master password for the PostgreSQL RDS instance"
  type        = string
  default     = "strongPassworD!"
  sensitive   = true
}
