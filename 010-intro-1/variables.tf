variable "region" {
  type = string
  description = "region to deploy the infrastucture resources"
  validation {
    condition = contains(["ap-south-1", "us-east-1"], lower(var.region))
    error_message = "only mumbai and n.virginia regions are supported."
  }
}

variable "ami" {
  type = string
  description = "vm image to use"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "size of the vm"
}

variable "tags" {
  type = map(string)
  description = "tags to categorize the vm"
}

variable "ingress_source_cidr" {
  type = list(string)
  description = "security group ingress rules source cidr ranges"
}