# create aws ec2 instance named "db"
resource "aws_instance" "db" {
    ami = local.ami_id
    vpc_security_group_ids = [local.sg_id]
    instance_type = local.instance_type # reffering instance_type expression from locals.tf
    tags = local.tags
}




