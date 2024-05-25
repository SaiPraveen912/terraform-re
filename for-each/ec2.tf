resource "aws_instance" "expense" {
    for_each = var.instance_names # it will give each variables -> each.key and each.value
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = ["sg-06f3c37ae42fa3128"]
    instance_type = each.value
    tags = merge(
        var.common_tags,
        {
            Name = each.key
            Module = each.key
        }
    )
}