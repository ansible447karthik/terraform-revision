terraform {
 backend "s3" {
 bucket = "rtc2024q1-terraform-state-1"
 key = "workspaces-demo/terraform.tfstate"
 region = "ap-south-1"
 dynamodb_table = "terraform_locks"
 encrypt = true
 }
}
provider "aws" {
 region = var.region
}
resource "aws_instance" "testvm1" {
 ami = var.ami
 instance_type = terraform.workspace == "staging" ? "t2.medium" : "t2.micro"
}
