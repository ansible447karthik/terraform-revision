provider "aws" {
 region = "ap-south-1"
}
module "webserver_cluster" {
 source = "../../modules/services/webserver-cluster"
 region = "ap-south-1"
 ami = "ami-0e670eb768a5fc3d4"
 tags = {
 "Name" = "webserver"
 "Application" = "CRM"
    }
 ingress_source_cidr = ["49.43.243.133/32", "0.0.0.0/0"]
 min_server_count = 1
 max_server_count = 2
 cluster_name = "lms-stg"
 db_remote_state_bucket = "rtc2024q1-terraform-state-1"
 db_remote_state_key = "stage/data-stores/mysql/terraform.tfstate"
}

resource "aws_security_group_rule" "port8080" {
 from_port         = 8080
 protocol          = "tcp"
 security_group_id = module.webserver_cluster.webserver-lc-sg-id
 to_port           = 8080
 type              = "ingress"
 cidr_blocks = ["0.0.0.0/0"]
}
output "lb-dns" {
 value = module.webserver_cluster.alb_dns_name
 description = "Load Balancer DNS name"
}


output "webserver-lc-sg-id" {
 value = module.webserver_cluster.webserver-lc-sg-id
 description = " the id of the security group of the webserver vm"
}