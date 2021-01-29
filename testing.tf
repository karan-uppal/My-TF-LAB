resource "aws_security_group" "sg_lab"{

name = "devops_lab_sg"
ingress {
from_port = 8080
to_port = 8080
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
}
