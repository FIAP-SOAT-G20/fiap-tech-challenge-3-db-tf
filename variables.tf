variable "db_username" {
  type        = string
  description = "Master username for the PostgreSQL RDS instance"
}

variable "db_password" {
  type        = string
  description = "Master password for the PostgreSQL RDS instance"
  sensitive   = true
}
