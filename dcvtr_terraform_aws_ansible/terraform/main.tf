data "aws_ami" "amazon_latest_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8q3Ot0EdOzSQg75oENxbpnHyASrQCWazcb24ABZXK7EQBbUeK0ANdxeZcV1fIeAuMtmA1p97JEaJniCDcabwwK38yQzlXFBp2W38optbrMawHecNZqDxdlNoyTrRhM2+idi2qYsfAz2QbZwxrdRmvhuqmz5EAOWOWrfaAEofn/EtABKwU54CmbBDlT4/lqHBflR6GeHBFM3ic84j1DG1AjlqRoWk2N1IXFTXxwXGd4cNf3so099j9BySGUU2EKBDH5X8w7CnLUh5F2nCAW5cmOu33WaANsz1/WZHPWwz0XZUqRfNykZLVjhW20CAQs1hEpYXg8r5wanvN3Re9srkj vitalii-key-ohio"
}

resource "aws_instance" "docker1" {
  ami                    = data.aws_ami.amazon_latest_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.prod-subnet-public-1.id
  vpc_security_group_ids = [aws_security_group.dcrtv.id]
  private_ip             = "10.0.1.31"
  monitoring             = var.detailed_monitoring
  key_name               = aws_key_pair.deployer.id
  user_data              = file("user_data_docker.sh")

  tags = merge(var.common_tag, { Name = var.name_server1 })
}

resource "aws_instance" "docker2" {
  ami                    = data.aws_ami.amazon_latest_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.prod-subnet-public-1.id
  vpc_security_group_ids = [aws_security_group.dcrtv.id]
  private_ip             = "10.0.1.32"
  monitoring             = var.detailed_monitoring
  key_name               = aws_key_pair.deployer.id
  user_data              = file("user_data_docker.sh")

  tags = merge(var.common_tag, { Name = var.name_server2 })
}

resource "aws_instance" "ansible" {
  ami                    = data.aws_ami.amazon_latest_linux.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.prod-subnet-public-1.id
  vpc_security_group_ids = [aws_security_group.dcrtv.id]
  private_ip             = "10.0.1.30"
  monitoring             = var.detailed_monitoring
  key_name               = aws_key_pair.deployer.id
  user_data              = file("user_data_ansible.sh")

  tags = merge(var.common_tag, { Name = var.name_server3 })
}
