output "iam_group_name" {
  description = "Name of the created IAM Group"
  value       = aws_iam_group.terraform_group.name
}

output "iam_role_arn" {
  description = "ARN of the Terraform execution role"
  value       = aws_iam_role.terraform_role.arn
}

output "policy_arn" {
  description = "ARN of the least-privilege Terraform policy"
  value       = aws_iam_policy.terraform_least_privilege.arn
}