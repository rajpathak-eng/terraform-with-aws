resource "aws_ecs_service" "prod_service" {
  name            = var.ecs_service_name["prod"]
  cluster         = aws_ecs_cluster.prod_cluster.id
  task_definition = aws_ecs_task_definition.prod_task.arn
  desired_count   = var.ecs_service_desired_count["prod"]
  launch_type     = "EC2"
}

resource "aws_ecs_service" "prod_worker_service" {
  name            = var.ecs_service_name["prod_worker"]
  cluster         = aws_ecs_cluster.prod_worker_cluster.id
  task_definition = aws_ecs_task_definition.prod_worker_task.arn
  desired_count   = var.ecs_service_desired_count["prod_worker"]
  launch_type     = "EC2"
}
