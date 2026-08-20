variable "ami_id" {
  type        = string
  description = "AMI ID to launch the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance size/typ"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where the instance will be deployed"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of Security Group IDs attached to the instance"
}

variable "key_name" {
  type        = string
  description = "Optional SSH key pair name to attach to the instance"
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Additional tags to apply to all resources"
  default     = {}
}