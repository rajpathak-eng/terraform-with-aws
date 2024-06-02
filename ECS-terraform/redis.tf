resource "aws_elasticache_subnet_group" "main" {
  name       = "redis-sg"
  subnet_ids = [aws_subnet.private1.id, aws_subnet.private2.id]

  description = "Managed by Terraform"
}

resource "aws_elasticache_replication_group" "example" {
  replication_group_id          = "terraform-redis-prod"
  description                   = "Redis replication group for lynk API and worker"
  automatic_failover_enabled    = false
  node_type                     = var.redis_node_type
  num_cache_clusters            = var.redis_num_cache_clusters
  engine                        = "redis"
  engine_version                = var.redis_engine_version
  subnet_group_name             = aws_elasticache_subnet_group.main.name
  security_group_ids            = [aws_security_group.all_sg.id]
  port                          = var.redis_port
}
