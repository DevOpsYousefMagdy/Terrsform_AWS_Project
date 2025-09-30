resource "aws_s3_bucket" "app_bucket" {
  bucket = "my-app-bucket-terraform"
  acl    = "private"
  tags = {
    Name = "app-bucket"
  }
}

