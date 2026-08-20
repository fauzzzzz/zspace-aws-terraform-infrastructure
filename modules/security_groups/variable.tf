variable "vpc_id" {
  type        = string
}

variable "vpc_name" {
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to all resources"
  default     = {}
}

variable "my_ip" {
  description = "Public IP allowed for access SSH"
  type        = string
}