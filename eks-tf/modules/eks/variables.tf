variable "cluster_name" {
  type = string
}

variable "cluster_role_arn" {
  description = "IAM Role ARN for EKS Control Plane"
  type        = string
}

variable "node_role_arn" {
  description = "IAM Role ARN for Worker Nodes"
  type        = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

# Node group variables
variable "desired_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}
