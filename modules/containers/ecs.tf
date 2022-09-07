resource "aws_ecs_cluster" "aws-ecs-cluster" {
  name = "${var.app_name}-${var.app_environment}-cluster"
  tags = {
    Name        = "${var.app_name}-ecs"
    Environment = var.app_environment
  }
}
//resource "aws_ecs_cluster" "Koffee-Luv-Cluster" {
   // name = "Koffee-Luv-Cluster"
//}

resource "aws_cloudwatch_log_group" "log-group" {
  name = "${var.app_name}-${var.app_environment}-logs"

  tags = {
    Application = var.app_name
    Environment = var.app_environment
  }
}

// Choose latest Amazon2 Linux AMI for x86_64 

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
    key_name = var.key_name

    user_data = <<-EOF
        #!/bin/bash
        echo ECS_CLUSTER=Koffee-Luv-Cluster >> /etc/ecs/ecs.config;
        echo ECS_BACKEND_HOST= >> /etc/ecs/ecs.config;
        EOF
    
    security_groups = [var.EcsSG]
}

resource "aws_security_group" "EcsSG" {
    name        = "EcsSG"
    description = "Allow ssh"
    vpc_id = module.network.vpc_id
    
    tags = {
        Name = "EcsSG"
    }

    ingress {
        from_port   = "22"
        to_port     = "22"
        protocol    = "TCP"
        security_groups = [aws_security_group.BastionSG.id]
    }
}