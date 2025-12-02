variable "name" {
  description = "Name of the VPC"
  type        = string
  default     = "dev-vpc"
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-1a","eu-west-1b","eu-west-1c"]
}

variable "public_subnets" {
  description = "List of public subnet CIDRs"
  type        = list(string)
  default     = ["10.0.101.0/24","10.0.102.0/24","10.0.103.0/24"]
}

variable "private_subnets" {
  description = "List of private subnet CIDRs"
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway for private subnets"
  type        = bool
  default     = true
}

variable "enable_vpn_gateway" {
  description = "Enable VPN gateway for the VPC"
  type        = bool
  default     = false
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {
    Project = "my-project"
  }
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "dev-eks"
}

variable "desired_size" {
  type        = number
  description = "Desired number of nodes"
  default     = 2
}

variable "min_size" {
  type        = number
  description = "Min number of nodes"
  default     = 1
}

variable "max_size" {
  type        = number
  description = "Max number of nodes"
  default     = 3
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type for worker nodes"
  default     = "t3.medium"
}