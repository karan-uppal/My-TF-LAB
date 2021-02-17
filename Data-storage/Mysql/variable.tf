variable "region" {
default = "us-east-2"
}

variable "env_name" {
type = string
}

variable "db_type" {
type = string
default = "mysql"
}

variable "db_ec2_type" {
type = string
default = "db.t2.micro"
}

variable "PRsub_id1" {}
variable "db_sg_id1" {}