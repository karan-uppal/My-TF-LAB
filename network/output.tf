output "vpc_id" {
    value = aws_vpc.myvpc.id
}

output "Psub_id" {
    value = aws_subnet.pub-az[*].id
}

output "PRsub_id" {
    value = aws_subnet.pri-az[*].id
}

output "lb_sg_id" {
    value = aws_security_group.alb.id
}

output "ec2_sg_id" {
    value = aws_security_group.instance.id
}

output "db_sg_id" {
    value = aws_security_group.db.id
}