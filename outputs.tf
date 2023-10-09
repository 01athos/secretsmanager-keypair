output "public_key" {
  value = tls_private_key.private_key.public_key_openssh
}

output "secret_name" {
  value = aws_secretsmanager_secret.ssh_private_key.name
}
