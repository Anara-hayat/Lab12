output "webserver_public_ip" {
  value = module.myapp_webserver.aws_instance.public_ip
}
output "aws_web_1_public_ip" {
  value = module.myapp_web_1.aws_instance.public_ip
}
output "aws_web_2_public_ip" {
  value = module.myapp_web_2.aws_instance.public_ip
}