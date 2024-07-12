terraform {
  cloud {
    organization = "learnterraformacasual"

    workspaces {
      name = "aws-networking"
    }
  }
}


terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.2"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}


provider "aws" {
  # Configuration options
  region                  = "ap-southeast-2"
}



provider "random" {
  # Configuration options
}



resource "random_string" "bucket_name" {
  length           = 16
  special          = false
  upper            = false
  lower            = true   
}

resource "aws_s3_bucket" "example" {
 bucket = random_string.bucket_name.result
}

output "s3_bucket_name"{
 value = aws_s3_bucket.example.id
}