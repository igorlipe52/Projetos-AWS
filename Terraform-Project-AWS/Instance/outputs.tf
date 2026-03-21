output "instance_id" {
  description = "Instance-id"
  value       = aws_instance.ec2_instance.id
}

output "public_ip" {
  description = "Instance-public-ip"
  value       = aws_instance.ec2_instance.public_ip
}

