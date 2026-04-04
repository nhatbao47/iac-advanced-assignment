variable "subnet_id" {
  description = "The ID of the subnet where the EC2 instance will be launched"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group for the EC2 instance"
  type        = string
}