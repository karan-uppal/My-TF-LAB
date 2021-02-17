resource "aws_lb" "mylb" {
name = "${var.env_name}-terraform-lb"
load_balancer_type = "application"
subnets = tolist(var.Psub_id1)
security_groups = [var.lb_sg_id1]
}

resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.mylb.arn
    port = 80
    protocol = "HTTP"
# By default, return a simple 404 page
    default_action {
        type = "fixed-response"
    fixed_response {
        content_type = "text/plain"
        message_body = "404: page not found"
        status_code = 404
    }
} 
}

resource "aws_lb_target_group" "tg" {
name = "${var.env_name}-terraform-lb-tg"
port = var.server_port
protocol = "HTTP"
vpc_id = var.vpc_id1
health_check {
path = "/error.html"
protocol = "HTTP"
matcher = "200"
interval = 15
timeout = 3
healthy_threshold = 2
unhealthy_threshold = 2
}
}

resource "aws_lb_listener_rule" "lb-rule" {
listener_arn = aws_lb_listener.http.arn
priority = 100
condition {
     path_pattern {
values = ["*"]
    }
}
action {
type = "forward"
target_group_arn = aws_lb_target_group.tg.arn
}
}