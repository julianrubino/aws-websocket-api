terraform {
  required_version = ">= 0.13.0"
}

provider "aws" {
  region  = var.region
  profile = var.aws_credentials
}

provider "random" {
  version = "~> 2.1"
}

provider "local" {
  version = "~> 1.2"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}
