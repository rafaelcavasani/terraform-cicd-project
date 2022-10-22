resource "aws_ecr_repository" "terraform_cicd_project_app_ecr" {
  name                 = "terraform-cicd-project-app"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}