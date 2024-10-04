# Output the public IP of the instance
output "instance_ip" {
  value = aws_instance.redhat_ec2_instance
}