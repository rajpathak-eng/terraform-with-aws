data "aws_ami" "ecs" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

data "aws_iam_role" "existing" {
  name = var.iam_role_name
}


resource "aws_ecs_cluster" "prod_cluster" {
  name = var.ecs_cluster_name
}

resource "aws_ecs_cluster" "prod_worker_cluster" {
  name = var.ecs_worker_cluster_name
}

resource "aws_launch_configuration" "prod_lc" {
  name             = var.launch_configuration_name
  image_id         = data.aws_ami.ecs.id
  instance_type    = var.instance_type
  security_groups  = [aws_security_group.all_sg.id]
  iam_instance_profile = var.iam_instance_profile_name
  user_data        = <<-EOF
                      #!/bin/bash
                      echo ECS_CLUSTER=${aws_ecs_cluster.prod_cluster.name} >> /etc/ecs/ecs.config
                      EOF
  key_name          = "bastion-host-key"
}


resource "aws_launch_configuration" "prod_worker_lc" {
  name             = var.worker_launch_configuration_name
  image_id         = data.aws_ami.ecs.id
  instance_type    = var.instance_type
  security_groups  = [aws_security_group.all_sg.id]
  iam_instance_profile = var.iam_instance_profile_name
  user_data        = <<-EOF
                      #!/bin/bash
                      echo ECS_CLUSTER=${aws_ecs_cluster.prod_worker_cluster.name} >> /etc/ecs/ecs.config
                      EOF
  key_name          = "bastion-host-key"
}

resource "aws_autoscaling_group" "prod_asg" {
  desired_capacity   = var.asg_capacity["desired"]
  max_size           = var.asg_capacity["max"]
  min_size           = var.asg_capacity["min"]
  launch_configuration = aws_launch_configuration.prod_lc.id
  vpc_zone_identifier = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  tag {
    key                 = "Name"
    value               = var.autoscaling_group_name
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "prod_worker_asg" {
  desired_capacity   = var.worker_asg_capacity["desired"]
  max_size           = var.worker_asg_capacity["max"]
  min_size           = var.worker_asg_capacity["min"]
  launch_configuration = aws_launch_configuration.prod_worker_lc.id
  vpc_zone_identifier = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

  tag {
    key                 = "Name"
    value               = var.worker_autoscaling_group_name
    propagate_at_launch = true
  }
}

resource "aws_iam_instance_profile" "ecs_profile" {
  name = var.iam_instance_profile_name
  role = data.aws_iam_role.existing.name
}
