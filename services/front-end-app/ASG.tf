resource "aws_launch_configuration" "example" {
    image_id = "ami-01aab85a5e4a5a0fe"
    instance_type = "t2.micro"
    key_name = "ohio"
    security_groups = [var.ec2_sg_id1]
    user_data = templatefile("${path.module}/user-data.sh", { env = var.env_name,db_port = var.port1, db_address = var.address1})
lifecycle {
create_before_destroy = true
}
}

resource "aws_autoscaling_group" "example" {
launch_configuration = aws_launch_configuration.example.name
vpc_zone_identifier = tolist(var.Psub_id1)
target_group_arns = [aws_lb_target_group.tg.arn]
health_check_type = "ELB"
health_check_grace_period = 300
min_size = 1
max_size = 2
tag {
key = "Name"
value = "${var.env_name}-terraform-asg"
propagate_at_launch = true
}
}