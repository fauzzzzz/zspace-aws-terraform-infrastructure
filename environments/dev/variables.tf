# Provider Config
variable "aws_region" {
  type        = string
  description = "AWS region to deploy resources"
}

# Common Tags
variable "tags" {
  type        = map(string)
  description = "Common tags applied to all resources"
  default     = {}
}

# VPC Module Variables
variable "vpc_name" {
  type        = string
  description = "Name prefix for VPC resources"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones for subnets"
}

variable "public_subnets_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnets_cidr" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

# Security Group Module Variables
variable "my_ip" {
  type        = string
  description = "Public IP address allowed for SSH access"
}

# EC2 Module Variables
variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance size/type"
}

variable "key_name" {
  type        = string
  description = "AWS SSH key pair name attached to the EC2 instance"
  default     = null
}

# RDS Module Variables
variable "db_name" {
  type        = string
  description = "Name of the initial PostgreSQL database"
  default     = "myappdb"
}

variable "db_username" {
  type        = string
  description = "Master username for PostgreSQL"
  default     = "postgres"
}

variable "db_password" {
  type        = string
  description = "Master password for PostgreSQL"
  sensitive   = true
}