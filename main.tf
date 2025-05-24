resource "aws_db_subnet_group" "main" {
  name       = "fiap-tc03-subnet"
  subnet_ids = terraform_remote_state.k8s.outputs.subnet_ids
  
  tags = {
    Name = "RdsSubnetGroup"
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage       = 20
  db_name                 = "fastfood_10soat_g22_tc3"
  engine                  = "postgres"
  engine_version          = "17.5"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [data.terraform_remote_state.k8s.outputs.sg_id]
  publicly_accessible     = true
  skip_final_snapshot     = true
  identifier              = "fastfood_10soat_g22_tc3"
  backup_retention_period = 7  
  multi_az                = false
  storage_type            = "gp3"
  apply_immediately       = true

  tags = {
    Name = "PostgresInstance"
  }
}
