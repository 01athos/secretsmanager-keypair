variable "name_prefix" {
  description = "Prefix to use for the SSH key pair and Secrets Manager secret"
  type        = string
  default     = "eks-ssh-key"
}
