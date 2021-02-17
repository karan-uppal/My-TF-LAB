variable "my_region" {
  type = string
default = "us-east-2"
}

variable "vpc_cidr" {
    type = string
}

variable "open_cidr" {
    default = "0.0.0.0/0"
    }

variable "sub-pub-cidr" {
  type = list
}

variable "sub-pri-cidr" {
  type = list
}

variable "azs" {
    type = list
    default = ["us-east-2a", "us-east-2b"]
}

variable "server_port" {
type = number
default = 80
}

variable "ssh_port" {
type = number
default = 22
}

variable "db_port" {
type = number
default = 3306
}

variable "env_name" {
type = string
}

variable "s3_name" {
type = string
default = "myterraform-up-and-running-statefile"
}

variable "s3_path" {type = string}
