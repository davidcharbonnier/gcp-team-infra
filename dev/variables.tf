variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "northamerica-northeast1"
}

variable "subnet_name" {
  type = string
}

variable "vpc_self_links" {
  type = map(string)
}

variable "budget_database_instance_name" {
  type = string
}

variable "budget_database_instance_version" {
  type    = string
  default = "POSTGRES_12"
}

variable "budget_database_instance_tier" {
  type    = string
  default = "db-f1-micro"
}

variable "budget_database_instance_database" {
  type    = string
  default = null
}

variable "budget_database_instance_user" {
  type    = string
  default = null
}

variable "budget_app_name" {
  type = string
}

variable "budget_app_container_image" {
  type    = string
  default = "fireflyiii/core:latest"
}

variable "budget_app_container_env" {
  type = map(string)
}

variable "budget_app_host" {
  type        = string
  description = "Hostname for budget app"
}

variable "dev" {
  type = string
  description = "Selflink of dev Serverless Connector"
}