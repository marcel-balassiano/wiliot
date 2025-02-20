resource "aws_subnet" "subnet_public_us_east_2a_marcel_01" {
  vpc_id     = aws_vpc.vpc_us_east_2_marcel_01.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "subnet-public-us-east-2-marcel-01"
  }
}


resource "aws_subnet" "subnet_public_us_east_2b_marcel_01" {
  vpc_id     = aws_vpc.vpc_us_east_2_marcel_01.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2b"
  tags = {
    Name = "subnet-public-us-east-2b-marcel-01"
  }
}



resource "aws_subnet" "subnet_private_us_east_2a_marcel_01" {
  vpc_id     = aws_vpc.vpc_us_east_2_marcel_01.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "subnet-private-us-east-2a-marcel-01"
  }
}

resource "aws_subnet" "subnet_private_us_east_2b_marcel_01" {
  vpc_id     = aws_vpc.vpc_us_east_2_marcel_01.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "subnet-private-us-east-2b-marcel-01"
  }
}

