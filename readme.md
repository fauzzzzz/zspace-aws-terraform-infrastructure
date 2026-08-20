# 🚀 AWS Infrastructure Provisioning for zSpace (Terraform)

This repository contains the **Infrastructure as Code (IaC)** automated setup using **Terraform** to provision a secure, scalable, and highly available cloud environment on **AWS**. 

This infrastructure is engineered to support the **Phase 2 Migration** (Rehosting) of the `zSpace` application stack—transitioning services from a local/on-premises environment (VirtualBox) to AWS Cloud.

---

## 🏗️ Architecture Overview

The Terraform code automates the provisioning of the following AWS resources within the `eu-central-1` (Frankfurt) region:

* **Networking (VPC):** Custom Multi-AZ Virtual Private Cloud configured with Public and Isolated Private Subnets.
* **Security & Firewalls:** Strict Security Groups implementing the principle of least privilege (SSH restricted to Bastion, PostgreSQL limited to VPC internal traffic).
* **Compute (EC2):** Public-facing Ubuntu instance serving as a secure SSH jump server and migration data-streaming pipeline endpoint.
* **Database (AWS RDS):** Fully managed PostgreSQL database instance deployed inside isolated private subnets with automated backups.

---

## 📁 Repository Structure

```text
aws-zspace/
├── .gitignore               # Excludes secrets, .tfstate, .tfvars, and SSH keys
├── README.md                # Project documentation
├── environments/            # Environment-specific configurations
│   ├── dev/                 # Development environment tfvars & overrides
│   └── prod/                # Production environment setup
└── modules/                 # Reusable Terraform modules
    ├── vpc/                 # Network & Subnet resources
    ├── ec2/                 # Bastion Jump Server resources
    └── rds/                 # AWS RDS PostgreSQL managed database
    └── security_groups/ 
