resource "random_id" "keypair" {
  byte_length = 16
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "aws_secretsmanager_secret" "ssh_private_key" {
  name = "ssh-private-key-${random_id.keypair.hex}"

  # Generate and store the private key
  secret_string = tls_private_key.private_key.private_key_pem
}

resource "aws_secretsmanager_secret_version" "ssh_private_key_version" {
  secret_id     = aws_secretsmanager_secret.ssh_private_key.id
  secret_string = tls_private_key.private_key.private_key_pem
}

