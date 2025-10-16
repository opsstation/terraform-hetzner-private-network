# Terraform version
terraform {
  required_version = ">= 1.13.3"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}
