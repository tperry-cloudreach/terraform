locals {
  business_unit       = "IT"
  app_id              = "adds"
  environment         = "Prod"
  region              = "UKSouth"
  applicationname     = "Active Directory"
  department          = "Infrastructure"
  costcenter          = "US10GT9015"
  maintenanceschedule = "workinghours=0000-2400 MON-SUN:expiry=none"
  managedby           = "No One"

  apps_id    = "001"

  apps_resource_group_name   = lower("rg-${local.app_id}-traditional-${local.environment}-${local.apps_id}")

  tags = {
    appid               = local.app_id
    businessunit        = local.business_unit
    applicationname     = local.applicationname
    department          = local.department
    costcenter          = local.costcenter
    maintenanceschedule = local.maintenanceschedule
    managedby           = local.managedby
  }
}