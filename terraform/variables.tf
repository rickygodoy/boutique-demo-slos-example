variable "region" {
  description = "Default region to create resources where applicable."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Default zone to create resources where applicable."
  type        = string
  default     = "us-central1-b"
}

variable "terraform_state_bucket" {
  description = "State bucket that will be used to store terraform state."
  type        = string
}

variable "project_id" {
  description = "Project ID where the SLOs will be created."
  type        = string
}

variable "cluster_name" {
  description = "Project ID where the SLOs will be created."
  type        = string
}

variable "boutique_namespace" {
  description = "Project ID where the SLOs will be created."
  type        = string
  default = "default"
}


