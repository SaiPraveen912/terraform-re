locals {
  ami_id = "ami-090252cbe067a9e58"
  sg_id = "sg-06f3c37ae42fa3128" # replace with your security group
  #instance_type = "t2.micro"
  instance_type = var.instance_name == "db" ? "t3.micro" : "t2.micro" # this is expression
  tags = {
    Name = "locals"
  }
}