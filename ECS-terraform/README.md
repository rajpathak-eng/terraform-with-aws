#Terraform AWS ECS Infrastructure
This repository contains Terraform scripts for provisioning a fully functional AWS ECS infrastructure, including an ECS cluster, service, and task definition, RDS, Redis, security group, subnets and route tables.

## Usage

1. Clone the repository:

```bash
git clone git@github.com:interlynk-io/docker-docs.git
```

2. Go to the project's directory:

```bash
cd terraform
```

3. Initialize Terraform:

```bash
terraform init
```

4. Create a plan:

```bash
terraform plan 
```

5. Apply the plan:

```bash
terraform apply 
```
PLease make sure to change the values in the cluster_variables.tf, task_definition_api_variables.tf, task_definition_worker_variables.tf and service_variables.tf and redis_variables and rds_variables.tf

# vpc_variables.tf

This module provides configurable Terraform variables for defining a Virtual Private Cloud (VPC) on AWS. The variables include settings for the AWS region and the VPC CIDR block.

## Module Variables

- `aws_region`: The AWS region where the VPC will be created. Default is `us-east-1`.

- `vpc_cidr`: The CIDR block for the VPC. Default is `10.0.0.0/16`.

# subnet_variables.tf

This module provides configurable Terraform variables for defining public and private subnets within a Virtual Private Cloud (VPC) on AWS. The variables include settings for the CIDR blocks and the associated availability zones.

## Module Variables

- `public_subnet_1_cidr` and `public_subnet_2_cidr`: The CIDR blocks for the first and second public subnets respectively. Defaults are `10.0.1.0/24` and `10.0.2.0/24`.

- `public_subnet_1_az` and `public_subnet_2_az`: The availability zones for the first and second public subnets respectively. Defaults are `us-east-1a` and `us-east-1b`.

- `private_subnet_1_cidr` and `private_subnet_2_cidr`: The CIDR blocks for the first and second private subnets respectively. Defaults are `10.0.3.0/24` and `10.0.4.0/24`.

- `private_subnet_1_az` and `private_subnet_2_az`: The availability zones for the first and second private subnets respectively. Defaults are `us-east-1a` and `us-east-1b`.

# cluster_variables.tf

This module provides configurable Terraform variables for deploying an Amazon ECS cluster along with its associated components such as IAM roles, instance profiles, launch configurations, Auto Scaling groups, and ECS worker instances.

## Module Variables

### IAM Role

- `iam_role_name`: Name of the IAM role to associate with the instance profile. Default is `ecsInstanceRole`.

### ECS Clusters

- `ecs_cluster_name`: The name of the ECS cluster. Default is `prod_cluster`.

- `ecs_worker_cluster_name`: The name of the ECS worker cluster. Default is `prod_worker_cluster`.

### Launch Configurations

- `launch_configuration_name`: The name of the launch configuration. Default is `prod_lc`.

- `worker_launch_configuration_name`: The name of the worker launch configuration. Default is `prod_worker_lc`.

### Instance Type

- `instance_type`: The type of instance to start. Default is `t2.micro`.

### IAM Instance Profile

- `iam_instance_profile_name`: The name of the IAM instance profile to associate with launched instances. Default is `ecs_profile`.

### Auto Scaling Groups

- `autoscaling_group_name`: The name of the Auto Scaling group. Default is `prod_asg`.

- `worker_autoscaling_group_name`: The name of the worker Auto Scaling group. Default is `prod_worker_asg`.

### ASG Capacity

- `asg_capacity`: The number of Amazon EC2 instances that should be running in the group. It is a map with keys `desired`, `max`, and `min`, all default to `1`.

- `worker_asg_capacity`: The number of Amazon EC2 worker instances that should be running in the group. It is a map with keys `desired`, `max`, and `min`, all default to `2`.



# task_definition_api_variables.tf

This module provides configurable Terraform variables for defining an ECS API task definition. The tasks defined by this module will include details such as task family, network mode, CPU and memory allocation, execution role, Docker image to use, environment variables, and other necessary settings.

## Module Variables

- `family`: Family of the ECS Task Definition. Default is `prod_task`.

- `network_mode`: Network mode of the ECS Task Definition. Default is `host`.

- `cpu`: CPU value of the ECS Task Definition. Default is `250`. # change it to 4096 if you are using instance type t2.xlarge

- `memory`: Memory value of the ECS Task Definition. Default is `500`. #  change it to 15360 if you are using instance type t2.xlarge

