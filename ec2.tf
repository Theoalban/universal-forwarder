## Ec2 instance 

resource "aws_instance" "universal_forwarder" {
  ami                         = "ami-0bb4c991fa89d4b9b"
  vpc_security_group_ids      = [aws_security_group.universal_forwarder-sg.id]
  instance_type               = "t2.small"
  key_name                    = "ec2-demo"
  subnet_id                   = aws_subnet.public_subnet10.id
  user_data                   = file("setup.sh")
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 25
    volume_type           = "gp2"
    delete_on_termination = true
    tags = {
      Name = "Universal-forwarder"
      env  = "qa"
    }

  }
}