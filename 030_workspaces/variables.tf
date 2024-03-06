variable "region" {
 type = string
 description = "Region to deploy the infrastructure resources"
 default = "ap-south-1"

 }

variable "ami" {
 type = string
 description = "VM image to use"
 default = "ami-0e670eb768a5fc3d4"
}