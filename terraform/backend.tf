terraform {
  backend "gcs" {
    bucket  = "boutique-tf-state-bucket"
    prefix  = "terraform/state"
  }
}