variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "db_username" {
  description = "Master username for the PostgreSQL RDS instance"
  type        = string
}

variable "db_password" {
  description = "Master password for the PostgreSQL RDS instance"
  type        = string
  sensitive   = true
}
