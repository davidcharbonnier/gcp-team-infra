project_id  = "dch-dev-infra-hosting-0"
subnet_name = "dev-pf-infra-hosting-svcless-nane1"
# Budget database
budget_database_instance_name     = "budget"
budget_database_instance_database = "firefly"
budget_database_instance_user     = "firefly"
# Budget app
budget_app_name                = "budget"
budget_app_container_image_tag = "version-6.1.25"
budget_app_container_env = {
  APP_NAME                 = "Budget"
  APP_ENV                  = "production"
  SITE_OWNER               = "contact@davidcharbonnier.fr"
  DEFAULT_LANGUAGE         = "fr_FR"
  TZ                       = "America/New_York"
  TRUSTED_PROXIES          = "**"
  LOG_CHANNEL              = "stdout"
  LOG_LEVEL                = "info"
  SEND_ERROR_MESSAGE       = "false"
  SEND_REPORT_JOURNALS     = "false"
  DKR_CHECK_SQLITE         = "false"
  DKR_RUN_MIGRATION        = "true"
  DKR_RUN_UPGRADE          = "true"
  DKR_RUN_VERIFY           = "true"
  DKR_RUN_REPORT           = "true"
  DKR_RUN_PASSPORT_INSTALL = "true"
}
budget_app_host = "budget.davidcharbonnier.fr"
# Budget app cron
budget_app_cron_schedule = "0 3 * * *"
# Budget importer
budget_importer_app_name                = "budget-importer"
budget_importer_app_container_image_tag = "version-1.5.7"
budget_importer_app_container_env = {
  APP_NAME                = "Budget importer"
  APP_ENV                 = "production"
  IGNORE_DUPLICATE_ERRORS = false
  VERIFY_TLS_SECURITY     = true
  CONNECTION_TIMEOUT      = 31.41
  LOG_CHANNEL             = "stdout"
  LOG_LEVEL               = "info"
  TZ                      = "America/New_York"
  EXPECT_SECURE_URL       = true
  TRUSTED_PROXIES         = "**"
}
budget_importer_app_host = "budget-importer.davidcharbonnier.fr"