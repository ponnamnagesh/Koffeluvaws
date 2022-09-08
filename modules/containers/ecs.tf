
data "aws_ami" "ecs_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_launch_configuration" "ecs-launch-configuration" {
    name = "ecs-launch-configuration"
    // image_id = "ami-07a63940735aebd38"
    image_id = data.aws_ami.ecs_ami.id
    instance_type = "t2.micro"
    iam_instance_profile = var.ecsInstanceProfileId

    root_block_device {
        volume_type = "gp2"
        volume_size = 50
        delete_on_termination = true
    }

    lifecycle {
        create_before_destroy = true
    }

    associate_public_ip_address = "false"
    key_name = var.myLabKeyPair

    user_data = <<-EOF
        #!/bin/bash
        echo ECS_CLUSTER=Koffee-Luv-Cluster >> /etc/ecs/ecs.config;
        echo ECS_BACKEND_HOST= >> /etc/ecs/ecs.config;
        EOF
    
    security_groups = [var.EcsSG]
}


resource "aws_autoscaling_group" "ecs-autoscaling-group" {
    name = "ecs-autoscaling-group"
    max_size = "3"
    min_size = "1"
    desired_capacity = "1"

    vpc_zone_identifier = [var.appA, var.appB, var.appC]
    launch_configuration = aws_launch_configuration.ecs-launch-configuration.name
    health_check_type = "ELB"

    tag {
        key = "Name"
        value = "Koffee-Luv-ECS"
        propagate_at_launch = true
    }
}

resource "aws_ecs_cluster" "Koffee-Luv-Cluster" {
    name = "Koffee-Luv-Cluster"
}
