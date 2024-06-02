resource "aws_eip" "for_nat_gw" {
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.for_nat_gw.id
  subnet_id     = aws_subnet.private1.id
}
