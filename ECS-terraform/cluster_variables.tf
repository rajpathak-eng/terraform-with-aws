
variable "iam_role_name" {
  description = "Name of the IAM role to associate with the instance profile"
  default     = "ecsInstanceRole"
}


variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  default     = "prod_cluster"
}

variable "ecs_worker_cluster_name" {
  description = "The name of the ECS worker cluster"
  default     = "prod_worker_cluster"
}

variable "launch_configuration_name" {
  description = "The name of the launch configuration"
  default     = "prod_lc"
}

variable "worker_launch_configuration_name" {
  description = "The name of the worker launch configuration"
  default     = "prod_worker_lc"
}

variable "instance_type" {
  description = "The type of instance to start"
  default     = "t2.micro"
}

variable "iam_instance_profile_name" {
  description = "The name of the IAM instance profile to associate with launched instances"
  default     = "ecs_profile"
}

variable "autoscaling_group_name" {
  description = "The name of the Auto Scaling group"
  default     = "prod_asg"
}

variable "worker_autoscaling_group_name" {
  description = "The name of the worker Auto Scaling group"
  default     = "prod_worker_asg"
}

variable "asg_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
  type        = map(string)
  default = {
    desired = 1
    max     = 1
    min     = 1
  }
}

variable "worker_asg_capacity" {
  description = "The number of Amazon EC2 worker instances that should be running in the group"
  type        = map(string)
  default = {
    desired = 2
    max     = 2
    min     = 2
  }
}
