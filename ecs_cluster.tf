resource "aws_ecs_cluster" "cicd_project_cluster" {
  name = "cicd-project-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_cluster_capacity_providers" "cicd_project_cluster_capacity_provider" {
  cluster_name = aws_ecs_cluster.cicd_project_cluster.name

  capacity_providers = ["FARGATE_SPOT"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE_SPOT"
  }
}
