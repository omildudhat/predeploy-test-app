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
