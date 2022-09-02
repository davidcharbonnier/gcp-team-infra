project_id                   = "dev-infra-hosting-0"
location                     = "northamerica-northeast1-b"
gke_cluster_name             = "hosting"
gke_secondary_range_pods     = "gke-pods"
gke_secondary_range_services = "gke-services"
# gke_authenticator_security_group = "gcp-team-infra@davidcharbonnier.fr"
gke_release_channel             = "RAPID"
gke_nodepool_initial_node_count = 3
gke_nodepool_node_disk_size     = 30
gke_nodepool_node_machine_type  = "e2-small"
external_dns_domains = [
  "davidcharbonnier.fr"
]