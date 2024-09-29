output "ec2_instance_id" {
  value = aws_instance.web.id
}

output "ec2_instance_public_id" {
  value = aws_instance.web.public_ip
}