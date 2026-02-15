output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "private_1_id" {
  description = "ID of the private 1 subnet"
  value       = aws_subnet.private_1.id
}

output "private_2_id" {
  description = "ID of the private 2 subnet"
  value       = aws_subnet.private_2.id
}

output "public_1_id" {
  description = "ID of the public 1 subnet"
  value       = aws_subnet.public_1.id # ✓ public_1
}

output "public_2_id" {
  description = "ID of the public 2 subnet"
  value       = aws_subnet.public_2.id # ✓ public_2
}

output "alb_security_group_id" {
  description = "ID of the alb security group"
  value       = aws_security_group.alb.id
}

output "alb_security_group_arn" {
  description = "ARN of the alb security group"
  value       = aws_security_group.alb.arn
}

output "ecs_security_group_id" {
  description = "ID of the ecs security group"
  value       = aws_security_group.ecs.id
}


