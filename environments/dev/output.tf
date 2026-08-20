output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance for SSH access"
  value       = module.web_server.public_ip
}

output "rds_endpoint" {
  description = "Connection endpoint for the PostgreSQL RDS instance"
  value       = module.rds.db_endpoint
}

output "rds_database_name" {
  description = "Name of the created database"
  value       = module.rds.db_name
}