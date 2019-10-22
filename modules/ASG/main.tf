resource "aws_launch_template" "pratyushLT" {
  name                    = "pratyushLT"
  image_id                = "ami-0f846c06eb372f19a"
  instance_type           = "t2.micro"
  key_name                = "pat-key"
  vpc_security_group_ids  = [var.security_group_id]
  iam_instance_profile    = var.ecs-instance-profile-name
  #iam_instance_profile    = var.ecs-instance-profile-name
  user_data               = file("${path.module}/userdata.sh")
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

# resource "template_file" "ecs-launch-configuration-user-data" {
#     template = file("${path.module}/userdata.sh")
# }