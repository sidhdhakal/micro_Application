variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "table_name" {
  description = "State-locking-micro-service-table"
  type        = string
}

variable "environment" {
  description = "Environment tag (dev/prod)"
  type        = string
  default     = "dev"
}
