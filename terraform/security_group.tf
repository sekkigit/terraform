resource "aws_security_group" "marioteh_sg_apps" {
  name = "mario-sg-using-apps"

  #Incoming traffic
  ingress {
      description      = "Cockpit"
      from_port        = 9090
      to_port          = 9090
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "Nginx"
      from_port        = 995
      to_port          = 995
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "Porteiner"
      from_port        = 991
      to_port          = 991
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "Speedtest"
      from_port        = 993
      to_port          = 993
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "Homer"
      from_port        = 995
      to_port          = 995
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "Grafana"
      from_port        = 992
      to_port          = 992
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "Prometheus"
      from_port        = 994
      to_port          = 994
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  ingress {
      description      = "VPN"
      from_port        = 996
      to_port          = 996
      protocol         = "udp"
      cidr_blocks      = ["0.0.0.0/0"]
    }

  #Outgoing traffic
  egress {
    description      = "for all outgoing traffics"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "mario-sg-using-apps"
  }
}

resource "aws_security_group" "marioteh_sg_nginx-config" {
  name = "mario-sg-using-nginx"

  #Incoming traffic
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outgoing traffic
  egress {
    description      = "for all outgoing traffics"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "mario-sg-using-nginx"
  }
}