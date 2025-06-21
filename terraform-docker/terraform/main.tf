provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "docker_ec2" {
  ami           = "ami-0e001c9271cf7f3b9"
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
