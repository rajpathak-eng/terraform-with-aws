output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_1_id" {
  description = "The ID of the first public subnet"
  value       = aws_subnet.public_subnet_1.id
}

output "public_subnet_2_id" {
  description = "The ID of the second public subnet"
  value       = aws_subnet.public_subnet_2.id
}

output "private_subnet_1_id" {
  description = "The ID of the first private subnet"
  value       = aws_subnet.private1.id
}

output "private_subnet_2_id" {
  description = "The ID of the second private subnet"
  value       = aws_subnet.private2.id
}


output "internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.gw.id
}

output "eip_id" {
  description = "The ID of the elastic IP"
  value       = aws_eip.for_nat_gw.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT gateway"
  value       = aws_nat_gateway.nat.id
}

output "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint"
  value       = aws_vpc_endpoint.s3.id
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.all_sg.id
}


output "ecs_cluster_arn" {
  description = "The ARN of the ECS cluster"
  value       = aws_ecs_cluster.prod_cluster.arn
}

output "ecs_worker_cluster_arn" {
  description = "The ARN of the ECS worker cluster"
  value       = aws_ecs_cluster.prod_worker_cluster.arn
}

output "autoscaling_group_id" {
  description = "The ID of the Auto Scaling group"
  value       = aws_autoscaling_group.prod_asg.id
}

output "worker_autoscaling_group_id" {
  description = "The ID of the worker Auto Scaling group"
  value       = aws_autoscaling_group.prod_worker_asg.id
}

output "ecs_service_name" {
  description = "Name of the ECS services"
  value = var.ecs_service_name
}

output "lb_arn" {
  description = "The ARN of the load balancer"
  value = aws_lb.lb.arn
}

output "lb_dns_name" {
  description = "The DNS name of the load balancer"
  value = aws_lb.lb.dns_name
}

output "redis_replication_group_description" {
  description = "The description of the Redis replication group"
  value       = aws_elasticache_replication_group.example.description
}

output "redis_endpoint" {
  description = "The endpoint of the Redis replication group"
  value       = aws_elasticache_replication_group.example.primary_endpoint_address
}

output "redis_port" {
  description = "The port of the Redis replication group"
  value       = aws_elasticache_replication_group.example.port
}

output "db_instance_endpoint" {
  description = "The connection endpoint for the DB instance"
  value       = aws_db_instance.main.endpoint
}

output "db_instance_arn" {
  description = "The ARN of the DB instance"
  value       = aws_db_instance.main.arn
}

output "db_instance_username" {
  description = "The username for the DB instance"
  value       = aws_db_instance.main.username
}


output "db_instance_port" {
  description = "The port for the DB instance"
  value       = aws_db_instance.main.port
}
