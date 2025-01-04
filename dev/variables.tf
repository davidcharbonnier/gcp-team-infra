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

variable "budget_app_container_image_name" {
  type    = string
  default = "fireflyiii/core"
}

variable "budget_app_container_image_tag" {
  type    = string
  default = "latest"
}

variable "budget_app_container_env" {
  type = map(string)
}

variable "budget_app_host" {
  type        = string
  description = "Hostname for budget app"
}

variable "budget_app_static_cron_token" {
  type        = string
  sensitive   = true
  description = "Static token for cron API calls on budget app"
}

variable "budget_app_cron_name" {
  type    = string
  default = "budget-cron"
}

variable "budget_app_cron_description" {
  type    = string
  default = "Budget app scheduled tasks"
}

variable "budget_app_cron_schedule" {
  type = string
}

variable "budget_importer_app_name" {
  type = string
}

variable "budget_importer_app_container_image_name" {
  type    = string
  default = "fireflyiii/data-importer"
}

variable "budget_importer_app_container_image_tag" {
  type    = string
  default = "latest"
}

variable "budget_importer_app_container_env" {
  type = map(string)
}

variable "budget_importer_app_host" {
  type        = string
  description = "Hostname for budget importer app"
}

variable "vpc_connectors" {
  type        = map(string)
  description = "Selflink of Serverless Connectors"
}