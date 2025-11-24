variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "eks-vpc"
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet CIDRs"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet CIDRs"
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "environment" {
  type        = string
  description = "Environment name (dev/prod)"
}

variable "project" {
  type        = string
  description = "Project name"
}
