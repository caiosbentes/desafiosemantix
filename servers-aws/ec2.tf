resource "aws_instance" "server" {
  count                  = var.servers
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.ami_key_pair_name
  vpc_security_group_ids = [aws_security_group.desafio-sg.id]

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
  }
subnet_id = aws_subnet.desafio-subnet.id
}
