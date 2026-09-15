output "webserver_ip" {
  value = aws_eip.webserver.public_ip
}

output "webserver_url" {
  value = "http://${aws_eip.webserver.public_ip}"
}

output "ssm_command_webserver" {
  value = "aws ssm start-session --target ${module.webserver.id}"
}

output "controller_private_ip" {
  value = module.controller.private_ip
}

output "ssm_command_controller" {
  value = "aws ssm start-session --target ${module.controller.id}"
}

output "monitor_private_ip" {
  value = module.monitor.private_ip
}

output "ssm_command_monitor" {
  value = "aws ssm start-session --target ${module.monitor.id}"
}