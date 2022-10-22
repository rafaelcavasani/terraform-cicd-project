resource "aws_s3_bucket" "example_bucket" {
  bucket = "terraform-cicd-project-example-s3"
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.id
  acl    = "private"
}