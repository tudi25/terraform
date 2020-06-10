provider "aws" {
  access_key = "" #export AWS_ACCESS_KEY_ID=-------------
  secret_key = "" #export AWS_SECRET_ACCESS_KEY=---------
  region     = "us-east-2"
}


resource "aws_instance" "my_ubuntu" {
  ami           = "ami-07c1207a9d40bc3bd"
  instance_type = "t2.micro"
}
