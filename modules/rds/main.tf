# Security Group for PostgreSQL (Port 5432)
resource "aws_security_group" "rds" {
  name        = "rds-postgres-sg"
  description = "Allow PostgreSQL traffic from EC2"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow inbound PostgreSQL traffic from EC2 SG"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.ec2_security_group_id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "rds-postgres-sg"
    },
    var.tags
  )
}

# DB Subnet Group for RDS
resource "aws_db_subnet_group" "this" {
  name       = "rds-postgres-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(
    {
      Name = "rds-postgres-subnet-group"
    },
    var.tags
  )
}

# PostgreSQL RDS Instance
resource "aws_db_instance" "this" {
  allocated_storage      = 20
  max_allocated_storage  = 50
  engine                 = "postgres"
  engine_version         = "16"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  port                   = 5432
  
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  skip_final_snapshot    = true
  publicly_accessible    = false

  tags = merge(
    {
      Name = "rds-postgres-instance"
    },
    var.tags
  )
}