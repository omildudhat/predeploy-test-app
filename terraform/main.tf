terraform {
  required_version = ">= 1.5.0"
}

# Preserve the existing resource address so PreDeploy does not treat it as removed.
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

# Safe baseline for the later public-ingress test.
resource "aws_security_group" "database" {
  name        = "database-sg"
  description = "Private database access"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Safe baseline for later public-access and deletion-protection tests.
resource "aws_db_instance" "payments" {
  identifier          = "payments-db"
  engine              = "postgres"
  publicly_accessible = true
  storage_encrypted   = true
  deletion_protection = false
}

# Safe baseline for the later resource-removal test.

# Phase 6A live webhook acceptance

# webhook race test one
