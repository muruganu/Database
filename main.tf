module "vpc" {
  source = "./module/net/vpc"
  vpc_cidr = var.vpc_cidr
  private_cidr = var.private_cidr
  public_cidr = var.public_cidr
}

module "sg" {
  source = "./module/net/sg"
  vpc_id = module.vpc.vpc_id
}


data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [module.vpc.vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = ["*private*"] # insert values here
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [module.vpc.vpc_id]
  }
  filter {
    name   = "tag:Name"
    values = ["*public*"] # insert values here
  }
}

module "aurora" {
  depends_on = [module.vpc,module.sg]
  source = "./module/aurora"
  create_cluster        = var.create_cluster
  cluster_count         = var.cluster_count
  cluster_name          = var.cluster_name
  db_engine             = var.db_engine
  db_version            = var.db_version
  db_subnet             = data.aws_subnets.private.ids
  db_name               = var.db_name
  db_sg                 = module.sg.db_sg
  apply_immediately     = var.apply_immediately
  db_instance_class     = var.db_instance_class
  db_instance_count     = var.db_instance_count
  enable_http_endpoint  = var.enable_http_endpoint
}