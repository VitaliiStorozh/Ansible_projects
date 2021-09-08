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

  # network_interface {
  #   network_interface_id = aws_network_interface.docker1.id
  #   device_index         = 0
  # }
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

  # network_interface {
  #   network_interface_id = aws_network_interface.docker2.id
  #   device_index         = 0
  # }
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
  # network_interface {
  #   network_interface_id = aws_network_interface.ansible.id
  #   device_index         = 0
  # }
  tags = merge(var.common_tag, { Name = var.name_server3 })
}


# resource "aws_vpc" "my_vpc" {
#   cidr_block = "172.16.0.0/16"
#
#   tags = {
#     Name = "tf-example"
#   }
# }
#
# resource "aws_internet_gateway" "gw" {
#   vpc_id = aws_vpc.my_vpc.id
# }
#
# resource "aws_subnet" "my_subnet" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "172.16.10.0/24"
#   availability_zone       = "us-east-2a"
#   map_public_ip_on_launch = true
#
#
#   tags = {
#     Name = "tf-example"
#   }
#   depends_on = [aws_internet_gateway.gw]
# }
#
# resource "aws_network_interface" "docker1" {
#   subnet_id       = aws_subnet.my_subnet.id
#   private_ips     = ["172.16.10.101"]
#   security_groups = [aws_security_group.dcrtv.id]
#
#   tags = {
#     Name = "docker1_network_interface"
#   }
# }
#
# resource "aws_network_interface" "docker2" {
#   subnet_id       = aws_subnet.my_subnet.id
#   private_ips     = ["172.16.10.102"]
#   security_groups = [aws_security_group.dcrtv.id]
#
#   tags = {
#     Name = "docker2_network_interface"
#   }
# }
#
# resource "aws_network_interface" "ansible" {
#   subnet_id       = aws_subnet.my_subnet.id
#   private_ips     = ["172.16.10.100"]
#   security_groups = [aws_security_group.dcrtv.id]
#
#   tags = {
#     Name = "ansible_network_interface"
#   }
# }
