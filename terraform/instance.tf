resource "aws_security_group" "allow-ssh-httpd" {
  name = "allow-ssh-httpd"
  description = "security group that allows ssh and httpd"
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

    egress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
tags {
    Name = "allow-ssh-httpd"
  }
}

resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "ubuntu" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh-httpd.id}"]
tags {
    Name = "Ubuntu-16.04"
  }
  provisioner "local-exec" {
     command = "echo \"[webserver]\n${aws_instance.ubuntu.public_ip} ansible_connection=ssh ansible_ssh_user=ubuntu\"  > ../ansible/hosts"
  }
}
