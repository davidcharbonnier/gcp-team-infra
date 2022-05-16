variable "host_project_numbers" {
  description = "Host project numbers for the shared VPC."
  type = object({
    dev-spoke-0  = string
    prod-landing = string
    prod-spoke-0 = string
  })
  default = null
}

variable "subnet_self_links" {
  description = "Self link for the shared VPC subnets."
  type = object({
    dev-spoke-0  = map(string)
    prod-landing = map(string)
    prod-spoke-0 = map(string)
  })
  default = null
}

variable "vpc_self_links" {
  description = "Self link for the shared VPC."
  type = object({
    dev-spoke-0  = string
    prod-landing = string
    prod-spoke-0 = string
  })
  default = null
}

variable "host_project_ids" {
  description = "Host project for the shared VPC."
  type = object({
    dev-spoke-0  = string
    prod-landing = string
    prod-spoke-0 = string
  })
  default = null
}

variable "project_id" {
  description = "Project id."
  type        = string
}

variable "location" {
  description = "Region where to create resources."
  type = string
}

variable "gke_cluster_name" {
  description = "Name of GKE cluster."
  type = string
}

variable "gke_secondary_range_pods" {
  description = "Name of GKE secondary IP range for pods."
  type = string
}

variable "gke_secondary_range_services" {
  description = "Name of GKE secondary IP range for services."
  type = string
}

variable "gke_authenticator_security_group" {
  description = "Name of GKE group for authentication."
  type = string
}

variable "gke_release_channel" {
  description = "Name of GKE release channel."
  type = string
}

variable "gke_nodepool_initial_node_count" {
  description = "Initial number of nodes in GKE nodepool."
  type = number
}

variable "gke_nodepool_node_preemptible" {
  description = "GKE nodepool preemptible nodes."
  type = bool
  default = true
}

variable "gke_nodepool_node_disk_size" {
  description = "GKE nodepool node disk size."
  type = number
}

variable "gke_nodepool_node_image_type" {
  description = "GKE nodepool node image type."
  type = string
  default = "cos_containerd"
}

variable "gke_nodepool_node_machine_type" {
  description = "GKE nodepool node machine type."
  type = string
}