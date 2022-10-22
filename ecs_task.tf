resource "aws_ecs_task_definition" "cicd_project_service_task" {
  family = "service"
  requires_compatibilities = ["FARGATE"]
  container_definitions = jsonencode([
    {
      name      = "cicd-service"
      image     = "625866090828.dkr.ecr.us-east-1.amazonaws.com/terraform-cicd-project-app:latest"
      cpu       = 1
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
    }
  ])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-1a, us-east-1b]"
  }
}