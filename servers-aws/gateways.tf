resource "aws_internet_gateway" "desafio-gw" {
  vpc_id = aws_vpc.desafio-network-env.id

  tags = {
    Name = "desafio-gw"
  }
}
