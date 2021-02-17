data "aws_route_table" "main-rt" {
  vpc_id = aws_vpc.myvpc.id
  filter {
    name = "association.main"
    values = ["true"]
  }
}

