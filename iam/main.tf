# Least-Privilege IAM Policy 
resource "aws_iam_policy" "terraform_least_privilege" {
  name        = "zspace-dev-terraform-policy"
  description = "Least-privilege policy required to deploy Zspace VPC, EC2, and RDS infrastructure"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      # Networking (VPC, Subnets, IGW, Route Tables)
      {
        Sid    = "NetworkingPermissions"
        Effect = "Allow"
        Action = [
          "ec2:CreateVpc",
          "ec2:DeleteVpc",
          "ec2:DescribeVpcs",
          "ec2:ModifyVpcAttribute",
          "ec2:CreateSubnet",
          "ec2:DeleteSubnet",
          "ec2:DescribeSubnets",
          "ec2:ModifySubnetAttribute",
          "ec2:CreateInternetGateway",
          "ec2:DeleteInternetGateway",
          "ec2:DescribeInternetGateways",
          "ec2:AttachInternetGateway",
          "ec2:DetachInternetGateway",
          "ec2:CreateRouteTable",
          "ec2:DeleteRouteTable",
          "ec2:DescribeRouteTables",
          "ec2:CreateRoute",
          "ec2:DeleteRoute",
          "ec2:AssociateRouteTable",
          "ec2:DisassociateRouteTable"
        ]
        Resource = "*"
      },
      # Security Groups
      {
        Sid    = "SecurityGroupPermissions"
        Effect = "Allow"
        Action = [
          "ec2:CreateSecurityGroup",
          "ec2:DeleteSecurityGroup",
          "ec2:DescribeSecurityGroups",
          "ec2:AuthorizeSecurityGroupIngress",
          "ec2:RevokeSecurityGroupIngress",
          "ec2:AuthorizeSecurityGroupEgress",
          "ec2:RevokeSecurityGroupEgress"
        ]
        Resource = "*"
      },
      # Compute (EC2 & AMIs)
      {
        Sid    = "EC2Permissions"
        Effect = "Allow"
        Action = [
          "ec2:RunInstances",
          "ec2:TerminateInstances",
          "ec2:StartInstances",
          "ec2:StopInstances",
          "ec2:DescribeInstances",
          "ec2:DescribeInstanceStatus",
          "ec2:DescribeImages",
          "ec2:DescribeKeyPairs",
          "ec2:CreateTags",
          "ec2:DeleteTags",
          "ec2:DescribeTags"
        ]
        Resource = "*"
      },
      # Database (RDS PostgreSQL)
      {
        Sid    = "RDSPermissions"
        Effect = "Allow"
        Action = [
          "rds:CreateDBInstance",
          "rds:DeleteDBInstance",
          "rds:DescribeDBInstances",
          "rds:ModifyDBInstance",
          "rds:RebootDBInstance",
          "rds:CreateDBSubnetGroup",
          "rds:DeleteDBSubnetGroup",
          "rds:DescribeDBSubnetGroups",
          "rds:ModifyDBSubnetGroup",
          "rds:ListTagsForResource",
          "rds:AddTagsToResource",
          "rds:RemoveTagsFromResource"
        ]
        Resource = "*"
      }
    ]
  })
}

# IAM Role for Terraform Execution (
resource "aws_iam_role" "terraform_role" {
  name        = "zspace-dev-terraform-role"
  description = "Role assumed to deploy Zspace Dev infrastructure"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
      }
    ]
  })
}

data "aws_caller_identity" "current" {}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "role_attach" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = aws_iam_policy.terraform_least_privilege.arn
}

# IAM Group
resource "aws_iam_group" "terraform_group" {
  name = "zspace-dev-terraform-group"
}

# Attach Policy directly to Group
resource "aws_iam_group_policy_attachment" "group_attach" {
  group      = aws_iam_group.terraform_group.name
  policy_arn = aws_iam_policy.terraform_least_privilege.arn
}