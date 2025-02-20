resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_us_east_2_marcel_01.id  # Replace with your VPC resource reference
  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_us_east_2_marcel_01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}


resource "aws_route_table_association" "public_subnet_association" {
  count = 2

  subnet_id = element([
    aws_subnet.subnet_public_us_east_2a_marcel_01.id,
    aws_subnet.subnet_public_us_east_2b_marcel_01.id
  ], count.index)

  route_table_id = aws_route_table.public_rt.id
}
