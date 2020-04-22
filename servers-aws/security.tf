resource "aws_security_group" "desafio-sg" {
  name        = "desafio-sg"
  description = "desafio-sg"
  vpc_id      = aws_vpc.desafio-network-env.id

  ingress {
    description = "Acesso via ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "desafio-sg"
  }
}
