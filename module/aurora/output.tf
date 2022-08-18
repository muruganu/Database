output "db_hostname" {
  description = "RDS instance hostname"
  value       = aws_rds_cluster.aurora-cluster.id
  sensitive   = true
}

output "db_port" {
  description = "RDS instance port"
  value       = aws_rds_cluster.aurora-cluster.port
  sensitive   = true
}

output "db_username" {
  description = "RDS instance root username"
  value       = aws_rds_cluster.aurora-cluster.master_username
  sensitive   = true
}

output "db_endpoint" {
  value = aws_rds_cluster.aurora-cluster.endpoint
}

output "db_identifier" {
  value = aws_rds_cluster.aurora-cluster.cluster_identifier
}

output "dbname" {
  value = aws_rds_cluster.aurora-cluster.database_name
}
