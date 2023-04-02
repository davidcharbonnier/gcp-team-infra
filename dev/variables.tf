variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "northamerica-northeast1"
}

variable "vpc_self_links" {
  type = map(string)
}

variable "database_instance_name" {
  type = string
}

variable "database_instance_version" {
  type    = string
  default = "POSTGRES_12"
}

variable "database_instance_tier" {
  type    = string
  default = "db-f1-micro"
}

variable "database_instance_databases" {
  type    = list(string)
  default = null
}

variable "database_instance_users" {
  type    = map(string)
  default = null
}