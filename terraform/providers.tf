terraform {
  required_version = "~>1.0"


  # https://registry.terraform.io/browse/providers
  required_providers {
    google = {
      version = "~>3.74"
    }

    random = {
      version = "~>3.1"
    }

    google-beta = {
      version = "~>3.74"
    }
  }
}
