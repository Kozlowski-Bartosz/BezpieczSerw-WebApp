resource "aws_eip" "lb" {
  instance                  = aws_instance.bastion.id
  vpc                       = true
  associate_with_private_ip = aws_instance.bastion.private_ip
}
