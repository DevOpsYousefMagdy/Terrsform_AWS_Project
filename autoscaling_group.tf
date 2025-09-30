resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-"
  image_id      = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  network_interfaces {
    security_groups = [aws_security_group.web_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Role = "web"
    }
  }
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.private_az1.id, aws_subnet.private_az2.id]
  launch_template {
    id      = aws_launch_template.web_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_tg.arn]
}

