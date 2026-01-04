terraform {
  #required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Provider for Region 1
provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"
}

# Provider for Region 2
provider "aws" {
  alias  = "virginia"
  region = "us-east-1"
}
# VPC in ap-south-1 (Mumbai)
resource "aws_vpc" "vpc_mumbai" {
  provider   = aws.mumbai
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Mumbai-VPC"
  }
}

# VPC in us-east-1 (Virginia)
resource "aws_vpc" "vpc_virginia" {
  provider   = aws.virginia
  cidr_block = "20.0.0.0/16"

  tags = {
    Name = "Virginia-VPC"
  }
}

