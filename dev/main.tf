module "budget_database" {
  source           = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/cloudsql-instance?ref=v21.0.0"
  project_id       = var.project_id
  network          = var.vpc_self_links.dev-spoke-0
  name             = var.database_instance_name
  region           = var.region
  database_version = var.database_instance_version
  tier             = var.database_instance_tier
  databases        = var.database_instance_databases
  users            = var.database_instance_users
  allocated_ip_ranges = {
    primary = "cloudsql-postgresql"
  }
}

#module "budget_app" {
#  source     = "git@github.com:GoogleCloudPlatform/cloud-foundation-fabric.git//modules/cloud-run?ref=v21.0.0"
#  project_id = var.project_id
#  name       = "hello"
#  containers = [{
#    image = "us-docker.pkg.dev/cloudrun/container/hello"
#    options = {
#      command = null
#      args    = null
#      env = {
#        "VAR1" : "VALUE1",
#        "VAR2" : "VALUE2",
#      }
#      env_from = null
#    }
#    ports         = null
#    resources     = null
#    volume_mounts = null
#  }]
#}