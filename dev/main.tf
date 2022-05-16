module "cluster" {
  source                   = "../../cloud-foundation-fabric/modules/gke-cluster"
  project_id               = var.project_id
  name                     = var.cluster_name
  location                 = var.location
  network                  = var.vpc_self_links.dev-spoke-0
  subnetwork               = "dev-infra-hosting-0-nane1"
  secondary_range_pods     = "gke-pods"
  secondary_range_services = "gke-services"
  # addons = null
  authenticator_security_group = "gcp-team-infra@davidcharbonnier.fr"
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
  logging_service = ""
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
  monitoring_service = ""
  # node_locations = []
  # peering_config = null
  private_cluster_config = {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "192.168.0.0/28"
    master_global_access    = false
  }
  release_channel = "rapid"
}

module "nodepool" {
  source       = "../../cloud-foundation-fabric/modules/gke-nodepool"
  project_id   = var.project_id
  cluster_name = module.cluster.name
  location     = var.location
  # autoscaling_config = null
  initial_node_count = 2
  management_config = {
    auto_repair  = true
    auto_upgrade = true
  }
  node_preemptible = true


  node_disk_size    = 30
  node_image_type   = "cos_containerd"
  node_machine_type = "e2-small"
}