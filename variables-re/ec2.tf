# create aws ec2 instance named "db"
resource "aws_instance" "db" {
    # left side are called arguments right side are called values
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] # this is list
    instance_type = var.instance_type
    tags = var.tags
}

# resource <resource-type> <resource-name>
resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description

    # block in terraform
    ingress { # ingress is inbound/incoming traffic
        from_port        = var.ssh_port # ssh
        to_port          = var.ssh_port
        protocol         = var.protocol # internet works on tcp protocol
        cidr_blocks      = var.allowed_cidr # allow from everything
    }

    # block in terraform
    egress { # egress is outgoing/outgoing traffic
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 is all protocols
        cidr_blocks      = var.allowed_cidr # allow from everything
    }

    tags = {
      Name = "allow_ssh"
      CreatedBy = "Sai Praveen"
    }
}


