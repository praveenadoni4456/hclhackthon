terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.12.0"
    }
  }
}

provider "google" {
  # Configuration options
  credentials = file("")
  project = "hackthon"
  region = "asia-south1"
  zone = "asia-south1-c"
}