variable "create_cluster" {}
variable "cluster_count" {}
variable "cluster_name" {}
variable "db_subnet" {
  type = list
}
variable "db_engine" {}
variable "db_version" {}
variable "db_name" {}
variable "db_sg" {}
variable "apply_immediately" {}
variable "db_instance_class" {}
variable "db_instance_count" {}
variable "enable_http_endpoint" {}