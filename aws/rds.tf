resource "aws_db_instance" "postgresql-db-instance" {
  allocated_storage    = 5
  db_name              = "rds_services_db"
  engine               = "postgres"
  engine_version       = "15.3"
  instance_class       = "db.t3.micro"
  manage_master_user_password   = true
  master_user_secret_kms_key_id = aws_kms_key.key_mngmnt_service.key_id
  username                      = "dbadmin"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
}