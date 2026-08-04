terraform {
  required_version = ">= 1.5.0"
}

resource "aws_security_group" "payments" {
  name        = "payments-service"
  description = "Security group for payments service"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }
}

resource "aws_security_group" "database" {
  name        = "database-sg"
  description = "Private database access"

  ingress {
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
