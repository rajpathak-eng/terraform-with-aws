resource "aws_ecs_task_definition" "prod_worker_task" {
  family = var.family_worker
  network_mode = var.network_mode_worker
  cpu    = var.cpu_worker
  memory = var.memory_worker
  execution_role_arn = var.execution_role_arn_worker
  requires_compatibilities = ["EC2"]
  container_definitions = jsonencode([{
    name = "test",
    image = var.image_worker,
    cpu = tonumber(var.cpu),
    memory = tonumber(var.memory),
    essential = true,
    environment = [
      {
        name = "ALLOWED_ORIGINS",
        value = var.environment_worker["ALLOWED_ORIGINS"]
      },
      {
        name = "RAILS_ENV",
        value = var.environment_worker["RAILS_ENV"]
      },
      {
        name = "POSTGRES_USERNAME",
        value = var.environment_worker["POSTGRES_USERNAME"]
      },
      {
        name = "POSTGRES_HOST",
        value = aws_db_instance.main.endpoint
      },
      {
        name = "POSTGRES_PASSWORD",
        value = var.environment_worker["POSTGRES_PASSWORD"]
      },
      {
        name = "POSTGRES_PORT",
        value = var.environment_worker["POSTGRES_PORT"]
      },
      {
        name = "RAILS_MASTER_KEY",
        value = var.environment_worker["RAILS_MASTER_KEY"]
      },
      {
        name = "REDIS_URL",
        value = "redis://${aws_elasticache_replication_group.example.primary_endpoint_address}:6379/1"
      },
    ],

    mountPoints = [
      {
        sourceVolume = "docker-sock",
        containerPath = "/var/run/docker.sock",
        readOnly = false,
      },
      {
        sourceVolume = "tmp",
        containerPath = "/tmp",
        readOnly = false,
      }
    ],
  }])

  volume {
    name = "docker-sock"
    host_path = "/var/run/docker.sock"
  }

  volume {
    name = "tmp"
    host_path = "/tmp"
  }
}
