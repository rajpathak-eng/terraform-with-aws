resource "aws_ecs_task_definition" "prod_task" {
  family = var.family
  network_mode = var.network_mode
  cpu    = var.cpu
  memory = var.memory
  execution_role_arn = var.execution_role_arn
  requires_compatibilities = ["EC2"]
  container_definitions = jsonencode([{
    name = "test",
    image = var.image,
    cpu = tonumber(var.cpu),
    memory = tonumber(var.memory),
    essential = true,
    environment = [
      {
        name = "ALLOWED_ORIGINS",
        value = var.environment["ALLOWED_ORIGINS"]
      },
      {
        name = "RAILS_ENV",
        value = var.environment["RAILS_ENV"]
      },
      {
        name = "POSTGRES_USERNAME",
        value = var.environment["POSTGRES_USERNAME"]
      },
      {
        name = "POSTGRES_HOST",
        value = aws_db_instance.main.endpoint
      },
      {
        name = "POSTGRES_PASSWORD",
        value = var.environment["POSTGRES_PASSWORD"]
      },
      {
        name = "POSTGRES_PORT",
        value = var.environment["POSTGRES_PORT"]
      },
      {
        name = "RAILS_MASTER_KEY",
        value = var.environment["RAILS_MASTER_KEY"]
      },
      {
        name = "REDIS_URL",
        value = "redis://${aws_elasticache_replication_group.example.primary_endpoint_address}:6379/1"
      },
    ],
    portMappings = [{
      containerPort = var.container_port,
      hostPort      = var.host_port,
      protocol      = var.protocol
    }],
    healthCheck = {
      command  = var.health_check.command,
      interval = var.health_check.interval,
      timeout  = var.health_check.timeout,
      retries  = var.health_check.retries,
    },
    mountPoints = [
      {
        sourceVolume = "docke-sock",
        containerPath = "/var/run/docker.sock",
        readOnly = false,
      },
    ],
  }])

  volume {
    name = "docke-sock"
    host_path = "/var/run/docker.sock"
  }
}
