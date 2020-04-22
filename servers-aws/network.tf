resource "aws_vpc" "desafio-network-env" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}
resource "aws_eip" "ip-test-env" {
  count = var.servers
  instance = element(aws_instance.server.*.id, count.index)
  vpc = true
}
