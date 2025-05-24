resource "aws_db_subnet_group" "main" {
  name       = "main-subnet-group"
  subnet_ids = [
    data.terraform_remote_state.vpc.outputs.public_subnet_a_id,
    data.terraform_remote_state.vpc.outputs.public_subnet_b_id
  ]

  tags = {
    Name = "MainSubnetGroup"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow PostgreSQL access"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "postgres" {
  allocated_storage       = 20
  db_name                 = "mydatabase"
  engine                  = "postgres"
  engine_version          = "17.5"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  publicly_accessible     = true
  skip_final_snapshot     = true
  identifier              = "fiap-tc03"

  tags = {
    Name = "PostgresInstance"
  }
}
