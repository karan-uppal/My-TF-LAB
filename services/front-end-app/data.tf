data "terraform_remote_state" "network" {
backend = "s3"
config = {
bucket = "myterraform-up-and-running-statefile"
key = "modules/network/terraform.tfstate"
region = "us-east-2"
}
}

data "terraform_remote_state" "db" {
backend = "s3"
config = {
bucket = "myterraform-up-and-running-statefile"
key = "modules/Data-storage/Mysql/terraform.tfstate"
region = "us-east-2"
}
}
