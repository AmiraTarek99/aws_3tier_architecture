resource "aws_db_subnet_group" "db-subg" {
  name       = "db-subg"
  subnet_ids = [var.private_subnet[2]]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "mysql_db" {
  allocated_storage    = 20
  db_name              = "mysqldb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "amira"
  password             = var.DB_pass
  parameter_group_name = "default.mysql8.0"
  multi_az                  = false
  vpc_security_group_ids    = [var.db_security_group_ids]
  db_subnet_group_name      = aws_db_subnet_group.db-subg.name
  skip_final_snapshot  = true
}