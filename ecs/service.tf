resource "aws_ecs_service" "cicd_project_service" {
    name = "cicd-project-service"
    cluster = aws_ecs_cluster.cicd_project_cluster.id
    task_definition = aws_ecs_cluster.cicd_project_service_task.arn
    desired_count = 1
}