output "public_subnet_a_id" {
  value = aws_subnet.public_subnet_a.id
}

output "public_subnet_b_id" {
  value = aws_subnet.public_subnet_b.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
}