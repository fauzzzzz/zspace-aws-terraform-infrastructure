variable "vpc_cidr" {
  type        = string
  description = "CIDR block vpc"
}

variable "vpc_name" {
  type        = string
}

variable "public_subnets_cidr" {
  type        = list(string)
}

variable "private_subnets_cidr" {
  type        = list(string)
}

variable "azs" {
  type        = list(string)
  description = "Availability zones for suubnets"
}

variable "tags" {
  type        = map(string)
  default     = {}
}

