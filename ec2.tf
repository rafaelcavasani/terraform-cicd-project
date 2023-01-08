resource "aws_instance" "ec2_rancher" {
  count = 1

  ami                         = local.ubuntu_ami
  instance_type               = "t3.medium"
  subnet_id                   = aws_subnet.public_1.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = templatefile("./scripts/docker-init.sh", {
    file_content = "Init docker."
  })
  root_block_device {
    volume_size = 40
    volume_type = "standard"
  }
  key_name = "key-pair"
  
  tags = {
    Name = "rancher-server"
  }
}

resource "aws_instance" "ec2_k8s_instance" {
  count = 3

  ami                    = local.ubuntu_ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.web.id]

  user_data = templatefile("./scripts/docker-init.sh", {
    file_content = "Init docker."
  })
  root_block_device {
    volume_size = 30
    volume_type = "standard"
  }
  key_name = "key-pair"

  tags = {
    Name = "rancher-k8s-${count.index}"
  }
}

resource "aws_key_pair" "deployer" {
  key_name = "key-pair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDQlv1JDArwteO1DP4x6+nFyLc4d5+aX+CYLSu4wjiznAefKh/pQA0o14tyFnqeC7/J2oi8JDXiCbwFT+IA1O/kfQBAQErT3s0PLzgoCBlwV07IZ5tFszNcXcrO2w+r2vsRA2nnEoZE/gHtIkXI+gK4ZvuyiQOOSOpTNtJvseTGVmhU1bKogBdMLohXJhb0uNegWF1VQGEoscEb7fS2NRAKMbMNaUiOdtdinzW39QtaHCk8u1iFjXr5JiMYnvfhbEtM5SD2YlnZovPlYVsNz1lAfHKE6IbJQ3zcfhm2DNqPpq7oSUI0WW5DmdcAoeQVnyO5N3LqLakiiLy4tDHy3GyT rafae@rafa"
}