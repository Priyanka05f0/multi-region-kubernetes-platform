variable "regions" {
  default = [
    "us-central1",
    "europe-west1",
    "us-east1"
  ]
}

variable "cluster_name" {
  default = "multi-region-cluster"
}