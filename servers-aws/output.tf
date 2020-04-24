output "ip_address" {
  description = "IP da instancia criada"
  value = "${aws_instance.server[*].public_ip}"
}
