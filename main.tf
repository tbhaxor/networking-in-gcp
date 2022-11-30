# Core infrastructure course
# https://www.coursera.org/learn/gcp-fundamentals
module "core-infra_auto-mode-vpc" {
  source     = "./modules/core-infra/auto-mode-vpc"
  project_id = var.project_id
}

module "core-infra_cloud-run" {
  source     = "./modules/core-infra/cloud-run"
  project_id = var.project_id
  region     = var.region
  user_name  = var.my_name
  gcr_image  = var.docker_image
}

module "core-infra_autodeploy" {
  source     = "./modules/core-infra/autodeploy"
  project_id = var.project_id
}

module "core-infra_gke" {
  source     = "./modules/core-infra/gke"
  project_id = var.project_id
  zone       = var.zone
}


# Hands on labs course
# https://www.coursera.org/learn/hands-on-labs-google-cloud-networking-engineer/home/welcome
module "hands-on-lab_multiple-custom-vpc" {
  source     = "./modules/hands-on-lab/multiple-custom-vpc"
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
}


module "hands-on-lab_network-performance-testing" {
  source     = "./modules/hands-on-lab/network-performance-testing"
  project_id = var.project_id
}


module "hands-on-lab_ht-vpn" {
  source     = "./modules/hands-on-lab/ht-vpn"
  project_id = var.project_id
}
