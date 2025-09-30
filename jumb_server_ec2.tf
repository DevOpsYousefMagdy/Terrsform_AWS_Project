resource "aws_instance" "jump" {
  ami           = "ami-0c02fb55956c7d316" # Ubuntu AMI Example
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_az1.id
  security_groups = [aws_security_group.jump_sg.id]

  tags = {
    Name = "jump-server"
  }
}

