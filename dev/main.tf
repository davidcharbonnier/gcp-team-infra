module "cluster" {
  source                    = "../../cloud-foundation-fabric/modules/gke-cluster"
  project_id                = var.project_id
  name                      = "test"
  location                  = "northamerica-northeast1"
  network                   = var.vpc_self_links.dev-spoke-0
  subnetwork                = "dev-infra-hosting-0-nane1"
  secondary_range_pods      = "gke-pods"
  secondary_range_services  = "gke-services"
  default_max_pods_per_node = 32
  master_authorized_ranges = {
    internal-vms = "10.0.0.0/8"
  }
  private_cluster_config = {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "192.168.0.0/28"
    master_global_access    = false
  }
}

module "nodepool" {
  source                      = "../../cloud-foundation-fabric/modules/gke-nodepool"
  project_id                  = var.project_id
  cluster_name                = module.cluster.name
  location                    = "northamerica-northeast1"
  name                        = "test"
}