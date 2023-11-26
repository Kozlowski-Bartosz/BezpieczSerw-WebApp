output "elastic_ip_address" {
  value = aws_eip.lb.public_ip
}

output "bastion_priv_ip" {
  value = aws_instance.bastion.private_ip
}

output "kms_id" {
  value = aws_kms_key.key_mngmnt_service.id
}