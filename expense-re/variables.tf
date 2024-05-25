# 1. Command Line
# 2. tfvars
# 3. Environment Variable
# 4. Variable default value

# ec2 instance variables
variable "instance_names" {
    type = list
    default = ["db", "backend", "frontend"]
}

variable "image_id" {
    type = string #optional
    default = "ami-090252cbe067a9e58" #optional
    description = "RHEL-9 AMI ID" #optional
}

variable "instance_type" {
    default = "t2.micro"  
    type = string
}

variable "common_tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Terraform = true
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


#r53 variables
variable "zone_id" {
    default = "Z08047941PILYOPLI7Z4B"
}

variable "domain_name" {
    default = "daws-78s.cloud"  
}
