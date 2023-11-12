output "public-ip" {
  value = aws_instance.universal_forwarder.public_ip

}
output "vpc_id" {
  value = aws_vpc.universal_forwarder-vpc.id
}
output "security_group_id" {
  value = aws_security_group.universal_forwarder-sg.id
}