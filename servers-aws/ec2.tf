resource "aws_instance" "server" {
  count         = var.servers
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = ["${aws_security_group.web-node.name}"]

  tags = {
    Name        = var.name
    Environment = var.env
    Provisioner = "Terraform"
  }
}
