output "aws_instance" {
  description = "EC2 instance created by the webserver module"
  value       = aws_instance.myapp_server
}
