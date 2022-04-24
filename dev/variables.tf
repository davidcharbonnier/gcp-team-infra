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