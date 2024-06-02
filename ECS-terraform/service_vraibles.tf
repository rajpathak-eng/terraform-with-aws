variable "ecs_service_name" {
  description = "Name of the ECS service"
  type = map(string)
  default = {
    prod = "prod_service"
    prod_worker = "prod_worker_service"
  }
}

variable "ecs_service_desired_count" {
  description = "Desired count of services for the ECS cluster"
  type = map(string)
  default = {
    prod = 1
    prod_worker = 2
  }
}
