provider "aws" {
    region= var.region
}

terraform {
backend "s3" {
# Replace this with your bucket name!
bucket = "myterraform-up-and-running-statefile"
key = "modules/Data-storage/Mysql/terraform.tfstate"
region = "us-east-2"
# Replace this with your DynamoDB table name!
dynamodb_table = "terraform-up-and-running-state-locks"
encrypt = true
}
}
