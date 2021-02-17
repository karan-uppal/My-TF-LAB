provider "aws" {
    region= var.my_region
}

terraform {
backend "s3" {
# Replace this with your bucket name!
bucket = var.s3_name
key = var.s3_path
region = var.my_region
# Replace this with your DynamoDB table name!
dynamodb_table = "terraform-up-and-running-state-locks"
encrypt = true
}
}
