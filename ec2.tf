resource "aws_instance" "ec2_rancher" {
  count = 1

  ami                    = local.ubuntu_ami
  instance_type          = "t3.medium"
  subnet_id              = aws_subnet.public_1
  vpc_security_group_ids = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = templatefile("./scripts/docker-init.sh", {
    file_content = "Init docker."
  })
  root_block_device {
    volume_size = 40
    volume_type = standard
  }

  tags = {
    Name = "rancher-server"
  }
}

resource "aws_instance" "ec2_k8s_instance" {
  count = 3

  ami                    = local.ubuntu_ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_1
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = templatefile("./scripts/docker-init.sh", {
    file_content = "Init docker."
  })
    root_block_device {
    volume_size = 30
    volume_type = standard
  }

  tags = {
    Name = "rancher-k8s-${count.index}"
  }
}