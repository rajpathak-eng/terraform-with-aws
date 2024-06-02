  variable "family_worker" {
    description = "Family of the ECS Task Definition"
    default = "prod_worker_task"
  }

  variable "network_mode_worker" {
    description = "Network mode of the ECS Task Definition"
    default = "bridge"
  }

  variable "cpu_worker" {
    description = "CPU value of the ECS Task Definition"
    default = "250"
  }

  variable "memory_worker" {
    description = "Memory value of the ECS Task Definition"
    default = "500"
  }

  variable "execution_role_arn_worker" {
    description = "ARN of the IAM Role that allows AWS ECS to make calls to other AWS services"
    default = "arn:aws:iam::740960784154:role/ecsTaskExecutionRole"
  }

  variable "image_worker" {
    description = "Docker image to use for the container definition"
    default = "740960784154.dkr.ecr.us-east-1.amazonaws.com/lynk-api:v0.1.4"
  }

  variable "environment_worker" {
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
