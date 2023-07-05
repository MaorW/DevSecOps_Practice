resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content = "We love pets!"
}

terraform {
  backend "s3" {
    bucket = "bucket_name"
    key = "finance/terraform.fstate"
    region = "us-west-1"
    dynamodb_table = "state-locking"
  }
}