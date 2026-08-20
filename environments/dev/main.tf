# VPC Module
module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  azs                  = var.azs
  tags                 = var.tags
}

# Security Groups Module
module "security_groups" {
  source = "../../modules/security_groups"

  vpc_id   = module.vpc.vpc_id
  vpc_name = var.vpc_name
  my_ip    = var.my_ip
  tags     = var.tags
}

# EC2 Web Server Module
module "web_server" {
  source = "../../modules/ec2"

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  subnet_id          = module.vpc.public_subnet_ids[0]
  security_group_ids = [module.security_groups.security_group_id]
  key_name           = var.key_name
  tags               = var.tags
}

# PostgreSQL RDS Module
module "rds" {
  source = "../../modules/rds"

  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  vpc_id                = module.vpc.vpc_id
  subnet_ids            = module.vpc.private_subnet_ids
  ec2_security_group_id = module.security_groups.security_group_id
  tags                  = var.tags
}