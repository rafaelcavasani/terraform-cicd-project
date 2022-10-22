resource "aws_iam_role" "ecs_task_role" {
  name                = "cicd-task-role"
  assume_role_policy  = data.aws_iam_policy_document.instance_assume_role_policy.json
  managed_policy_arns = [aws_iam_policy.ecs_task_role_policy.arn]
}

resource "aws_iam_policy" "ecs_task_role_policy" {
  name = "policy-618033"

  policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
        {
        "Effect": "Allow",
        "Action": [
            "ecr:GetAuthorizationToken",
            "ecr:BatchCheckLayerAvailability",
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ],
        "Resource": "*"
        }
    ]
  })
}