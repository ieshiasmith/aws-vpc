variable "region" {
  type        = string
  default     = "us-east-2"
  description = "AWS Region"
}

variable "name" {
  type        = string
  default     = "demoland"
  description = "This will be a common named used for labeling most resources"
}

variable "cidr_prefix" {
  default     = 10.0
  description = "CDIR PREFIX for the entire VPC"
}

variable "vpc_mask" {
  default     = "16"
  description = "VPC mask"
}

variable "cidr_prefix" {
  default     = "24"
  description = "Subnet mask"
}
