module "budget_database" {
  source           = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/cloudsql-instance?ref=v21.0.0"
  project_id       = var.project_id
  network          = var.vpc_self_links.dev-spoke-0
  name             = var.budget_database_instance_name
  region           = var.region
  database_version = var.budget_database_instance_version
  tier             = var.budget_database_instance_tier
  databases        = [var.budget_database_instance_database]
  users            = { (var.budget_database_instance_user) = null }
  allocated_ip_ranges = {
    primary = "cloudsql-postgresql"
  }
}

resource "random_string" "app_key" {
  length = 32
}

module "budget_app" {
  source     = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/cloud-run?ref=v21.0.0"
  project_id = var.project_id
  name       = var.budget_app_name
  region     = var.region
  containers = [{
    image = var.budget_app_container_image
    options = {
      command = null
      args    = null
      env = merge(
        var.budget_app_container_env,
        {
          APP_KEY       = random_string.app_key.result
          DB_CONNECTION = "pgsql"
          DB_HOST       = module.budget_database.ip
          DB_PORT       = "5432"
          DB_DATABASE   = var.budget_database_instance_database
          DB_USERNAME   = var.budget_database_instance_user
          DB_PASSWORD   = lookup(module.budget_database.user_passwords, var.budget_database_instance_user)
        }
      )
      env_from = null
    }
    ports = [
      {
        name           = "http1"
        protocol       = "TCP"
        container_port = "8080"
      }
    ]
    resources     = null
    volume_mounts = null
  }]
}