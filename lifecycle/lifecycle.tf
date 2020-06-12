provider "aws" {
  region = "us-east-2"
}
resource "aws_eip" "my_static_ip" {
  instance - aws_instanse.my_ubuntu.id
}

resource "aws_instance" "my_ubuntu" {
  ami           = "ami-07c1207a9d40bc3bd"
  instance_type = "t2.micro"

  lifecycle {
    prevent_destroy = true
    ignore_changes  = ["ami", "user_data"]
    create_before_destroy = true
  }

}
