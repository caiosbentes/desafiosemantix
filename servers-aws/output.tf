output "ip_address" {
  description = "IP da instancia criada"
  value = "${aws_instance.server[*].public_ip}"
}
output "key_name" {
  description = "key name da instancia"
  value       = "${aws_instance.server[*].key_name}"
}
