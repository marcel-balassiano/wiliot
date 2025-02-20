resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = [
    aws_subnet.subnet_public_us_east_2a_marcel_01.id,
    aws_subnet.subnet_public_us_east_2b_marcel_01.id
  ]

  tags = {
    Name = "RDS Subnet Group"
  }
}
