resource "google_container_cluster" "primary" {
  count    = length(var.regions)
  name     = "${var.cluster_name}-${count.index}"
  location = var.regions[count.index]

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  count      = length(var.regions)
  name       = "node-pool-${count.index}"
  location   = var.regions[count.index]
  cluster    = google_container_cluster.primary[count.index].name
  node_count = 1

  node_config {
    machine_type = "e2-small"
  }
}