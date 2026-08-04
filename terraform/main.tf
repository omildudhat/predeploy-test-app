resource "aws_security_group" "database" {
  name = "database-sg"

  ingress {
    description = "Private PostgreSQL access"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
}

resource "aws_db_instance" "payments" {
  identifier          = "payments-db"
  engine              = "postgres"
  publicly_accessible = false
  storage_encrypted   = true
  deletion_protection = true
}

resource "aws_nat_gateway" "primary" {
  allocation_id = "eipalloc-test"
  subnet_id     = "subnet-test"
}
