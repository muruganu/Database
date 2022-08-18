variable "vpc_cidr" {
  type = string
}

variable "private_cidr" {
  type = list(string)
  default = []
}

variable "public_cidr" {
  type = list(string)
  default = []
}

#Aurora DB vars

variable "create_cluster" {}
variable "cluster_count" {}
variable "cluster_name" {}
variable "db_engine" {}
variable "db_version" {}
variable "db_name" {}
variable "apply_immediately" {}
variable "db_instance_class" {}
variable "db_instance_count" {}
variable "enable_http_endpoint" {}
