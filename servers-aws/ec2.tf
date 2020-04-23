resource "aws_instance" "server" {
  count                       = var.servers
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.ami_key_pair_name
  vpc_security_group_ids      = [aws_security_group.desafio-sg.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.desafio-subnet.id
  user_data                   = data.template_file.script.rendered

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
  }
}

data "template_file" "script" {
  template = file("script.sh")
}


