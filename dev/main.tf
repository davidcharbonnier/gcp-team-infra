###
#  Workarounds to allow Helm/Kubernetes provider work with GKE
data "template_file" "gke_endpoint" {
  template = module.cluster.endpoint
}
data "template_file" "gke_ca_certificate" {
  template = module.cluster.ca_certificate
}
data "template_file" "gke_name" {
  template = module.cluster.name
}
###

module "cluster" {
  source     = "../../cloud-foundation-fabric/modules/gke-cluster"
  project_id = var.project_id
  name       = var.gke_cluster_name
  location   = var.location
  network    = var.vpc_self_links["dev-spoke-0"]
  # see: https://github.com/hashicorp/terraform-provider-google/issues/2802
  subnetwork               = var.subnet_self_links["dev-spoke-0"]["northamerica-northeast1/dev-infra-hosting-0-nane1"]
  secondary_range_pods     = var.gke_secondary_range_pods
  secondary_range_services = var.gke_secondary_range_services
  labels                   = {}
  addons = {
    cloudrun_config            = false
    dns_cache_config           = true
    horizontal_pod_autoscaling = true
    http_load_balancing        = false
    istio_config = {
      enabled = false
      tls     = false
    }
    network_policy_config                 = false
    gce_persistent_disk_csi_driver_config = true
    # gcp_filestore_csi_driver_config       = false
    config_connector_config               = false
    kalm_config                           = false
    gke_backup_agent_config               = false
  }
  dns_config = {
    cluster_dns        = "PROVIDER_UNSPECIFIED"
    cluster_dns_scope  = "DNS_SCOPE_UNSPECIFIED"
    cluster_dns_domain = ""
  }
  # authenticator_security_group = var.gke_authenticator_security_group
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
  enable_autopilot            = true
  enable_dataplane_v2         = true
  # enable_intranode_visibility = true
  # enable_shielded_nodes       = true
  # logging_config = null
  logging_service = null
  maintenance_config = {
    daily_maintenance_window = {
      start_time = "02:00"
    }
    recurring_window      = null
    maintenance_exclusion = []
  }
  # currently disabled as per 100 CIDR limit
  # master_authorized_ranges = local.github_actions_cidrs_map
  # monitoring_config = null
  monitoring_service = null
  # node_locations = []
  # peering_config = null
  private_cluster_config = {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "192.168.0.0/28"
    master_global_access    = false
  }
  release_channel = var.gke_release_channel
}

#module "nodepool" {
#  source       = "../../cloud-foundation-fabric/modules/gke-nodepool"
#  project_id   = var.project_id
#  cluster_name = module.cluster.name
#  location     = var.location
#  # autoscaling_config = null
#  initial_node_count = var.gke_nodepool_initial_node_count
#  management_config = {
#    auto_repair  = true
#    auto_upgrade = true
#  }
#  node_preemptible  = var.gke_nodepool_node_preemptible
#  node_disk_size    = var.gke_nodepool_node_disk_size
#  node_image_type   = var.gke_nodepool_node_image_type
#  node_machine_type = var.gke_nodepool_node_machine_type
#  node_tags = [
#    "gke-${module.cluster.name}-${var.project_id}"
#  ]
#}

#resource "helm_release" "argocd" {
#  name             = "argocd"
#  repository       = "https://argoproj.github.io/argo-helm"
#  chart            = "argo-cd"
#  namespace        = "argocd"
#  create_namespace = true
#  values = [
#    "${file("../../deployment-config/configurations/argocd/values.yaml")}"
#  ]
#
#  lifecycle {
#    ignore_changes = [
#      values
#    ]
#  }
#}