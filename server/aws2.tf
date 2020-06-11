provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "web_server" {
  ami                    = "ami-083ebc5a49573896a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web_server.id]
  user_data              = <<EOF
#!/bin/bash
yum - y update
yum - y install httpd
sudo servise httpd started
chkconfig httpd on
EOF

}

resource "aws_security_group" "web_server" {
  name        = "Web_server_SG"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web_server"
  }
}
