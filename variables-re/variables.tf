# 1. Command Line
# 2. tfvars
# 3. Environment Variable
# 4. Variable default value

# ec2 instance variables
variable "image_id" {
    type = string #optional
    default = "ami-090252cbe067a9e58" #optional
    description = "RHEL-9 AMI ID" #optional
}

variable "instance_type" {
    default = "t2.micro"  
    type = string
}

variable "tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Module = "DB"
        Name = "DB"
    }
}


# security group variables
variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description" {
    default = "allowing port 22"
}

variable "ssh_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "allowed_cidr" {
    #type = list
    default = ["0.0.0.0/0"] # strings inside the list
}
