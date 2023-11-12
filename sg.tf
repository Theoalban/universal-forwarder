## Security group

resource "aws_security_group" "universal_forwarder-sg" {
  name        = "uf-sg-qa"
  description = "Allow ssh and splunk forwarder"
  vpc_id      = aws_vpc.universal_forwarder-vpc.id

 # ingress {
  #  description = "allow ssh"
  #  from_port   = 22
  #  to_port     = 22
   # protocol    = "tcp"
   # cidr_blocks = ["0.0.0.0/0"]
 # }
  ingress {
    description = "allow splunk forwarder"
    from_port   = 22
    to_port     = 9997
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    env = "qa"
  }


}