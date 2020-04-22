output "ip_address" {
  value = "${aws_instance.server[*].public_ip}"
}
