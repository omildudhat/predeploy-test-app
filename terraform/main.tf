resource "aws_security_group" "database" {
  name = "database-sg"

  ingress {
    description = "Public PostgreSQL access"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "payments" {
  identifier          = "payments-db"
  engine              = "postgres"
  publicly_accessible = true
  storage_encrypted   = true
  deletion_protection = false
}
