provider "aws" {
    access_key        = "AKIA2GaZZIU5DPYPXABWK"
    secret_key        = "k+kWGtpFy4GDkI2H8x6oYwpL6wDC0co9yF4rM6z9"
    region            = "us-east-1"
}

resource "aws_instance" "ec2_demo" {
    ami               = "ami-04505e74c0741db8d"
    instance_type     = "t2.micro"
    key_name          = "mario-test"
    security_groups   = ["mario-sg-using-apps", "mario-sg-using-nginx"]
    
    tags = {
    Name              = "Mario-Demo-app"
    }
  
    provisioner "remote-exec" {
        inline = [
          "sudo git clone https://github.com/sekkigit/Cloud-Lab.git init && cd init/",
          "sudo bash install.sh"
        ]

        connection {
          type        = "ssh"
          user        = "ubuntu"
          private_key = file("./Ionity-demo-app.pem")
          host        = self.public_ip
        }
    }
}
