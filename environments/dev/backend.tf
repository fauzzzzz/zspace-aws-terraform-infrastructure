terraform {
  backend "s3" {
    bucket         = "zspace-bucket-tfstate"
    description    = "bucket to store tfstate file"
    key            = "dev/network/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    use_lockfile   = true

    tags{
      Project     = "zspace-project"
      Environment = "dev"
    }
  }
}