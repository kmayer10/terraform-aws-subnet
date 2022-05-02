output "subnet_id" {
  value = [
    for aws_subnet in aws_subnet.aws_subnet: aws_subnet.id
  ]
}
