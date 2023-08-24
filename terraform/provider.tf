terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.58.0"
    }
  }
  backend "gcs" {
    bucket  = "dhruv-backend-bucket" // Replace with your backend bucket name
    prefix  = "terraform/state"
  }
}

provider "google" {
  project = "cantech-terraform" // Replace with your project ID
  region  = "us-central1" // Replace with your desired region
  zone    = "us-central1-c" // Replace with your desired zone
}
