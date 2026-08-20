variable "db_name" {
  type        = string
  description = "Name of the initial database to create"
  default     = "myappdb"
}

variable "db_username" {
  type        = string
  description = "Master username for the database"
  default     = "postgres"
}

variable "db_password" {
  type        = string
  description = "Master password for the database"
  sensitive   = true
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where RDS and its Security Group will be deployed"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the DB subnet group"
}

variable "ec2_security_group_id" {
  type        = string
  description = "EC2 Security Group ID allowed to connect to RDS"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to all resources"
  default     = {}
}