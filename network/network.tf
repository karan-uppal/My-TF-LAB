resource "aws_vpc" "myvpc" {
  cidr_block  = var.vpc_cidr
  tags = {
    Name = "${var.env_name}-tf-vpc"
  }
}

resource "aws_subnet" "pub-az" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = element(var.sub-pub-cidr, count.index)
  map_public_ip_on_launch = true
  availability_zone = element(var.azs, count.index)
  count = length(var.sub-pub-cidr)
  tags = {
    Name = "${var.env_name}-pub-az${count.index+1}"
  }
}

resource "aws_subnet" "pri-az" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = element(var.sub-pri-cidr, count.index)
  availability_zone = element(var.azs, count.index)
  count = length(var.sub-pri-cidr)
  tags = {
    Name = "${var.env_name}-pri-az${count.index+1}"
  }
}


resource "aws_internet_gateway" "tf-igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "${var.env_name}-tf-igw"
  }
}

resource "aws_route_table" "tf-pub-rt" {
  vpc_id = aws_vpc.myvpc.id

  route {

    cidr_block = var.open_cidr
    gateway_id = aws_internet_gateway.tf-igw.id
  }

  tags = {
    Name = "${var.env_name}-tf-pub-rt"
  }
}


resource "aws_route_table_association" "pu" {
  subnet_id =  element(tolist(aws_subnet.pub-az[*].id), count.index)
  route_table_id = aws_route_table.tf-pub-rt.id
  count = length(var.sub-pub-cidr)
}

resource "aws_route_table_association" "pr" {
  subnet_id =  element(tolist(aws_subnet.pri-az[*].id), count.index)
  route_table_id = data.aws_route_table.main-rt.id
  count = length(var.sub-pri-cidr)
}



