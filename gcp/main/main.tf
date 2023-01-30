provider "google" {
  project     = "${var.var_project}"
  # credentials = "/terraform/mykey.json"
}

module "vpc" {
  source = "../modules/global" 
  env                   = "${var.var_env}"
  company               = "${var.var_company}"
  var_uc1_public_subnet = "${var.uc1_public_subnet}"
  var_uc1_private_subnet= "${var.uc1_private_subnet}"
  var_ue1_public_subnet = "${var.ue1_public_subnet}"
  var_ue1_private_subnet= "${var.ue1_private_subnet}"
}

module "uc1" {
  source = "../modules/subnet"
  company = var.var_company
  env = var.var_env
  subnet_region = var.region_uc1
  network_self_link = module.vpc.out_vpc_self_link
  var_private_subnet = var.uc1_private_subnet
  var_public_subnet = var.uc1_public_subnet
}
module "ue1" {
  source = "../modules/subnet"
  company = var.var_company
  env = var.var_env
  subnet_region = var.region_ue1
  network_self_link = module.vpc.out_vpc_self_link
  var_private_subnet = var.ue1_private_subnet
  var_public_subnet = var.ue1_public_subnet
}