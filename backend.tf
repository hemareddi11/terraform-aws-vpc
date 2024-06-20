terraform {
  backend "s3" {
    bucket = "asigns3srdevops"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}