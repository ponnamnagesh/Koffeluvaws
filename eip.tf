resource "aws_eip" "nat1" {
  vpc                       = true
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "10.0.0.10"
}

resource "aws_eip" "nat2" {
  vpc                       = true
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "10.0.0.11"
}

resource "aws_eip" "two" {
  vpc                       = true
  network_interface         = aws_network_interface.multi-ip.id
  associate_with_private_ip = "10.0.0.11"
}
