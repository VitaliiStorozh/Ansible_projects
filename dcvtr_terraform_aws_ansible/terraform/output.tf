output "my_server_ip" {
  value = aws_instance.docker1.public_dns
}
