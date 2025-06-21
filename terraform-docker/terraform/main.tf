provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "docker_ec2" {
  ami           = "ami-0c768662cc797cd75"
  instance_type = "t2.micro"
  key_name      = "node"

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  tags = {
    Name = "DockerEC2"
  }
}
