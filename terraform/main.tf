resource "aws_security_group" "udp_7777" {
  name        = "udp_7777"
  description = "Allow inbound 7777/udp traffic"

  ingress {
    description = "Allow inbound 7777/udp traffic"
    from_port   = 7777
    to_port     = 7777
    protocol    = "udp"
    cidr_blocks = var.ip_whitelist
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "udp_7777"
  }
}

resource "aws_instance" "ue4_dedicated" {
    instance_type = "t2.small"
    ami = data.aws_ami.ue4_dedicated_ami.id
    vpc_security_group_ids = [
        aws_security_group.udp_7777.id
    ]
    tags = {
        Name = "ue4-dedicated-server"
    }
    user_data = file("scripts/userdata.sh")
}
