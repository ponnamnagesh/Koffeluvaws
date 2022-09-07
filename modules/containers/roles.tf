data "aws_iam_policy_document" "ec2_assume_role_policy" {
    statement {
        actions = ["sts:AssumeRole"]
        principals {
            type = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }
    }
}

resource "aws_iam_role" "ecsInstanceRole" {
    name = "ecsInstanceRole"
    path = "/"
    assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs-instance-role-attachment" {
    role = aws_iam_role.ecsInstanceRole.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecsInstanceProfile" {
    name = "ecsInstanceProfile"
    path = "/"
    role = aws_iam_role.ecsInstanceRole.id
}