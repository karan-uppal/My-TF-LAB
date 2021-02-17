resource "aws_security_group" "alb" {
name = "${var.env_name}-terraform-sg-alb"
vpc_id = aws_vpc.myvpc.id
# Allow inbound HTTP requests
ingress {
from_port = var.server_port
to_port = var.server_port
protocol = "tcp"
cidr_blocks = [var.open_cidr]
}
ingress {
from_port = var.ssh_port
to_port = var.ssh_port
protocol = "tcp"
cidr_blocks = [var.open_cidr]
}
# Allow all outbound requests
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = [var.open_cidr]
}
}


resource "aws_security_group" "instance" {
    vpc_id = aws_vpc.myvpc.id
name = "${var.env_name}-terraform-instance"
ingress {
from_port = var.server_port
to_port = var.server_port
protocol = "tcp"
security_groups = [aws_security_group.alb.id]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = [var.open_cidr]
}
}

resource "aws_security_group" "db" {
    vpc_id = aws_vpc.myvpc.id
name = "${var.env_name}-terraform-sg-db"
ingress {
from_port = var.db_port
to_port = var.db_port
protocol = "tcp"
security_groups = [aws_security_group.instance.id]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = [var.open_cidr]
}
}
