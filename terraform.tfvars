vpc_cidr = "10.0.0.0/16"

private_cidr = ["10.0.1.0/24","10.0.2.0/24"]


public_cidr = ["10.0.3.0/24","10.0.4.0/24"]


create_cluster        = true
cluster_name          = {
  cluster_1 = "dev"
  cluster_2 = "test"
  cluster_3 = "prod"
}
db_engine             = "aurora-postgresql"
db_version            = "13.3"
db_name               = "my-database"
apply_immediately     = true
db_instance_class     = {
  dev = "db.t3g.medium"
  test = "db.t4g.medium"
  prod = "db.t5g.medium"
}
db_instance_count     = 1
enable_http_endpoint  = true


