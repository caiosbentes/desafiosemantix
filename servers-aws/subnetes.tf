resource "aws_subnet" "desafio-subnet" {
  vpc_id     = aws_vpc.desafio-network-env.id
  cidr_block = cidrsubnet(aws_vpc.desafio-network-env.cidr_block, 3, 1)

  tags = {
    Name = "desafio-subnet"
  }
}
resource "aws_route_table" "desafio-route-table" {
  vpc_id = aws_vpc.desafio-network-env.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.desafio-gw.id
  }
  tags = {
    Name = "main"
  }
}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = aws_subnet.desafio-subnet.id
  route_table_id = aws_route_table.desafio-route-table.id
}
