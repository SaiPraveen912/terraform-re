data "aws_ami" "ami_id" {
    most_recent = true
    owners = ["973714476881"]
    filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    } 
    filter {
        name   = "root-device-type"
        values = ["ebs"]
    }
    filter {
            name   = "virtualization-type"
            values = ["hvm"]
    }
}

# Now this will get me the default vpc details 
# default vpc for the region provided in provider.tf -> us-east-1
data "aws_vpc" "default" {
    default = true # i am in us-east-1 region
}