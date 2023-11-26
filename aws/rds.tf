resource "aws_db_instance" "default" {
  allocated_storage    = 5
  db_name              = "rds_services_db"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  manage_master_user_password   = true
  master_user_secret_kms_key_id = aws_kms_key.key_mngmnt_service.key_id
  username                      = "dbadmin"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}