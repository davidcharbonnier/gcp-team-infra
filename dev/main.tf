module "cluster" {
  source                   = "../../cloud-foundation-fabric/modules/gke-cluster"
  project_id               = var.project_id
  name                     = var.gke_cluster_name
  location                 = var.location
  network                  = var.vpc_self_links.dev-spoke-0
  subnetwork               = var.gke_subnetwork
  secondary_range_pods     = var.gke_secondary_range_pods
  secondary_range_services = var.gke_secondary_range_services
  # addons = null
  authenticator_security_group = var.gke_authenticator_security_group
  # cluster_autoscaler = {
  #   enabled    = false
  #   cpu_min    = 0
  #   cpu_max    = 0
  #   memory_min = 0
  #   memory_max = 0
  # }
  # database_encryption = {
  #   enabled  = false
  #   state    = "DECRYPTED"
  #   key_name = null
  # }
  enable_dataplane_v2         = true
  enable_intranode_visibility = true
  enable_shielded_nodes       = true
  # logging_config = null
  logging_service = null
  maintenance_config = {
    daily_maintenance_window = {
      start_time = "02:00"
    }
    recurring_window      = null
    maintenance_exclusion = []
  }
  # master_authorized_ranges = {
  #   internal-vms = "10.0.0.0/8"
  # }
  # monitoring_config = null
  monitoring_service = null
  # node_locations = []
  # peering_config = null
  private_cluster_config = {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "192.168.0.0/28"
    master_global_access    = false
  }
  release_channel = var.gke_release_channel
}

module "nodepool" {
  source       = "../../cloud-foundation-fabric/modules/gke-nodepool"
  project_id   = var.project_id
  cluster_name = module.cluster.name
  location     = var.location
  # autoscaling_config = null
  initial_node_count = var.gke_nodepool_initial_node_count
  management_config = {
    auto_repair  = true
    auto_upgrade = true
  }
  node_preemptible = var.gke_nodepool_node_preemptible
  node_disk_size    = var.gke_nodepool_node_disk_size
  node_image_type   = var.gke_nodepool_node_image_type
  node_machine_type = var.gke_nodepool_node_machine_type
}