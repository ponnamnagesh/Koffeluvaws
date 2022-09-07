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
