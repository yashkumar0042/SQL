output "vpc_self_link" { value = module.vpc.out_vpc_self_link }
output "uc1_public_subnet_info" {
  value = module.uc1.public_subnet_info
}
output "ue1_public_subnet_info" {
  value = module.ue1.public_subnet_info
}
output "uc1_private_subnet_info" {
  value = module.uc1.private_subnet_info
}
output "ue1_private_subnet_info" {
  value = module.ue1.private_subnet_info
}
