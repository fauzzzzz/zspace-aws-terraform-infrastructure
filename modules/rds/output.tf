output "db_endpoint" {
  description = "The connection endpoint for the RDS instance (hostname:port)"
  value       = aws_db_instance.this.endpoint
}

output "db_host" {
  description = "The hostname address of the RDS instance"
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "The database port"
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "The database name"
  value       = aws_db_instance.this.db_name
}

output "db_username" {
  description = "The master username for the database"
  value       = aws_db_instance.this.username
}