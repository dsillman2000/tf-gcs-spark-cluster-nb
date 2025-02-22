terraform {
  required_version = ">=1.10, <2.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.5"
    }
  }
}
