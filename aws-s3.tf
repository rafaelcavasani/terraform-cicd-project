resource "aws_s3_bucket_acl" "bucket_example" {
  bucket = "terraform-cicd-project-example-s3"
  acl    = "private"
}