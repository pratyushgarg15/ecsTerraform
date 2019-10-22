resource "aws_ecs_cluster" "pratyushECS" {
  name = "pratyushECS"
}

resource "aws_ecs_task_definition" "pratyushNginx" {
  family                = "pratyushNginx"
  container_definitions = file("./task-definitions.json")
}

resource "aws_ecs_service" "Service" {
  name = "pratyushService"
  cluster = aws_ecs_cluster.pratyushECS.id
  task_definition = aws_ecs_task_definition.pratyushNginx.arn

  desired_count = 1

  deployment_maximum_percent = 200
  deployment_minimum_healthy_percent = 100
  iam_role = aws_iam_role.ecs-service-role.name


  	load_balancer {
    	target_group_arn  = var.ecs-target-group-arn
    	container_port    = 80
    	container_name    = "nginx"
	}

}

resource "aws_iam_role" "ecs-instance-role" {
  name = "ecs-instance-role"
  path = "/"
  assume_role_policy = data.aws_iam_policy_document.ecs-instance-policy.json
}

data "aws_iam_policy_document" "ecs-instance-policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "ecs-instance-role-attachment" {
    role = aws_iam_role.ecs-instance-role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs-instance-profile" {
    name = "ecs-instance-profile"
    path = "/"
    role = aws_iam_role.ecs-instance-role.id
    
}

resource "aws_iam_role" "ecs-service-role" {
    name = "ecs-service-role"
    path = "/"
    assume_role_policy = data.aws_iam_policy_document.ecs-service-policy.json
}

resource "aws_iam_role_policy_attachment" "ecs-service-role-attachment" {
    role = aws_iam_role.ecs-service-role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"
}

data "aws_iam_policy_document" "ecs-service-policy" {
    statement {
        actions = ["sts:AssumeRole"]
        principals {
            type = "Service"
            identifiers = ["ecs.amazonaws.com"]
        }
    }
}