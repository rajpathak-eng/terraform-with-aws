resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Allow inbound traffic for RDS PostgreSQL"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    security_groups = [aws_security_group.all_sg.id] // This needs to be updated to your actual ECS security group ID
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]

  tags = {
    Name = "main"
  }
}

data "aws_kms_key" "aes" {
  key_id = "alias/aws/rds"
}

resource "aws_db_instance" "main" {
  allocated_storage        = var.allocated_storage
  engine                   = "postgres"
  engine_version           = var.engine_version
  instance_class           = var.instance_class
  identifier               = var.db_identifier
  username                 = var.db_username
  password                 = var.db_password
  db_subnet_group_name     = aws_db_subnet_group.main.name
  kms_key_id               = data.aws_kms_key.aes.arn
  storage_encrypted        = true
  skip_final_snapshot      = true
  backup_retention_period  = var.backup_retention_period
  auto_minor_version_upgrade = false
  copy_tags_to_snapshot    = true
  deletion_protection      = false
  vpc_security_group_ids   = [aws_security_group.db_sg.id]
  storage_type             = "gp2"
  backup_window            = var.backup_window
}
