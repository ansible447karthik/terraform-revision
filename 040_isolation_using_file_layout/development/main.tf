terraform {
 backend "s3" {
 bucket = "rtc2024q1-terraform-state-1"
 key = "development/terraform.tfstate"
 region = "ap-south-1"
 dynamodb_table = "terraform_locks"
 encrypt = true
 }
}
variable "region" {
 type = string
}
variable "ami" {
 type = string
}
provider "aws" {
 region = var.region
}
resource "aws_instance" "testvm1" {
 ami = var.ami
 instance_type = "t2.micro"
}