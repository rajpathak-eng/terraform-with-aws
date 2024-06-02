resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main.id
  service_name = var.vpc_endpoint_service_name
  route_table_ids = [
    aws_route_table.private.id
  ]
}
