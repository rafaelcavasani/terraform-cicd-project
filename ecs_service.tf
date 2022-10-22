resource "aws_ecs_service" "cicd_project_service" {
    name = "cicd-project-service"
    cluster = aws_ecs_cluster.cicd_project_cluster.id
    task_definition = aws_ecs_task_definition.cicd_project_service_task.arn
    network_configuration {
      security_groups = [ "sg-04287a7f443f052fb" ]
      subnets = [ "subnet-06d25fc42de4c5917", "subnet-01d2f3f9f8744fa7d", "subnet-081afb68ccf2c09ce", "subnet-09cb90bbb295bf591", "subnet-099943ce4faa2ae17", "subnet-06e3cc9dfea4b96a1" ]
    }
    desired_count = 1
}
