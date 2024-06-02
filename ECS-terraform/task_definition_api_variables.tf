variable "family" {
  description = "Family of the ECS Task Definition"
  default = "prod_task"
}

variable "network_mode" {
  description = "Network mode of the ECS Task Definition"
  default = "host"
}

variable "cpu" {
  description = "CPU value of the ECS Task Definition"
  default = "250"
}

variable "memory" {
  description = "Memory value of the ECS Task Definition"
  default = "500"
}

variable "execution_role_arn" {
  description = "ARN of the IAM Role that allows AWS ECS to make calls to other AWS services"
  default = "arn:aws:iam::740960784154:role/ecsTaskExecutionRole"
}

variable "image" {
  description = "Docker image to use for the container definition"
  default = "740960784154.dkr.ecr.us-east-1.amazonaws.com/lynk-api:v0.1.4"
}

variable "environment" {
  description = "Environment variables for the container definition"
  type = map(string)
  default = {
    "ALLOWED_ORIGINS"  = "https://app.interlynk.io,https://api.interlynk.io,https://hopsotch.io,http://app.interlynk.io,http://api.interlynk.io",
    "RAILS_ENV"        = "production",
    "POSTGRES_USERNAME" = "lynk_api",
    "POSTGRES_PASSWORD" = "lynk_api1234!",
    "POSTGRES_PORT"    = "5432",
    "RAILS_MASTER_KEY" = "c179e08be63231575184e4dfd6112611",
  }
}

variable "container_port" {
  description = "Port on the container to associate with the load balancer"
  default = 3000
}

variable "host_port" {
  description = "Port on the host to associate with the container"
  default = 3000
}

variable "protocol" {
  description = "The protocol for connections from clients to the load balancer"
  default = "tcp"
}

variable "health_check" {
  description = "A health check block that contains command, interval, timeout and retries fields"
  type = object({
    command = list(string)
    interval = number
    timeout = number
    retries = number
  })
  default = {
    command = ["CMD-SHELL","curl -f http://localhost:3000/healthz || exit 1"],
    interval = 30,
    timeout = 5,
    retries = 3
  }
}
