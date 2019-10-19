resource "aws_launch_template" "pratyushLT" {
  name   = "pratyushLT"
  image_id      = "ami-04b9e92b5572fa0d1"
  instance_type = "t2.micro"
  key_name      = "pat-key"
  vpc_security_group_ids = [var.security_group_id]
}

resource "aws_autoscaling_group" "pratyushASG" {
  name                 = "pratyushASG"
  desired_capacity     = 1
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = var.aws_subnet_public
  target_group_arns    = [var.tg_arn]
  termination_policies = ["OldestInstance"]

  launch_template {
    id      = aws_launch_template.pratyushLT.id
    version = "$Latest"
  }
}