- `execution_role_arn`: ARN of the IAM Role that allows AWS ECS to make calls to other AWS services. Default is `arn:aws:iam::740960784154:role/ecsTaskExecutionRole`.

- `image`: Docker image to use for the container definition. Default is `740960784154.dkr.ecr.us-east-1.amazonaws.com/lynk-api:v0.1.4`.

- `environment`: Environment variables for the container definition. Default is a map with keys `ALLOWED_ORIGINS`, `RAILS_ENV`, `POSTGRES_USERNAME`, `POSTGRES_PASSWORD`, `POSTGRES_PORT`, and `RAILS_MASTER_KEY`.

- `container_port`: Port on the container to associate with the load balancer. Default is `3000`.

- `host_port`: Port on the host to associate with the container. Default is `3000`.

- `protocol`: The protocol for connections from clients to the load balancer. Default is `tcp`.

- `health_check`: A health check block that contains command, interval, timeout and retries fields. Default is an object with fields `command`, `interval`, `timeout`, and `retries`.

# task_definition_worker_variables.tf

This module provides configurable Terraform variables for defining an ECS worker task definition. The tasks defined by this module include details such as task family, network mode, CPU and memory allocation, execution role, Docker image to use, environment variables, and other necessary settings.

## Module Variables

- `family_worker`: Family of the ECS Worker Task Definition. Default is `prod_worker_task`.

- `network_mode_worker`: Network mode of the ECS Worker Task Definition. Default is `bridge`.

- `cpu_worker`: CPU value of the ECS Worker Task Definition. Default is `250`. # change it to 4096 if you are using instance type t2.xlarge

- `memory_worker`: Memory value of the ECS Worker Task Definition. Default is `500`. #  change it to 15360 if you are using instance type t2.xlarge

- `execution_role_arn_worker`: ARN of the IAM Role that allows AWS ECS to make calls to other AWS services. Default is `arn:aws:iam::740960784154:role/ecsTaskExecutionRole`.

- `image_worker`: Docker image to use for the container definition. Default is `740960784154.dkr.ecr.us-east-1.amazonaws.com/lynk-api:v0.1.4`.

- `environment_worker`: Environment variables for the container definition. Default is a map with keys `ALLOWED_ORIGINS`, `RAILS_ENV`, `POSTGRES_USERNAME`, `POSTGRES_PASSWORD`, `POSTGRES_PORT`, and `RAILS_MASTER_KEY`.

# service_variables.tf

This module provides configurable Terraform variables for defining an ECS service. It includes the details for both the primary and worker services, such as service name and desired service count.

## Module Variables

- `ecs_service_name`: Name of the ECS service. It's a map that contains names for the production and worker services. The default production service name is `prod_service`, and the default worker service name is `prod_worker_service`.

- `ecs_service_desired_count`: Desired count of services for the ECS cluster. It's a map that contains desired service counts for the production and worker services. The default desired count for the production service is `1`, and for the worker service it is `2`.

# rds_variables.tf

This module provides configurable Terraform variables for defining an Amazon RDS database instance. The variables include settings for storage allocation, engine version, instance class, database identifier, username and password, and backup retention policies.

## Module Variables

- `allocated_storage`: The amount of storage to allocate to the DB instance. Default is `10`.

- `engine_version`: The version of the Postgres engine to use. Default is `14.7`.

- `instance_class`: The instance class to use for the DB instance. Default is `db.t3.small`.

- `db_identifier`: The identifier for the DB instance. Default is `mydb`.

- `db_username`: The username for the DB instance. Default is `lynk_api`.

- `db_password`: The password for the DB instance. Default is `lynk_api1234!`.

- `backup_retention_period`: The number of days for which automated backups are retained. Default is `1`.

- `backup_window`: The preferred backup window. Default is `06:00-06:30`.

# redisr_variables.tf

This module provides configurable Terraform variables for defining a Redis cache cluster. The variables include settings for node type, number of cache clusters, engine version, and the port number for accepting connections.

## Module Variables

- `redis_node_type`: The compute and memory capacity of the nodes in the node group. Default is `cache.t2.small`.

- `redis_num_cache_clusters`: The number of cache clusters (primary and replicas) this replication group will have. Default is `2`.

- `redis_engine_version`: The version of the Redis engine to use. Default is `7.0`.

- `redis_port`: The port number on which each of the cache nodes will accept connections. Default is `6379`.
