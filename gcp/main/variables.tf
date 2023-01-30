variable "var_project" {
  default = "new-infra-new"
}
variable "var_env" {
  default = "dev"
}
variable "var_company" {
  default = "gundas"
}
variable "uc1_private_subnet" {
  default = "10.26.1.0/24"
}
variable "uc1_public_subnet" {
  default = "10.26.2.0/24"
}
variable "ue1_private_subnet" {
  default = "10.26.3.0/24"
}
variable "ue1_public_subnet" {
  default = "10.26.4.0/24"
}
variable "region_uc1" {
  default = "us-central1"
}
variable "region_ue1" {
  default = "us-east1"
}
