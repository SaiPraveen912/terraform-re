resource "aws_instance" "db" {
    ami = "ami-090252cbe067a9e58"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["sg-06f3c37ae42fa3128"]

    tags = {
        Name = "db"
    }
}