terraform {
  backend "s3" {
    bucket         = "umesh-micro-service-bucket"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
