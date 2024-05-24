# create aws ec2 instance named "db"
resource "aws_instance" "db" {
    ami = "ami-090252cbe067a9e58"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    tags = {
        Name = "db"
    }
}

# resource <resource-type> <resource-name>
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    ingress { # ingress is inbound/incoming traffic
        from_port        = 22 # ssh
        to_port          = 22
        protocol         = "tcp" # internet works on tcp protocol
        cidr_blocks      = ["0.0.0.0/0"] # allow from everything
    }


    egress { # egress is outgoing/outgoing traffic
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 is all protocols
        cidr_blocks      = ["0.0.0.0/0"] # allow from everything
    }

    tags = {
      Name = "allow_ssh"
      CreatedBy = "Sai Praveen"
    }
}


