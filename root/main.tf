module "iam" {
  source  = "../modules/iam"
  project = var.project
  region  = var.region
}

module "vpc" {
  source         = "../modules/vpc"
  region         = var.region
  cidr_app       = var.cidr_app
  cidr_db        = var.cidr_db
  project_prefix = var.project_prefix
  // Outputs: custom_vpc_selflink, app_subnet_id, db_subnet_id, custom_vpc_name
}


module "flow_logs" {
  source         = "../modules/vpc/flow_logs"
  project_prefix = var.project_prefix
  project        = var.project
}


module "jenkins" {
  source                = "../modules/gce/jenkins"
  project               = var.project
  region                = var.region
  zone                  = var.zone
  jenkins_disk_snapshot = var.jenkins_disk_snapshot
  app_subnet_selflink   = module.vpc.app_subnet_selflink
  project_prefix        = var.project_prefix
}

module "sql" {
  source                 = "../modules/sql"
  network                = module.vpc.custom_vpc_name
  region                 = var.region
  zone                   = var.zone
  project                = var.project
  project_prefix         = var.project_prefix
}


module "firewall" {
  source              = "../modules/vpc/firewalls"
  project             = var.project
  region              = var.region
  jenkins_internal_ip = module.jenkins.jenkins_internal_ip
  project_prefix      = var.project_prefix
}

