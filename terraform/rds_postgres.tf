resource "aws_db_instance" "postgresql_marcel" {
  identifier             = "postgresql-instance"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "16" # Update to your preferred version
  username               = "pgmaster"
  password               = "TestPostgres!"
  db_name                = "wiliot_db"
  multi_az               = true
  publicly_accessible    = true
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  storage_encrypted      = true

  tags = {
    Environment = "Production"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.postgresql_marcel.endpoint
}
