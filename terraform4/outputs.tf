output "server_ip_public" {
  value = module.my_server_public.public_ip
}

output "server_url_public" {
  value = "http://${module.my_server_public.public_ip}:8080"
}

output "ssm_command_public" {
  value = "aws ssm start-session --target ${module.my_server_public.id}"
}