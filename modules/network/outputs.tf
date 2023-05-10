output "aws_subnet_id" {
    value = aws_subnet.main_public_subnet.id
}

output "security_group_id" {
    value = aws_security_group.main_security_group.id
}


