resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_names[count.index] == "db" ? "t3.micro" : "t2.micro"
    # left side things are called arguments, right side are values.
    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
            Module = var.instance_names[count.index]
        }
    )
}

# resource <resource-type> <resource-name>
resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description

    # this is block
    ingress { 
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocol
        cidr_blocks      = var.allowed_cidr
    }


    egress {
        from_port        = 0 # from 0 to 0 means, opening all protocols
        to_port          = 0
        protocol         = "-1" # -1 all protocols
        cidr_blocks      = var.allowed_cidr
    }


    tags = {
        Name = "allow_ssh"
        CreatedBy = "Sai Praveen"
    }
}

