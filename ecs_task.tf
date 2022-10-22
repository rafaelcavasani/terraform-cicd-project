resource "aws_ecs_task_definition" "cicd_project_service_task" {
  family                   = "cicd-service-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_role.arn
  container_definitions    = <<TASK_DEFINITION
[
  {
    "name": "cicd-service",
    "image": "625866090828.dkr.ecr.us-east-1.amazonaws.com/terraform-cicd-project-app:latest",
    "cpu": 128,
    "memory": 512,
    "essential": true
  }
]
TASK_DEFINITION

}