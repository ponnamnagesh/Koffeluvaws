// Choose latest Amazon2 Linux AMI for x86_64 

data "aws_ami" "amaz_linux" {
  most_recent      = true
  owners           = ["amazon"]

filter {
    name   = "name"
    values = ["*amzn2-*"]
  }
  

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}