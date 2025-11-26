variable "cluster_name" {
  type = string
}

variable "k8s_version" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "cluster_role_arn" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "node_desired" {
  type    = number
  default = 2
}

variable "node_min" {
  type    = number
  default = 2
}

variable "node_max" {
  type    = number
  default = 2
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t2.micro"]
}

variable "tags" {
  type    = map(string)
  default = {}
}
