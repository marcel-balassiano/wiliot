resource "aws_vpc" "vpc_us_east_2_marcel_01" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-us-east-2-marcel-01"
  }
}
