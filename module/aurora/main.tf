
resource "aws_db_subnet_group" "rds-subnet" {
  name = "rds-subnet"
  subnet_ids = var.db_subnet
}

data "aws_kms_secrets" "rds_secret" {
  secret {
    name    = "db"
    payload = file("${path.module}/db-creds.yml.encrypted")
  }
}

locals {
  db_creds = yamldecode(data.aws_kms_secrets.rds_secret.plaintext["db"])
}

resource "aws_rds_cluster" "aurora-cluster" {
  cluster_identifier      = var.cluster_name
  db_subnet_group_name    = aws_db_subnet_group.rds-subnet.name
  database_name           = var.db_name
  master_username         = local.db_creds.username
  master_password         = local.db_creds.password
  engine                  = var.db_engine
  engine_version          = var.db_version
  enable_http_endpoint    = var.enable_http_endpoint
  apply_immediately       = var.apply_immediately
  vpc_security_group_ids  = ["${var.db_sg}"]
}


resource "aws_rds_cluster_instance" "aurora-cluster-instance" {
  count                   = var.db_instance_count
  cluster_identifier      = aws_rds_cluster.aurora-cluster.id
  identifier              = "aurora-cluster-instance-${count.index}"
  instance_class          = var.db_instance_class
  engine                  = aws_rds_cluster.aurora-cluster.engine
  engine_version          = aws_rds_cluster.aurora-cluster.engine_version
  availability_zone      =  aws_db_subnet_group.rds-subnet.name

  depends_on = [
  aws_rds_cluster.aurora-cluster
  ]
  tags = {
    Name = "RDS Instance - ${count.index}"
  }
}