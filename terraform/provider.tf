terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.58.0"
    }
  }
}

provider "google" {
  project     = "dhruv-project 	"
  region      = "us-central1"
  zone        = "us-central1-c"
}
