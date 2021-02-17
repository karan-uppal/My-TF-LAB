resource "aws_db_instance" "example" {
identifier_prefix = "${var.env_name}-terraform-db"
engine = var.db_type
allocated_storage = 10
instance_class = var.db_ec2_type
db_subnet_group_name = aws_db_subnet_group.default.id
vpc_security_group_ids = [var.db_sg_id1]
name = "${var.env_name}_terraform_database"
username = "admin"
password = data.aws_ssm_parameter.db_password.value
lifecycle {
    ignore_changes = [snapshot_identifier]
  }
apply_immediately         = true
skip_final_snapshot       = true

}

resource "aws_db_subnet_group" "default" {
  name       = "${var.env_name}-db_subnet_group"
  subnet_ids = var.PRsub_id1
}